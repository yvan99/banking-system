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
		<title>Customer history</title>
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
				<div class="container-left">
					<div id='cssmenu'>
						<ul>
						   <li class='last'><a href='customers.php'><span>customers</span></a></li>
						   <li class='last'><a href='index.php'><span>Add customers</span></a></li>
						   <li class='last'><a href='transfer_money.php'><span>Money transfer</span></a></li>
						   <li class='last'><a href='logout.php'><span>Logout</span></a></li>
						</ul>
					</div>
				</div>
				<div class="container-right">
					<?php
					include 'connect.php';
					if(isset($_GET['account_number'])){
						function get_account_holder($account){
							$k	=	mysql_query('SELECT * FROM customers RIGHT JOIN accounts ON accounts.account_holder = customers.id WHERE account_number = "'.$account.'"');
							$res=	mysql_fetch_assoc($k);
							return $res['customer_first_name'].' '.$res['customer_last_name'];
						}
						function get_user_names($user_id){
							$k	=	mysql_query('SELECT first_name, last_name, user_id FROM users WHERE user_id = '.$user_id);
							$res=	mysql_fetch_array($k);
							return $res['first_name'].' '.$res['last_name'];
						}
						function get_user_branch($user_id){
							$k	=	mysql_query('SELECT id, sectors, user_id, branch FROM users LEFT JOIN sector ON users.branch = sector.id WHERE user_id = '.$user_id);
							$res=	mysql_fetch_array($k);
							return strtolower($res['sectors']);
						}
						$show_historique	=	mysql_query('SELECT * FROM operations LEFT JOIN accounts ON operations.operation_account = accounts.account_number LEFT JOIN customers ON accounts.account_holder = customers.id WHERE operation_account = "'.$_GET['account_number'].'"');
						?>
						<div>
							Historique of the account : <?php echo $_GET['account_number'];?><br />
							Customer Name: <?php echo get_account_holder($_GET['account_number']);?>
						</div>
						<table>
							<tr style="background:#1C4B7D none repeat scroll 0% 0%;color:white">
								<td>#</td>
								<td>Operation</td>
								<td>Amount</td>
								<td>Bank teller</td>
								<td>Branch</td>
								<td>Status</td>
								<td align="center">Time</td>
							</tr>
							<?php
							$i=1;
							while($get_operation	=	mysql_fetch_assoc($show_historique)){
								?>
								<tr>
									<td><?php echo $i;?></td>
									<td><?php echo $get_operation['operation_type'];?></td>
									<td><?php echo $get_operation['operation_amount'];?></td>
									<td><?php echo get_user_names($get_operation['operation_operator']);?></td>
									<td style="text-transform:capitalize;"><?php echo get_user_branch($get_operation['operation_operator']);?></td>
									<td><?php
									if($get_operation['operation_status'] == 1)
									 	echo '<span style="color:green;">Successful</span>';
									else
										echo '<span style="color:red;">Unsuccessful</span>';
									?>
								</td>
									<td><?php echo date("M, d Y",$get_operation['operation_time']);?> at <?php echo date("h:i",$get_operation['operation_time']);?></td>
								</tr>
								<?php
								$i++;
							}
							?>
						</table>
						<?php
					}
					?>
				</div>
			</div>
		</section>
		<footer>
			<div class="container">
				<p class="copyright">COPY © RIGHT RESERVEDE 2017: CREATED BY SHAMIM IRENE USANASE.</p>

			</div>

		</footer>
	</body>
</html>
