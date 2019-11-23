
<?php
session_start();
if (!isset($_SESSION['user'])) {

	header("location:login.php?msg=please first login again");
}

?>
<?php
require_once("connect.php");
$id=$_GET['user_id'];
$query="UPDATE users SET password='' WHERE user_id ='$id'";
$exec=mysql_query($query)or die(mysql_error());
header('location:admin_users.php');
?>