<?php
if(isset($_GET['district']) && !empty($_GET['district'])){
	include "connect.php";
	$idd=$_GET['district'];
	$query="select *from sector where id_d='$idd'";
	$do=mysql_query($query);
	$count=mysql_num_rows($do);
	if($count>0){
		while($row=mysql_fetch_array($do)){
			echo '<option value="'.$row['id'].'">'.$row['sectors'].'</option>';
		}
	}
else{
echo '<option>Not sector available</option>';	
}
}
else{
	
echo '<h1>error</error>';	
}

?>