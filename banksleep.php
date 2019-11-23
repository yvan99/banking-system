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
		<title>Create a new customer account</title>
		<link rel="icon" href="../favicon.ico" />
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	   <script src="jsscript/script.js"></script>
		
	</head>
	<body>
		<header>
			<div class="container"><span style='color:white;opacity:0.9;'><center>WELCOME TO ALL IN ONE UMURENGE SACCO CUSTOMER DEPOSIT AND WITHDAW MONEY BANKING SYSTEM</center></span>
				<div style="height:100px;">
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
				    ?>
				   <div style="background:url('sacco.png') no-repeat;background-size:580px; width:500px;border:1px dashed black;padding:2px  
				        40px 80px 40px;font-size:12px;">
				        <h3 align="center">Umurenge Sacco</h3>
				        Branch      .............................. &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Date: ........<br>           
				        Account No  ..............................<br>
				        Teller      ..............................<br>
				        Motif       ............................../..[Depositor Name]..<br><br>
                        <hr style=" width:500px; float:left;"><br>
                        Amount    ................................<br>
                        We deposit on account no ............. an amount of ...............<br>
                        <hr style=" width:500px; float:left;"><br><br>
                        Client Signature&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp&nbsp&nbspTeller Signature
                        <br><span style="float:right">OPERATION SUCCESSFULLY DONE</span><br><br>
                    </div>
                  <?php
                    @$id=$_GET['id'];
	                $sql="SELECT *FROM customers WHERE id='$id'";
	                $query=mysql_query($sql);
	                $result=mysql_fetch_assoc($query);
	
	               ?>
	<!--BUTTON OF PRINTING-->


	<script type="text/javascript">
	function printpage(){

	document.getElementById('printbutton').style.visibility='hidden';
	window.print();
	document.getElementById('printbutton').style.visibility='visible';

}


	</script>
	<input type="button"value="print"onclick="printpage()"id="printbutton">

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
