<?php
if(isset($_GET['province']) && !empty($_GET['province'])){
	include "connect.php";
	$id=$_GET['province'];
	$query="select *from districts where IDpr='$id'";
	$do=mysql_query($query);
	$count=mysql_num_rows($do);
	if($count>0){
		while($row=mysql_fetch_array($do)){
			echo '<option value="'.$row['id_d'].'">'.$row['districtname'].'</option>';
		}
	}
else{
echo '<option>Not district available</option>';	
}
}
else{
	
echo '<h1>error</error>';	
}

?>