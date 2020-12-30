<?php

        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957'); 
		if(count($_POST)>0) {
	
	$query = "UPDATE medikalmagaza SET ilac_adi='" . $_POST['ilac_adi'] . "', toplam_miktar='" . $_POST['toplam_miktar'] . "', tüketilen_miktar='" . $_POST['tüketilen_miktar'] . "', mevcut_miktar='" . $_POST['mevcut_miktar'] . "' ,ilac_fiyati='" . $_POST['ilac_fiyati'] . "' , alinma_tarihi = ' " . $_POST['alinma_tarihi'] . "' WHERE ilac_adi='" . $_POST['ilac_adi'] . "'";
	if($result = pg_query($query)){
		echo "Ilac Basariyla Guncellendi.";
	}
	else{
		echo "Hata.";
	}
	
}
$result = pg_query($db,"SELECT * FROM medikalmagaza WHERE ilac_adi='" . $_GET['ilac_adi'] . "'");
$row= pg_fetch_assoc($result);
		
	


?>

<html>
<head>
	<title>Ilac Bilgilerini Guncelle</title>
</head>
<body>
<img id="logo"  >
<center><img src="https://fontmeme.com/temporary/dbee9ed7f1eb1c8d2a8d9df571b6620f.png" border="0"></div>

<form name="frmUser" method="post" action="">
<div><?php if(isset($message)) { echo $message; } ?>
</div>
<div style="padding-bottom:5px;">
<a href="mup.php">ILACLAR</a>
</div>
	Ilac Adi: <br>
	<input type="hidden" name="ilac_adi" class="txtField" value="<?php echo $row['ilac_adi']; ?>">
	<input type="text" name="ilac_adi"  value="<?php echo $row['ilac_adi']; ?>">
	<br>
	Toplam Miktar: <br>
	<input type="text" name="toplam_miktar"  value="<?php echo $row['toplam_miktar']; ?>">
	<br>
	Tüketilen Miktar :<br>
	<input type="text" name="tüketilen_miktar"  value="<?php echo $row['tüketilen_miktar']; ?>">
	<br>
	Mevcut Miktar:<br>
	<input type="text" name="mevcut_miktar" value="<?php echo $row['mevcut_miktar']; ?>">
	<br>
	Ilac Fiyati:<br>
	<input type="text" name="ilac_fiyati" value="<?php echo $row['ilac_fiyati']; ?>">
	<br>
	Alinma Tarihi :<br>
	<input type="date" name="alinma_tarihi" value="<?php echo $row['alinma_tarihi']; ?>">
	<br>
	<input type="submit" name="submit" value="Submit" class="buttom">

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
