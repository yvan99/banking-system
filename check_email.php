<?php
require_once("connection/konnect.php");

if(!empty($_POST["username"])) {
  $query = mysqli_query($conn,"SELECT * FROM student WHERE st_email='" . $_POST["username"] . "'");
  $user_count = mysqli_num_rows($query);
  if($user_count>0) {
      echo "<span class='status-not-available'> Email Already Taken.</span>";
  }else{
      echo "<span class='status-available'> Email Is Available.</span>";
  }
}
?>