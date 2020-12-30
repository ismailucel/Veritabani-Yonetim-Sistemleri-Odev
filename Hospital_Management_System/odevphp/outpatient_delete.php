<?php

        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957'); 
		
		$query = "DELETE FROM hasta WHERE hasta_id='" . $_GET["hasta_id"] . "'";
	if($result = pg_query($query)){
		echo "Hasta Basariyla Silindi.";
		
	}
	else{
		echo "Hata.";
	}


?>

