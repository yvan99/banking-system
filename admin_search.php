
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
		<title>Search user</title>
		<link rel="icon" href="../favicon.ico" />
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	   <script src="jsscript/script.js"></script>
		
	</head>
	<body>
		<header>
			<div class="container">
				<div style="height:100px;">
				 <img src="LOGO1.png"height="150"width="150"style="position:relative;margin-top:-50px;left:70px;">
					<img src="bertinphotodj.png"height="130"width="100"style="position:relative;margin-top:-418px;left:700px;">
				
				</div>
			</div>
		</header>
		
		<section>
			<div class="container"><span style='color:white;opacity:0.9;'><center>WELCOME TO ALL IN ONE UMURENGE SACCO BANKING SYSTEM</center></span>
				<div style="height:100px;">
					<div class="container-left">
					<div id='cssmenu'>
						<ul>
						   <li class='last'><a href='admin_users.php'><span>users</span></a></li>
						   <li class='last'><a href='admin_adduser.php'><span>Add user</span></a></li>
						   <li class='last'><a href='logout.php'><span>Logout</span></a></li>
						</ul>
					</div>
				</div>
				<div class="container-right">
					<div>
						<div id="search"align="center">
							<form action="" method="POST">
								<input type="text"name="search" style="width:300px;" placeholder="SEARCH USER HERE!!!!!!!">
								<input type="submit"value="search">
							</form>
						</div>
				
				<?php
					include("connect.php");
						if (isset($_POST['search'])) {
								$search_key=$_POST['search'];
								if (!$search_key) {
									echo "Identify the customer you want to search please!!";
								}
									else{
								$query 	=	"SELECT * FROM users WHERE first_name LIKE '%".$search_key."%' OR email LIKE '%".$search_key."%' OR identity_number LIKE '%".$search_key."%'";

		                       $exec=mysql_query($query);
							if(mysql_num_rows($exec)>0) {
								?>
						       <table>
						       		<form action"admin_search.php"method="POST">
										<tr style="background:#1C4B7D none repeat scroll 0% 0%;color:white">
											<td>Fistname</td>
											<td>Lastname</td>
											<td>Photo</td>
											<td colspan="5">Operation</td>
										</tr>
										<?php
										while ($result=mysql_fetch_array($exec)){
									   		?>
											<tr>
												<td><?php echo $result ['first_name'];?></td>
												<td><?php echo $result ['last_name'];?></td>
												<td> <img src="./photo/<?php echo $result['photo'];?>" width="40" height="40"></td>
												<td><a href="admin_userdetails.php?user_id=<?php echo $result['user_id'];?>">Details</a></td>
			                          	<td><a href="admin_userupdate.php?user_id=<?php echo $result['user_id'];?>">update</a></td>
			                          	<td><a href="admin_delete.php?user_id=<?php echo $result['user_id'];?>">Delete</a></td>
			                          </tr>
			                    
											<?php 
										}
										?>
									</from>
								</table>
								<?php
							}
							else{
								echo 'No result found about ['.$search_key.']';
							}
						}}
						?>
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