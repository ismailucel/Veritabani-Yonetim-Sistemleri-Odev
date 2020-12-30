<html> 

    <body> 
        <?php 
        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957'); 
		$hasta_id = $doc_id = "";
		$pdate = date("Y-A-G");
		date_default_timezone_set('Europe/Istanbul');
		//$time = date_default_timezone_get();



		
		
		if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $hasta_id=$_POST['hid']; 
        $pdate =$_POST['date']; 
        $time= $_POST['time']; 
		$doc_id= $_POST['doc'];
		
		}
		$array["hasta_id"] = $hasta_id;
		$array["randevu_tarihi"] = $pdate;
		$array["randevu_saati"] = $time;
		$array["doktor_id"] = $doc_id;
		
		
	
		
		
       $result = pg_insert($db, 'randevu_takvimi', $array);
		echo "Randevu Eklendi.";
if (!$result) {
  echo "Hata Gerceklesti.\n";
  exit;
}
pg_close($db);
        ?> 
    </body> 
</html> 

