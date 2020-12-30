<html> 
<head>
  <style>
  body{
		background-image: url("bg1.jpg");
	background-size: 1400px;
    background-repeat:repeat;
	
	position:relative;
	}
  </style>
</head>
    <body> 
        <?php 
        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957'); 
		$y_id = $y_tip = $cinsiyet = $toplam_yatak = $uygun_yatak ="";
		
		if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $y_id=$_POST['y_id']; 
        $y_tip =$_POST['y_tip']; 
        $cinsiyet = $_POST['cinsiyet']; 
		$toplam_yatak= $_POST['toplam_yatak'];
		$uygun_yatak=$_POST['uygun_yatak'];
	
		
		
		}
		
		$array["y_id"] = $y_id;
		$array["y_tip"] = $y_tip;
		$array["cinsiyet"] = $cinsiyet;
		$array["toplam_yatak"] = $toplam_yatak;
		$array["uygun_yatak"] = $uygun_yatak;
		
		
		


		
		
		
        $result = pg_insert($db, 'yatak', $array);
		//$result = pg_insert($db, 'user_table', $array);
		echo "Oda bilgisi girildi";
if (!$result) {
  echo "Hata.\n";
  exit;
}
pg_close($db);
        ?> 
    </body> 
</html> 

