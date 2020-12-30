<html> 

    <body> 
        <?php 
        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957'); 
		$mname = $mqua  = $mprice =  $mava = "";
		$mdoa = date("Y-A-G");
		
		if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $mname=$_POST['medname']; 
		$mqua=$_POST['quantity'];
        $mdoa =$_POST['doa']; 
		$mava =$_POST['avail'];
        $mprice = $_POST['price']; 
		//$pgender =$_POST['gender'];
		
		}
		
		
		$array["ilac_adi"] = $mname;
		$array["toplam_miktar"] = $mqua;
		$array["mevcut_miktar"] = $mava;
		$array["alinma_tarihi"] = $mdoa;
		$array["ilac_fiyati"] = $mprice;
		//$array["gender"] = $pgender;
		
		
		
        $result = pg_insert($db, 'medikalmagaza', $array);
		echo "Degerler girildi";
if (!$result) {
  echo "Hata.\n";
  exit;
}
pg_close($db);
        ?> 
    </body> 
</html> 

