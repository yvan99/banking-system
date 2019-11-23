<?php
mysql_connect("127.0.0.1","root","") or die("Server Error: ".mysql_error());
mysql_select_db('bank')  or die("Database Error: ".mysql_error());
?>