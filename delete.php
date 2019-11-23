<?php
require_once("connect.php");
$id=$_GET['id'];
$query="DELETE FROM customers WHERE id='$id'";
$exec=mysql_query($query);
header('location:select.php');
?>