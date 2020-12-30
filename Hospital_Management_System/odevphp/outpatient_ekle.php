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
		$patientid = $pfname = $plname = $pgender = $dob = $pheight = $pweight = $test = $precid  = $pltid = $med  = "";
		$dob =  date("Y-M-D");
		if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $patientid=$_POST['PatientID']; 
        $pfname =$_POST['firstname']; 
        $plname = $_POST['lastname']; 
		$pgender= $_POST['gender'];
		$dob=$_POST['dob'];
		$pheight =$_POST['height'];
		$pweight=$_POST['weight'];
		$test =$_POST['testrepo'];
		$precid=$_POST['recid'];
		
		$pltid=$_POST['ltid'];
		$med=$_POST['medname'];
		
		
		}
		
		$array["hasta_id"] = $patientid;
		$array["ad"] = $pfname;
		$array["soyad"] = $plname;
		$array["cinsiyet"] = $pgender;
		$array["dogum_tarihi"] = $dob;
		$array["boy"] = $pheight;
		$array["kilo"] = $pweight;
		$array["test_rapor"] = $test;
		$array["res_id"] = $precid;
		$array["lt_id"] = $pltid;
		$array["ilac_adi"] = $med;
		
		
		$xyz= pg_query("ALTER TABLE hasta ALTER hasta_tip SET DEFAULT 'A'");

		
		
		
        $result = pg_insert($db, 'hasta', $array);
		//$result = pg_insert($db, 'user_table', $array);
		echo "Degerler girildi";
if (!$result) {
  echo "An error occurred.\n";
  exit;
}
pg_close($db);
        ?> 
    </body> 
</html> 

