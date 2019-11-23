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
		<title>Customer withdraw</title>
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
						<!--<ul>
						   <li class='last'><a href='customer_details.php'><span>customers</span></a></li>
						   <li class='last'><a href='index.php'><span>Add customers</span></a></li>
						   <li class='last'><a href='transfer_money.php'><span>Money transfer</span></a></li>
						   <li class='last'><a href='logout.php'><span>Logout</span></a></li>
						</ul>-->
					</div>
				</div>
				<div class="container-right">
					<div>
					</div>
						<?php
						require_once("connect.php");
						if(isset($_POST['withdraw']) AND !empty($_POST['amount'])){
							$old_balance = (int)$_POST['old_balance'];
							$account_holder	=	(int)$_POST['account_holder'];
							$account_number	=	htmlspecialchars($_POST['account_number']);
							$sectors		=	array();
							$sectors_info	=	explode('-', $account_number);
							$sector_id 		=	$sectors_info[0];
							$amount_withdraw = (int)$_POST['amount'];
							$new_balance	=	$old_balance - $amount_withdraw;
							if($new_balance<1500){
								echo '<font color="red">sorry you don\'t have enough balance to perfom this action.</font>';
							}
							else{
								mysql_query('UPDATE accounts SET balance = '.$new_balance.' WHERE account_holder = '.$account_holder);
								mysql_query('INSERT INTO operations VALUES(NULL, "withdraw", "'.$account_number.'","'.$amount_withdraw.'", '.$_SESSION['user_id'].', 1, '.time().')');
                      		  	
                                //banksleep

                            function get_sector_name($id){
								$query = mysql_query('SELECT * FROM sector WHERE id = '.$id);
								$result= mysql_fetch_assoc($query);
								return $result['sectors'];
							}
							function get_user_names($id){
								$query = mysql_query('SELECT * FROM users WHERE user_id = '.$id);
								$result= mysql_fetch_assoc($query);
								return $result['first_name'].' '.$result['last_name'];
							}
							?> 
	                        <div style="background:url('sacco.png') no-repeat;background-size:580px; width:500px;border:1px dashed black;padding:2px 40px 80px 40px;font-size:12px;">
					        	<h3 align="center">Umurenge Sacco</h3>
					            Branch      :<b>SACCO&nbsp&nbsp<?php echo get_sector_name($sector_id);?></b> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Date: <b><?php echo date("d-m-Y, h:i:s", time());?></b><br>           
					            Account No  :<b><?php echo $account_number;?></b><br>
					            Teller      :<b><?php echo get_user_names($_SESSION['user_id']);?></b><br>
					           <!-- Motif       ............................../..[Depositor Name]..<br><br> -->
	                        	<hr style=" width:500px; float:left;"><br>
	                        	Amount    	:<b><?php echo $amount_withdraw;?></b><br>
	                        	We deposit on account no <b><?php echo $account_number;?></b> an amount of <b><?php echo $amount_withdraw;?></b><br>
	                        	<hr style=" width:500px; float:left;"><br><br>
	                        	Client Signature&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp&nbsp&nbspTeller Signature
	                        	<br><span style="float:right">OPERATION PROCESED</span>
								</div>
			                      <!--BUTTON OF PRINTING-->
		                        <script type="text/javascript">
		                      		function printpage(){
	                           			document.getElementById('printbutton').style.visibility='hidden';
		                       			window.print();
		                      			document.getElementById('printbutton').style.visibility='visible';
	                         		}
	                        	</script>
		    					<input type="button"value="print"name="printbutton"onclick="printpage()"id="printbutton">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="customers.php">Back</a>					
								<?php
								exit();
							}
						}
						$id=($_GET['id']);
						$sql='SELECT * FROM customers LEFT JOIN accounts ON customers.id = accounts.account_holder WHERE customers.id='.$id;
						$query=mysql_query($sql) or die(mysql_error());
						$result=mysql_fetch_assoc($query);
						?>
						<table>
							<form action="" method="POST"> 
								<tr height="120">
									<td>Photo</td>
									<td>Names</td>
									<td>Account</td>
									<td>balance</td>
								</tr>
									<tr>
										<td><img src="picture/<?php echo $result['photo'];?>" height="60"width="60"/></td>
										</td>
										<td><?php echo $result['customer_first_name'].' '.$result['customer_last_name'];?></td>
										</td>
										<td><?php echo $result['account_number'];?></td>
										</td>
										<td>|<?php echo $result['balance'];?>Frw</td>
										</td>
										
										
									</tr>
								<tr>
									<td>
										<legend>Withdraw</legend>
									</td>
	                            </tr>
	                            <tr>
	                            	<td>
	                            		<label >Amount </label>
	                            	</td>
									<td>
										<lable>
											<input type="text" required name="amount" placeholder="Put here amount to withdraw">
											<input type = "hidden" name = "old_balance" value="<?php echo $result['balance'];?>" />
											<input type="hidden" name="account_holder" value="<?php echo $result['account_holder'];?>" />
											<input type="hidden" name="account_number" value="<?php echo $result['account_number'];?>" />

										</lable>
									</td>
	                            </tr>
	                            <tr>
	                            	<td colspan="2"align="center">
									<button type="submit" name="withdraw">Withdraw</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="customers.php">Back</a>

								</td>
								</tr>
							</form>
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