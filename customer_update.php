

<?php
session_start();
if (!isset($_SESSION['user'])) {

	header("location:login.php?msg=please first login again");
}

?>
<!DOCTYPE HTML>
<?php
require_once"connect.php";
//Fetch districts
if(isset($_GET['get_districts'])){
	if(isset($_GET['province'])){
		$province_id = (int)$_GET['province'];
		$show_districts = mysql_query('SELECT * FROM districts WHERE id_p = '.$province_id) OR die(mysql_error());
		echo '<select name = "districts" id="district" onchange = "get_sectors()">';
			while($get_district = mysql_fetch_assoc($show_districts)){
				?>
					<option value="<?php echo $get_district['id_d'];?>"><?php echo $get_district['districtname'];?></option>
				<?php
			}
		echo '</select>';
		exit();
	}
}
if(isset($_GET['get_sectors'])){
	if(isset($_GET['district'])){
		$district_id = (int)$_GET['district'];
		$show_sectors = mysql_query('SELECT * FROM sector WHERE id_d = '.$district_id) OR die(mysql_error());
		echo '<select name = "sector" id="districts"';
			while($get_sector = mysql_fetch_assoc($show_sectors)){
				?>
					<option value="<?php echo $get_sector['id'];?>"><?php echo $get_sector['sectors'];?></option>
				<?php
			}
		echo '</select>';
		exit();
	}
}
//End fetch districts
?>
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
		<title>Customer update</title>
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
						   <li class='last'><a href='logout.php'><span>Lougout</span></a></li>
						</ul>
					</div>
				</div>
				<div class="container-right">
					<div>
						<?php
						$id=$_GET['id'];
						$query="SELECT *FROM customers WHERE id='$id'";
						$sql=mysql_query($query);
						$result=mysql_fetch_assoc($sql);
						?>
						<form action="" method="POST" enctype="multipart/form-data">
							<table>
								<tr>
									<td><label id="show">Firstname </label></td>
									<td><input type="text" name="fname" placeholder="first_name..." title="Enter your first_name" required value="<?php echo $result['customer_first_name'];?>"><td>
								</tr>
								<tr>
									<td><label id="show">Lastname </label></td>
									<td><input type="text" name="lname" placeholder="last_name..." title="Enter your last_name" required value="<?php echo @$result['customer_last_name'];?>"><td>
								</tr>
								<tr>
									<td><label id="show">Gender  </label></td>
									<td>
										<input type="radio" name="gender" value="female"<?php echo $result['gender']=="female"||@$_POST['gender']=="female"?"checked":"";?>>female
										<input type="radio" name="gender" value="male"<?php echo $result['gender']=="male"||@$_POST['gender']=="male"?"checked":"";?>>male 
									</td>
								</tr>
								<tr>
									<td><label id="show">Birthdate  </label></td>
									<td><input type="text"name="date"placeholder="birthdate" required <?php if(isset($_POST['email'])){ echo $_POST['email'];} ?> onclick="ds_sh(this);" readonly="readonly"style="cursor:text"
												size="20"onFocus="this.select();"id="txtdate"/>
												<img src="calendar.gif"width="5"height="5"><?php require_once("resources/calendercode.php");?></td>
								</tr>
								<tr>
									<td><label id="show">Email  </label></td>
									<td><input type="text" name="email" placeholder="email..." title="Enter your email" value="<?php echo $result['customer_email'];?>"></td>
								</tr>
								<tr>
									<td><label id="show">Phonenumber  </label></td>
									<td><input type="text" name="phone" placeholder="phone_number..." title="Enter your phone_number" required value="<?php echo $result["customer_phone_number"];?>"><td>
								</tr>
		
								<tr>
									<td><label id="show">Identitycard </label></td>
									<td><input type="text" name="id" placeholder="id_card..." title="Enter your id_card" required value="<?php echo $result['customer_id_card_number'];?>"></td>
								</tr>
								<tr>
									<td><label id="show">Photo </label></td>
									<td><input type="file" name="upload" value="browse" required <?php echo $result['photo'];?></td>
								</tr>
								<tr>
									<td><label id="show">Province</label></td>
									<td>
										<select name="province" id = "province" onchange = "get_districts();">
											<?php
											$provinces	=	mysql_query('SELECT * FROM provinces ORDER BY province_name');
											while($get_province = mysql_fetch_assoc($provinces)){
												?>
												<option value="<?php echo $get_province['IDpr'];?>" <?php if(isset($_POST['province']) AND $_POST['province'] == $get_province['IDpr']){echo 'selected = "selected"';} ?>><?php echo $get_province['province_name'];?></option>
												<?php
											}
											?>
										</select>
									</td>
								</tr>
								<tr id = "show_districts" style="display:none;">
									<td><label id="show">Districts</label></td>
									<td>
										<div class="show_districts"></div>
									</td>
								</tr>
								<tr id = "show_sectors" style="display:none;">
									<td><label id="show">Sectors</label></td>
									<td>
										<div class="show_sectors"></div>
									</td>
								</tr>
								<tr>
									<td></td><td><label id="show"></label><input type="submit" name="update" value="Update"></td>
								</tr>
							</table>
					 		<?php
					 		//header("");
							//Save customer
							if(isset($_POST['update'])) {
								$fname=htmlspecialchars($_POST['fname']);
								$lname=htmlspecialchars($_POST['lname']);
								$gender=htmlspecialchars($_POST['gender']);
								$birthdate=htmlspecialchars($_POST['date']);
								$email=htmlspecialchars($_POST['email']);
								$phone=htmlspecialchars($_POST['phone']);
					            $address=htmlspecialchars($_POST['sector']);
								$id_card=htmlspecialchars($_POST['id']);
								$photo=htmlspecialchars($_FILES['upload']['name']);
								move_uploaded_file($_FILES['upload']['tmp_name'],"picture/".$_FILES['upload']['name']);
								mysql_query("UPDATE customers SET
									customer_first_name='$fname',
									customer_last_name='$lname',
									gender='$gender',
									birthdate='$birthdate',
									customer_email='$email',
									customer_phone_number='$phone',
									customer_address='$address',
									customer_id_card_number='$id_card',
									photo='$photo' WHERE id='$id'")or die(mysql_error());
								
								echo "<script>window.location='customers.php'; </script>";

	                        }
	                        else{
                     			//An error occured
                     		}
                     		?>
                        </form>
                    </div>
				</div>
			</div>
		</section>
		
		<footer>
			<div class="container">
				<p class="copyright">© 2017 for umurenge sacco banking system. All rights reserved.</p>
			</div>
			<script type="text/javascript">
				function get_districts(){
					var province= $('#province').val();
					var str = 'province='+province;
					$.ajax({
						url: "index.php?get_districts",
						data: str,
						cache: false,
						success: function(html){
							$('#show_districts').css('display','block');
							$('.show_districts').after(html);
						}
					});
				}
				function get_sectors(){
					var district= $('#district').val();
					var str = 'district='+district;
					$.ajax({
						url: "index.php?get_sectors",
						data: str,
						cache: false,
						success: function(html){
							$('#show_sectors').css('display','block');
							$('.show_sectors').after(html);
						}
					});
				}
			</script>
		</footer>
	</body>
</html>