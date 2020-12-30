<?php
  session_start();
  //$_SESSION["ad"]=$_GET["ad"];
  extract($_GET);
  $_SESSION['username'] = $_GET['uname'];
  $pass=$_GET['psw'];

  $link = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957');

  $result = pg_query($link, "select * from resepsiyonist where res_id='{$_SESSION['username']}'");

  $row = pg_fetch_assoc($result);

  $message = "BASARIYLA GIRIS YAPTINIZ";

  //if(strcmp($_SESSION['username'],"admin")==0)
  
   if($pass==$row['r_sifre'])
  {
	 echo "<script type='text/javascript'>alert('$message');</script>";
	 header('Location: resep.html');
  }
  else
  {
	 echo "Lutfen dogru ID ve sifre giriniz !!";
	 //header('Location: kulgiris.html');	
  }
?>