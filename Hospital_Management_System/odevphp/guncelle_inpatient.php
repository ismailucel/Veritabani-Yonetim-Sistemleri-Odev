<?php

        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957'); 
		if(count($_POST)>0) {
	
	$query = "UPDATE hasta SET hasta_id='" . $_POST['hasta_id'] . "', ad='" . $_POST['ad'] . "', soyad='" . $_POST['soyad']  . "' , boy='" . $_POST['boy'] . "' , kilo='" . $_POST['kilo'] . "' , dogum_tarihi='" . $_POST['dogum_tarihi'] . "' , ilac_adi='" . $_POST['ilac_adi'] . "' , test_rapor='" . $_POST['test_rapor']. "' , lt_id='" . $_POST['lt_id']. "' , res_id='" . $_POST['res_id']. "' WHERE hasta_id='" . $_POST['hasta_id'] . "'";
	if($result = pg_query($query)){
		echo "Hasta güncellendi.";
	}
	else{
		echo "Hata.";
	}
	
}
$result = pg_query($db,"SELECT * FROM hasta WHERE hasta_id='" . $_GET['hasta_id'] . "'");
$row= pg_fetch_assoc($result);
		
	


?>

<html>
<head>
	<title>HASTA GUNCELLE</title>
</head>
<body>
<img id="logo"  >
<center><img src="https://fontmeme.com/temporary/dbee9ed7f1eb1c8d2a8d9df571b6620f.png" border="0"></div>

<form name="frmUser" method="post" action="">
<div><?php if(isset($message)) { echo $message; } ?>
</div>
<div style="padding-bottom:5px;">
<h1>HASTA FORM</h1>
</div>
	Hasta ID : <br>
	<input type="hidden" name="hasta_id" class="txtField" value="<?php echo $row['hasta_id']; ?>">
	<input type="text" name="hasta_id"  value="<?php echo $row['hasta_id']; ?>">
	<br>
	Ad: <br>
	<input type="text" name="ad"  value="<?php echo $row['ad']; ?>">
	<br>
	Soyad :<br>
	<input type="text" name="soyad"  value="<?php echo $row['soyad']; ?>">
	<br>
	Boy :<br>
	<input type="number" name="boy"  value="<?php echo $row['boy']; ?>">
	<br>
	Kilo :<br>
	<input type="number" name="kilo"  value="<?php echo $row['kilo']; ?>">
	<br>
	Dogum Tarihi :<br>
	<input type="date" name="dogum_tarihi"  value="<?php echo $row['dogum_tarihi']; ?>">
	<br>
	Ilac Adi :<br>
	<input type="text" name="ilac_adi"  value="<?php echo $row['ilac_adi']; ?>">
	<br>
	LT_ID :<br>
	<input type="text" name="lt_id"  value="<?php echo $row['lt_id']; ?>">
	<br>
	Res_ID :<br>
	<input type="text" name="res_id"  value="<?php echo $row['res_id']; ?>">
	<br>
	Test Rapor :<br>
	<input type="text" name="test_rapor"  value="<?php echo $row['test_rapor']; ?>">
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
    padding: 14px 20px;
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
