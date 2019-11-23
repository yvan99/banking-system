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
		<title>Money transfer</title>
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
						   <li class='last'><a href='customer_details.php'><span>customers</span></a></li>
						   <li class='last'><a href='index.php'><span>Add customers</span></a></li>
						   <li class='last'><a href='transfer_money.php'><span>Money transfer</span></a></li>
						   <li class='last'><a href='logout.php'><span>Logout</span></a></li>
						</ul>
					</div>
				</div>
				<div class="container-right">
					<div>
					</div>
						<table>
							<form action="" method="post"> 
								<tr height="100">
									<td>
									    From account:&nbsp&nbsp&nbsp<input type="text"name="from"placeholder="Account transfer">
									</td>
								</tr>
								<tr height="100">
									<td>
									    To account: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text"name="to"placeholder="To which account">
									</td>
								</tr>
								<tr>
									<tr height="100">
									<td>
									    Amount money:&nbsp<input type="text" name="amount" placeholder="Amount money to be transfering">
									</td>
								</tr>
	                              <td colspan="2"align="center">
									<button type="submit" name="check">Start transfer</a></button>
								  </td>
								</tr>
							</form>
						</table>
						<?php
						require_once("connect.php");
						function getaccountinfo($account){
							$query=mysql_query('SELECT * FROM accounts LEFT JOIN customers ON accounts.account_holder=customers.id WHERE account_number="'.$account.'"');
							return $query;
						}
						function get_account_balance($account){
							$sql	=	mysql_query('SELECT account_number, balance FROM accounts WHERE account_number = "'.$account.'"') OR die(mysql_error());
							$result	=	mysql_fetch_array($sql);
							return $result['balance'];
						}
						function update_account_balance($account, $amount){
							mysql_query('UPDATE accounts SET balance = '.$amount.' WHERE account_number = "'.$account.'"') or die(mysql_error());
						}
						 if (isset($_POST['check']) AND !empty($_POST['amount'])) {
						  	$account_from	=	htmlspecialchars($_POST['from']);
						  	$account_to		=	htmlspecialchars($_POST['to']);
						  	$amount 		=	(int)$_POST['amount'];
						  	if(mysql_num_rows(getaccountinfo($account_from)) == 0){
						  		//The entered account number "from" does not exist.
						  		$account_from_error	=	true;
						  		echo "<span style='color:red;font-size:13px;opacity:0.9;'>The account from does not exist<br />";
						  	}
						  	else
						  		$account_from_error	=	false;
						  	if(mysql_num_rows(getaccountinfo($account_to)) == 0){
						  		//The entered account number "to" does not exist.
						  		$account_to_error	=	true;
						  		echo "<span style='color:red;font-size:13px;opacity:0.9;'>The account to does not exist<br />";
						  	}
						  	else
						  		$account_to_error	=	false;
						  	if($account_from_error OR $account_to_error){
						  		echo "<span style='color:green;'>So, we can not make any money transfer due to some account number errors</span><br />";
						  	}
						  	else{
						  		//All accounts are fine.
						  		//Checking if the from account has enough balance to send
						  		$from_new_balance	=	get_account_balance($account_from) - $amount;
						  		if($from_new_balance < 1500){
						  			//The sender does not have enough balance.
						  			echo "<span style='color:green;'>The sender does not have enough balance to make this transaction</span><br/>";
						  		}
						  		else{
						  			//Now everything is fine, money transfer can be made,.
						  			$to_new_balance =	get_account_balance($account_to) + $amount;
						  			//Save records
						  			$update_from_account	=	update_account_balance($account_from, $from_new_balance);
						  			$update_to_account		=	update_account_balance($account_to, $to_new_balance);
						  			if(mysql_query('INSERT INTO transactions VALUES(NULL, "'.$account_from.'", "'.$account_to.'", "'.$amount.'", '.time().', '.$_SESSION['user_id'].',0)') OR die(mysql_error())){
						  				//Operation successful.
						  				$transaction_id	=	mysql_insert_id();
						  				mysql_query('UPDATE transactions SET transaction_status = 1 WHERE transaction_id = '.$transaction_id);
						  				echo 'Transaction successful';
						  			}
						  		}
						  	}
						 }
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