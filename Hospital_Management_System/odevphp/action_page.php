<html> 

    <body> 
        <?php 
        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=12345'); 
		$user_id= $first_name= $last_name = $contact = $age= $pass = $gender ="";
		
		if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $user_id=$_POST['userid']; 
        $first_name =$_POST['firstname']; 
        $last_name = $_POST['lastname']; 
		$contact= $_POST['cno'];
		$age =$_POST['cage'];
		$pass =$_POST['psw'];
		$gender =$_POST['gender'];
		
		}
		
		
		$array["kullanici_id"] = $user_id;
		$array["kullanici_sifre"] = $pass;
		$array["ad"] = $first_name;
		$array["soyad"] = $last_name;
		$array["yas"] = $age;
		$array["tel_no"] = $contact;
		$array["cinsiyet"] = $gender;
		
		
		
        $result = pg_insert($db, 'kullanici', $array);
		echo "Degerler girildi";
if (!$result) {
  echo "Hata.\n";
  exit;
}
pg_close($db);
        ?> 
    </body> 
</html> 

