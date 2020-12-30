<?php
  session_start();
  //$_SESSION["ad"]=$_GET["ad"];
  extract($_GET);
  $_SESSION['username'] = $_GET['user'];
  $pass=$_GET['psw'];

  $link = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957');

  $result = pg_query($link, "select * from kullanici where kullanici_id='{$_SESSION['username']}'");

  $row = pg_fetch_assoc($result);

  $message = "BASARIYLA GIRIS YAPILDI";

  //if(strcmp($_SESSION['username'],"admin")==0)
  
   if($pass==$row['kullanici_sifre'])
  {
	 echo "<script type='text/javascript'>alert('$message');</script>";
	 header('Location: rand.html');
  }
  else
  {
	 echo "Lutfen dogru ID ve sifre giriniz!!";
	 //header('Location: userlogin.html');	
  }
?>