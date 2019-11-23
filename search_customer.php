
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
		<title>Search customer</title>
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
			<div class="container"><span style='color:white;opacity:0.9;font:bold 25px agency fb;'><center>WELCOME TO UMURENGE SACCO IN ONE CONNECT SYSTEM</center></span>
				<div style="height:100px;">
					<div class="container-left">
					<div id='cssmenu'>
						<ul>
						   <li class='last'><a href='customers.php'><span>customers</span></a></li>
						   <li class='last'><a href='index.php'><span>Add customers</span></a></li>
						   <li class='last'><a href='index.php'><span>Mony transfer</span></a></li>
						   <li class='last'><a href='logout.php'><span>Logout</span></a></li>
						</ul>
					</div>
				</div>
				<div class="container-right">
					<div>
						<div id="search"align="center">
							<form action="" method="POST">
								<input type="text"name="search" style="width:300px;" placeholder="SEARCH CUSTOMER HERE!!!!!!!">
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
								$query 	=	"SELECT * FROM customers LEFT JOIN accounts ON customers.id=accounts.account_holder WHERE account_number LIKE '%".$search_key."%' OR customer_first_name LIKE '%".$search_key."%' OR customer_last_name LIKE '%".$search_key."%' OR customer_id_card_number LIKE '%".$search_key."%'";

								$exec=mysql_query($query);
							if(mysql_num_rows($exec)>0) {
								?>
						       <table>
						       		<form action"search_customer.php"method="POST">
										<tr style="background:#1C4B7D none repeat scroll 0% 0%;color:white">
											<td>#</td>
											<td>Fistname</td>
											<td>Lastname</td>
											<td>Photo</td>
											<td colspan="5">Operation</td>
										</tr>
										<?php
										while ($result=mysql_fetch_array($exec)){
									   		?>
											<tr>
												<td><?php echo $result ['id'];?></td>
											    <td><?php echo $result ['customer_first_name'];?></td>
												<td><?php echo $result ['customer_last_name'];?></td>
												<td> <img src="./picture/<?php echo $result['photo'];?>" width="40" height="40"></td>
												<td><a href="customer_details.php?id=<?php echo $result['id'];?>">Details</a></td>
												<td><a href="customer_deposit.php?id=<?php echo $result['id'];?>">Deposit</a></td>
												<td><a href="customer_withdraw.php?id=<?php echo $result['id'];?>">Withdraw</a></td>
												<td><a href="historique.php?account_number=<?php echo $result['account_number'];?>">History</a></td>
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
				<p class="copyright">© 2017 for umurenge sacco banking system. All rights reserved.</p>

			</div>

		</footer>
	</body>
</html>