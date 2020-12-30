<?php

        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957'); 
		if(count($_POST)>0) {
	
	$query = "UPDATE yatak SET y_id='" . $_POST['y_id'] . "', y_tip='" . $_POST['y_tip'] . "', cinsiyet='" . $_POST['cinsiyet']  . "' , toplam_yatak='" . $_POST['toplam_yatak'] . "' , uygun_yatak='" . $_POST['uygun_yatak'] .  "' WHERE y_id='" . $_POST['y_id'] . "'";
	if($result = pg_query($query)){
		echo "Oda güncellendi.";
	}
	else{
		echo "Hata.";
	}
	
}
$result = pg_query($db,"SELECT * FROM yatak WHERE y_id='" . $_GET['y_id'] . "'");
$row= pg_fetch_assoc($result);
		
	


?>

<html>
<hey_tip>
	<title>YATAK GUNCELLE</title>
</hey_tip>
<body>
<img id="logo"  >
<center><img src="https://fontmeme.com/temporary/dbee9ed7f1eb1c8d2a8d9df571b6620f.png" border="0"></div>

<form name="frmUser" method="post" action="">
<div><?php if(isset($message)) { echo $message; } ?>
</div>
<div style="py_tipding-bottom:5px;">
<h1>YATAK FORM</h1>
</div>
	Yatak ID : <br>
	<input type="hidden" name="y_id" class="txtField" value="<?php echo $row['y_id']; ?>">
	<input type="text" name="y_id"  value="<?php echo $row['y_id']; ?>">
	<br>
	Yatak Tip: <br>
	<input type="text" name="y_tip"  value="<?php echo $row['y_tip']; ?>">
	<br>
	Cinsiyet :<br>
	<input type="text" name="cinsiyet"  value="<?php echo $row['cinsiyet']; ?>">
	<br>
	Toplam Yatak :<br>
	<input type="number" name="toplam_yatak"  value="<?php echo $row['toplam_yatak']; ?>">
	<br>
	Uygun Yatak :<br>
	<input type="number" name="uygun_yatak"  value="<?php echo $row['uygun_yatak']; ?>">
	<br>
	
	
	 
	
	
	<input type="submit" name="submit" value="Gonder" class="buttom">

</form>
</body>
</html>

<style>

body{
	background-image: url("bg1.jpg");
	background-size: 1400px;
    background-repeat:repeat;
	
	position:relative;
	}
	h1{
	color:#DC143C		; font-family: 'Open Sans', sans-serif;}
	button {
   background-color: #4CAF50;
    color: white;
    py_tipding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 60%;
    opacity: 0.9;
	align:center;
}

button:hover {
    opacity:1;
}
	
</style>
