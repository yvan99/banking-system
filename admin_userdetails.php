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
		<title>User details</title>
		<link rel="icon" href="../favicon.ico" />
		<!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>-->
	   <script src="jsscript/script.js"></script>
		
	</head>
	<body>
		<header>
			<div class="container"><span style='color:white;opacity:0.9;font:bold 25px agency fb;'><center>ALL IN ONE UMURENGE SACCO BANKING SYSTEM</center></span>
				<div style="height:100px;">
					<img src="LOGO1.png"height="150"width="150"style="position:relative;margin-top:-50px;left:70px;">
					<img src="bertinphotodj.png"height="130"width="100"style="position:relative;margin-top:-418px;left:700px;">
				
				
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
						<?php
							include('connect.php');
							$id=@$_GET['user_id'];
							$sql="SELECT *FROM users WHERE user_id='$id'";
							$query=mysql_query($sql);
						    while($result=mysql_fetch_array($query)){
			               ?>
						    <table>
                                        <tr>
											<td><img src="./picture/<?php echo $result['photo'];?>"heiht="40" width="40"</td>
										</tr>
										<tr>
											<td> Names</td><td><?php echo $result['first_name'].$result['last_name'];?></td>
										</tr>
										<tr>
											<td> Gender</td><td><?php echo $result['gender'];?></td>
										</tr>
										<tr>
											<td> Email</td>
											<td><?php echo $result['email'];?></td>
										</tr>
										<tr>
											<td> Passward</td>
											<td><?php echo $result['password'];?></td>
                                        </tr>
                                        <tr>
											<td>Phone_number</td>
											<td><?php echo $result['phone_number'];?></td>
			                         
                                        </tr>
                                        <tr>
											<td>Identity_number</td>

			                          	<td><?php echo $result['identity_number'];?></td>
                                        </tr>
										<tr>
											<td>Post</td>
											 <td><?php echo $result['post'];?></td>
                                        </tr>
										<tr>
											<td>Branch</td>
											 <td><?php echo $result['branch'];?></td>
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