
<?php
session_start();
if (!isset($_SESSION['user'])) {

	header("location:login.php?msg=please first login again");
}

?>

<!DOCTYPE HTML>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/vcssmenu.css" />
		<link rel="stylesheet" type="text/css" href="index.css" />
		<title>Users</title>
		<link rel="icon" href="../favicon.ico" />
		<!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>-->
	   <script src="jsscript/script.js"></script>
		
	</head>
	<body>
		<header>
			<div class="container"><span style='color:white;opacity:0.9;font:bold 25px agency fb;'><center> ALL IN ONE UMURENGE SACCO BANKING SYSTEM</center></span>
				<div style="height:100px;">
					<img src="LOGO1.png"height="150"width="150"style="position:relative;margin-top:-50px;left:-30px;">
					<img src="bertinphotodj.png"height="130"width="100"style="position:relative;margin-top:-418px;left:850px;">
				
				</div>
			</div>
		</header>
		
		<section>
			<div class="container">
				<div style="height:100px;">
				<div class="container-left">
					<div id='cssmenu'>
						<ul>
						   <li class='last'><a href='admin_users.php'><span>Users</span></a></li>
						   <li class='last'><a href='admin_adduser.php'><span>Add Users</span></a></li>
						   <li class='last'><a href='logout.php'><span>Logout</span></a></li>
						</ul>
					</div>
				</div>
				<div class="container-right">
					<div>
						<div id="search"align="center">
							<form action="admin_search.php" method="POST">
								<input type="text"name="search" style="width:300px;" placeholder="PLEASE SEARCH USER HERE!!!!!!!">
								<input type="submit"value="search">
							</form>

						</div>
				
						<?php
							include('connect.php');
							$sql='SELECT *FROM users WHERE password !="" ORDER BY user_id DESC LIMIT 5';
							$query=mysql_query($sql);
							$result=mysql_fetch_assoc($query);
						?>
						  <table>
										<tr style="background:#1C4B7D none repeat scroll 0% 0%;color:white">
											<!--<td><b>user_id</b></td>-->
											<td><b> Firstname</b></td>
											<td><b>Lastname</b></td>
											<!--<td><b> email</b></td>
											<td><b> passward</b></td>
											<td><b> branch</b></td>-->
											<td><b> Photo</b></td>
											<td colspan="2"><b>Operation</b></td>
										</tr>
									<?php
									 while($result=mysql_fetch_assoc($query)){
			                        ?>
			                          <tr>
			                          <!--	<td><?php echo $result['user_id'];?></td>-->
			                          	<td><?php echo $result['first_name'];?></td>
			                          	<td><?php echo $result['last_name'];?></td>
			                          	<!--<td><?php echo $result['email'];?></td>
			                          	<td><?php echo $result['password'];?></td>
			                          	<td><?php echo $result['branch'];?></td>-->
			                          	<td> <img src="./photo/<?php echo $result['photo'];?>" width="40" height="40"></td>
			                          	<td><a href="admin_userdetails.php?user_id=<?php echo $result['user_id'];?>">Details</a></td>
			                          	<td><a href="admin_userupdate.php?user_id=<?php echo $result['user_id'];?>">Update</a></td>
			                          	<td><a href="admin_delete.php?user_id=<?php echo $result['user_id'];?>">Delete</a></td>
			                          </tr>
			                    
			                        <?php
			                        }
			                       ?>
						  </table>
                    </div>
				</div>
			</div>
		</section>
		<footer>
			<div class="container">
				<p class="copyright">COPY © RIGHT ALL RESERVED 2017: CREATED BY SHAMIM IRENE USANASE.</p>

			</div>

		</footer>
	</body>
</html>