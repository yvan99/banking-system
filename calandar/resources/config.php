<?php
class DBConnector{
	function __construct($db="tct_registration",$server="127.0.0.1",$user="root",$password=""){
		$con = mysql_connect($server,$user,$password);
		return mysql_select_db($db,$con);
	}
	public function select1cell($tbl,$field,$condition=null,$return_data=true){
		$sql = "SELECT `".$field."` FROM `".$tbl."`";
		if($condition !=null && count($condition) >0){
			$sql .= " WHERE";
			foreach($condition as $key=>$value) $sql .= " && `".$key."` = '".$value."'";
		}
		$sql = preg_replace("/WHERE &&/","WHERE ",$sql);
		$result = mysql_query($sql)or die(mysql_error());			
		if($result){
			$res = mysql_fetch_array($result,MYSQL_ASSOC);
			if($return_data === true)return $res[$field];
			else return $res;
		}
		return null;
	}
	public function selectFields($tbl,$field,$condition=null,$limit=null,$order="",$indexed=true,$sign='='){
		if(count($field) < 1) return null;
 		$sql = "SELECT ";
		foreach($field as $value) $sql .= ", `".$value."`";
		$sql .= " FROM `".$tbl."`";
		if($condition != null){
			$sql .= " WHERE";# var_dump($condition);
			foreach($condition as $key=>$value){
				#var_dump($value);
				$sql .= " && `".$key."` ".$sign." '".$value."'";
			}
		}
		$sql = preg_replace(array("/WHERE &&/","/SELECT ,/"),array("WHERE ","SELECT "),$sql);
		if($order !="") $sql .= " ".$order." ";
		if($limit != null && count($limit) == 2) $sql .= " LIMIT ".$limit[0].", ".$limit[1];
		#echo $sql;
		$result = mysql_query($sql)or die(mysql_error());			
		if($result){
			$res; $rtn=array(); $count=0;
			if($indexed == true){
				while($row = mysql_fetch_array($result,MYSQL_ASSOC)){
					$rtn[$count] = $row;
					$count++;
				}
			}
			if($indexed == false){
				while($row = mysql_fetch_array($result,MYSQL_NUM)){
					$rtn[$count] = $row;
					$count++;
				}
			}
			return $rtn;
		}
		return null;
	}
	public function selectInMoreTable($lbl,$multirows=false,$indexed=false){
		$sql = "SELECT "; $tbl = $lbl['tbl']; $condition = $lbl['condition']; $field = $lbl['fld'];
		#try to extract all fields from first table
		for($i=0;$i<count($tbl);$i++){
			$fld = $field[$tbl[$i]];
			foreach($fld as $value) $sql .= "`".$tbl[$i]."`.`".$value."`, "; 
		}
		$sql .= "FROM ";
		foreach($tbl as $value) $sql .= "`".$value."`, ";
		$sql .= "WHERE ";
		foreach($condition as $key=>$value){
			if(!preg_match('/`/',$value)) $sql .= "&& `".$key."`='".$value."' ";
			else $sql .= "&& `".$key."`=`".$value."` ";
		}
		$look_for = array("/, FROM/","/, WHERE/","/WHERE &&/");
		$replace_with = array(" FROM"," WHERE","WHERE ");
		$sql = preg_replace($look_for,$replace_with,$sql);
		#echo $sql;
		$result = mysql_query($sql)or die("Invalid data provided ".mysql_error());
		#start out put
		if($multirows == false && $indexed == false) return mysql_fetch_array($result,MYSQL_NUM);
		if($multirows == false && $indexed == true) return mysql_fetch_array($result,MYSQL_ASSOC);
		if($multirows == true){
			$dt = array(); $count=0;
			if($indexed == false){
				while($row = mysql_fetch_array($result,MYSQL_NUM)){
					$dt[$count] = $row;
					$count++;
				}
			}
			if($indexed == true){
				while($row = mysql_fetch_array($result,MYSQL_ASSOC)){
					$dt[$count] = $row;
					$count++;
				}
			}
			return $dt;
		}
	}
	public function InsertIfNotExist($tbl,$data,$condition,$auto_increment=true){
		/*check if to inset or not*/
		$insert = true;
		if($condition != NULL && count($condition)>0){
			$check = "SELECT * FROM `".$tbl."` WHERE ";
			foreach($condition as $key=>$value){
				$check .= "&& `".$key."`='".$value."' ";
			}
			$check = preg_replace("/WHERE &&/","WHERE",$check);
			#echo $check;
			$res = mysql_query($check)or die(mysql_error());
			if(mysql_num_rows($res)>0) $insert = false;
		}
		if($insert == true){
			$sql = "INSERT INTO `".$tbl."` SET ";
			if($auto_increment) $sql .= " ID=NULL";
			foreach($data as $key=>$value){
				if($value == "NOW()") $sql .= ", `".$key."`=".$value."";
				else $sql .= ", `".$key."`='".$value."'";
			}
			$sql = preg_replace('/SET ,/','SET',$sql);
			#echo $sql;
			mysql_query($sql)or die(mysql_error());
		}
	}
	public function InsertOrUpdate($tbl,$data,$id_increment=true,$condition=null,$referencefield="ErrorCount",$replace=false){
		$check = 1; $sql="";
		if($condition != null){
			$sql = "SELECT * FROM `".$tbl."` WHERE ";
			foreach($condition as $a=>$b){
				$sql .= "&& `".$a."`='".$b."'";
			}
			$sql = preg_replace("/WHERE &&/","WHERE",$sql);
			#echo $sql;
			$result = mysql_query($sql)or die(mysql_error());
			if($result &&  mysql_num_rows($result) > 0 ) $check = 2;
		}
		#echo $check;
		if($check == 1){
			$sql = "INSERT INTO `".$tbl."` SET ";
			if($id_increment == true) $sql .="`ID`=NULL";
			foreach($data as $key=>$value){
				if($value == "NOW()") $sql .= ", `".$key."`=".$value."";
				else $sql .= ", `".$key."`='".$value."'";
			}
			$sql = preg_replace('/SET ,/','SET ',$sql);
		}
		elseif($check == 2){
			$sql = "UPDATE `".$tbl."` SET ";
			foreach($data as $key=>$value) {
				if($key == $referencefield && !$replace){
					if(is_numeric($value))$sql .= ", `".$key."`=".$key."+".$value."";
					else{
						$ext = DBConnector::select1cell($tbl,$key,$condition,true,false);
						#var_dump($ext);
						$sql .= ", `".$key."`=\"".trim($ext." ".$value)."\"";
					}
				}
				else{
					if($value == "NOW()") $sql .= ", `".$key."`=".$value."";
					else $sql .= ", `".$key."`='".$value."'";
				}
			}
			$sql .= " WHERE ";
			foreach($condition as $key=>$value) $sql .= "&& `".$key."`='".$value."'";
			$look_for = array("/SET ,/","/WHERE &&/");
			$replace_with = array("SET ","WHERE");
			$sql = preg_replace($look_for,$replace_with,$sql);
		}
		#echo $sql;return;
		mysql_query($sql)or die(mysql_error());
	}
	public function selectOneRowFromTable($tbl,$condition,$indexed=false){
		$sql = "SELECT*FROM `".$tbl."` WHERE ";
		foreach($condition as $key=>$value) $sql .= "&& `".$key."`='".$value."'";
		$sql = preg_replace("/WHERE &&/","WHERE ",$sql);
		#$sql;
		$res = mysql_query($sql)or die(mysql_error());
		if($res){
			if($indexed === false) return mysql_fetch_array($res,MYSQL_NUM);
			if($indexed === true) return mysql_fetch_array($res,MYSQL_ASSOC);
		}
		return null;
	}
	public static function InsertData($tbl,$data,$id_increment=true){
		$sql = "INSERT INTO `".$tbl."` SET ";
		if($id_increment == true) $sql .="`ID`=NULL";
		foreach($data as $key=>$value){
			if($value == 'NOW()') $sql .= ", `".$key."`=".$value ; 
			else $sql .= ", `".$key."`=\"".$value."\"";
		}
		$sql = preg_replace('/SET ,/','SET ',$sql);
		#echo $sql;
		mysql_query($sql)or die(mysql_error());
	}
	public function delete1row($tbl=null,$condition=null){
		if($tbl == null) return null;
		$sql = "DELETE FROM `".$tbl."`";
		if(count($condition) > 0){
			$sql .= " WHERE ";
			foreach($condition as $field=>$value) $sql .= "&& `".$field."`='".$value."'";
			$sql = preg_replace("/WHERE &&/","WHERE",$sql);
			#echo $sql;
		}
		mysql_query($sql);
	}
	public static function updateCells($data=null,$tbl="",$condition=null){
		if($tbl == "" || $data == null || count($data) <1) return null;
		$sql = "UPDATE `".$tbl."` SET";
		foreach($data as $fld=>$value) $sql .= " ,`".$fld."`='".$value."' ";
		if($condition != null){
			$sql .= "WHERE ";
			foreach($condition as $field=>$value) $sql .= ", `".$field."`='".$value."'";
		}
		$sql = preg_replace(array('/SET ,/','/WHERE ,/'),array('SET ','WHERE '),$sql);
		//echo $sql;
		//return;
		mysql_query($sql)or die(mysql_error());
	}
	public function emptyTables($tbl){
		mysql_query("TRUNCATE TABLE `".$tbl."`");
	}
	public function selectAllInTable($tbl,$indexed=false,$condition=null ,$order=""){
		if($tbl == "" || $tbl == null) return null;
		$sql = "SELECT * FROM `".$tbl."` ";
		if($condition != null && count($condition)>0) {
			$sql .= "WHERE ";
			foreach($condition as $key=>$value) $sql .= "&& `".$key."`='".$value."' ";
		}
		if($order != "") $sql .= $order;
		$sql = preg_replace('/WHERE &&/','WHERE',$sql);
		#echo $sql;
		$rs = mysql_query($sql)or die(mysql_error());
		$res = array();
		if($rs && mysql_num_rows($rs) >0){
			$i=0;
			if($indexed == false){
				while($row = mysql_fetch_array($rs,MYSQL_NUM)){
					$res[$i] = $row;
					$i++;
				}
			}
			if($indexed == true){
				while($row = mysql_fetch_array($rs,MYSQL_ASSOC)){
					$res[$i] = $row;
					$i++;
				}
			}
			return $res;
		}
		return null;
	}
	static function selectMax($tbl,$fld,$rtn=false){
		$result = mysql_query("SELECT MAX(`".$fld."`) FROM `".$tbl."`");
		$res = mysql_fetch_array($result,MYSQL_NUM);
		if($rtn == true) return $res;
		if($rtn == false) return $res[0];
		return null;
	}
	static function selectMin($tbl,$fld,$rtn=false){
		$result = mysql_query("SELECT MIN(`".$fld."`) FROM `".$tbl."`");
		$res = mysql_fetch_array($result,MYSQL_NUM);
		if($rtn == true) return $res;
		if($rtn == false) return $res[0];
		return null;
	}
}
function Reg_Number($type,$number){
	$rg = "GS";
	if($type == 1) $rg = "PS";
	$year = date("y");
	$n = "000";
	if($number<10) $n = "00".$number;
	elseif($number<100) $n = "0".$number;
	else $n = $number;
	return $rg.$year.$n;
}
?>