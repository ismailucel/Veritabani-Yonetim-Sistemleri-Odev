<?php

        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957'); 
		if(count($_POST)>0) {
	
	$query = "UPDATE randevu_takvimi SET doktor_id='" . $_POST['doktor_id'] . "', hasta_id='" . $_POST['hasta_id'] . "', randevu_tarihi='" . $_POST['randevu_tarihi'] . "', randevu_saati='" . $_POST['randevu_saati']  . "' WHERE doktor_id='" . $_POST['doktor_id'] . "'";
	if($result = pg_query($query)){
		echo "Randevu güncellendi.";
	}
	else{
		echo "Hata.";
	}
	
}
$result = pg_query($db,"SELECT * FROM randevu_takvimi WHERE doktor_id='" . $_GET['doktor_id'] . "'");
$row= pg_fetch_assoc($result);
		
	


?>

<html>
<head>
	<title>Randevu Guncelle</title>
</head>
<body>
<img id="logo"  >
<center><img src="https://fontmeme.com/temporary/dbee9ed7f1eb1c8d2a8d9df571b6620f.png" border="0"></div>

<form name="frmUser" method="post" action="">
<div><?php if(isset($message)) { echo $message; } ?>
</div>
<div style="padding-bottom:5px;">
<a href="mup.php">RANDEVU</a>
</div>
	Doktor ID : <br>
	<input type="hidden" name="doktor_id" class="txtField" value="<?php echo $row['doktor_id']; ?>">
	<input type="text" name="doktor_id"  value="<?php echo $row['doktor_id']; ?>">
	<br>
	Hasta ID: <br>
	<input type="text" name="hasta_id"  value="<?php echo $row['hasta_id']; ?>">
	<br>
	Randevu Tarihi :<br>
	<input type="date" name="randevu_tarihi"  value="<?php echo $row['randevu_tarihi']; ?>">
	<br>
	Randevu Saati:<br>
	<input type="text" name="randevu_saati" value="<?php echo $row['randevu_saati']; ?>">
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
