<?php
session_start();
if (!isset($_SESSION['user'])) {

	header("location:login.php?msg=please first login again");
}

?>
<?php
require 'connect.php';
if(isset($_GET['id'])){
	$customer_id	=	(int)$_GET['id'];
	//Showing details about a customer whose id has been set
	$c_details		=	mysql_query('SELECT * FROM customers WHERE id ='.$customer_id);
	$get_customer	=	mysql_fetch_array($c_details);
	$get_customer_accounts	=	mysql_query('SELECT account_number, balance, account_holder FROM accounts WHERE account_holder = '.$customer_id);
}
else{
	header('Location:customers.php');
}
?>
<!DOCTYPE HTML>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en"> <!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/vcssmenu.css" />
		<link rel="stylesheet" type="text/css" href="index.css" />
		<title>Customer details</title>
		<link rel="icon" href="../favicon.ico" />
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	   <script src="jsscript/script.js"></script>
		
	</head>
	<body>
		<header>
			<div class="container"><span style='color:white;opacity:0.9;font:bold 25px agency fb;'><center>UMURENGE SACCO IN ONE CONNECT SYSTEM</center></span>
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
						   <li class='last'><a href='customers.php'><span>Customers</span></a></li>
							<li class='last'><a href='index.php'><span>Add customer</span></a></li>
						   <li class='last'><a href='logout.php'><span>Logout</span></a></li>
						</ul>
					</div>
				</div>
				<?php
				function get_sector_name($id){
					$query = mysql_query('SELECT * FROM sector WHERE id = '.$id);
					$result= mysql_fetch_assoc($query);
					return $result['sectors'];
				}
				?>
				<div class="container-right">
					<div>
						<!--<div><span style='color:green;font-size:22px';>Customer details</span><br> Customer ID: <?php echo $customer_id;?></div>-->
						<div><img src="./picture/<?php echo $get_customer['photo'];?>" width="60" height="50"></div>
						<table>
							<tr>
								<td>
									Names
								</td>
								<td><?php echo $get_customer['customer_first_name'].' '.$get_customer['customer_last_name'];?><td>
							</tr>
							<tr>
								<td>Birth date</td>
								<td><?php echo $get_customer['birthdate'];?></td>
							</tr>
							<tr>
								<td>Nationa ID card number</td>
								<td><?php echo $get_customer['customer_id_card_number'];?></td>
							</tr>
							<tr>
								<td>Gender</td>
								<td><?php echo $get_customer['gender'];?></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><?php echo $get_customer['customer_email'];?></td>
							</tr>
							<tr>
								<td>Phone Number</td>
								<td><?php echo $get_customer['customer_phone_number'];?></td>
							</tr>
							<tr>
								<td>Living Address</td>
								<td><?php echo get_sector_name($get_customer['customer_address']);?></td>
							</tr>
							<tr>
								<td>
									Customer accounts
								</td>
								<td>
									<ul>
									<?php
									while($get_account = mysql_fetch_assoc($get_customer_accounts)){
										?>
											<li>A/C number: <?php echo $get_account['account_number'];?> | Balance: <?php echo $get_account['balance'];?></li>
										<?php
									}
									?>
									</ul>
								</td>
							</tr>
						</table>
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