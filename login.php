<?php
		session_start();
require_once"connect.php";
if (isset($_POST['login'])) {
	$user=mysql_real_escape_string(htmlentities($_POST['username']));
	$pass=mysql_real_escape_string(htmlentities($_POST['password']));
	$query=mysql_query($a ='SELECT * FROM users WHERE email = "'.$user.'" AND password = "'.($pass).'"') or die(mysql_error());
	$fet=mysql_fetch_array($query);
//echo $a;
//	exit();
	if($fet) {
		$_SESSION['user_id'] = $fet['user_id'];
		$_SESSION['user']=$fet['email'];
		$_SESSION['pass']=$fet['password'];
	if($fet['post']=="Teller"){
	header("Location:customers.php");
		}
	if($fet['post']=="admin"){
	header("Location:admin_users.php");
		}

		else{
		$message="<span style='color:red;font-size:13px;opacity:0.9;'> Wrong username or password</span><br>";
	}
	}
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
		
		<link rel="icon" href="../favicon.ico" />
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
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
				<div class="loginForm">
					<form action="login.php" method="POST">
						<?php
	 					echo isset($message)?$message:"";
	 				?>
						<label>username</label>
						<input type="text" name="username" class="input" />
						<label>Password</label>
						<input type="password" name="password" />
						<label><a href="login.php?action=recover" class="forgetLink">you can change your password</a></label>
						<button class="btn primary" type="submit" name="login">Login</button>

					</form>

				</div>

				<?php
				if (isset($_GET['action'])==1) {
					if ($_GET['action']=="recover") {
						?>
						
							<div id="recover" span style="position:relative;margin-top:-75px;color:#0b0460;left:400px;font-size:14px;opacity:0.9px;">
								<p id="res">Reset Password</p>
								<form method="post" action="">
									<label>Your Idnumber:</label>
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="id" placeholder="type here your id_number"required/>
									<br>
									<label>Your Email:</label>
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="mail" name="em" placeholder="type here your email"required/>
									<br>
									
									<label>New Password:</label>
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="password" name="pass" placeholder="type here new password" required/>
									<br><br>
									<input type="submit" Value="Reset Password" name="subn">
									
								</form>
								<?php

									include("connect.php");

									error_reporting(E_ALL);

									$nat=@$_POST['id'];
									$em=@$_POST['em'];
									$p=@$_POST['pass'];
									if (isset($_POST['subn'])) {
										
										$ck=mysql_query("SELECT * FROM users WHERE identity_number='".$nat."' AND email='".$em."'");

										$num=mysql_num_rows($ck);

										if ($num>=1) {
											
											$new=mysql_query("UPDATE users SET password='$p' WHERE email='$em' AND identity_number='$nat'");

											if ($new) {
												echo "password changed successfully";
											}

											else{
												echo "fail to change password";
											}
										}
										else{
											$announce="<span style='color:red;font-size:13px;opacity:0.9;'> Wrong identity_number or Email</span><br>";
											echo $announce;
										}
									}
								?>
							</div>
						<?php
					}
				}

				?>
				
			</div>
		</section>
		
		<footer>
			<div class="container">
				<p class="copyright">COPY © RIGHT ALL RESERVED 2017: CREATED BY SHAMIM IRENE USANASE.</p>
			</div>
		</footer>
	</body>
</html>
