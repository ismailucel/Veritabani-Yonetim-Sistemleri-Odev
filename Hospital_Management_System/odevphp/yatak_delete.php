<?php

        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957'); 
		
		$query = "DELETE FROM yatak WHERE y_id='" . $_GET["y_id"] . "'";
	if($result = pg_query($query)){
		echo "Oda Basariyla Silindi.";
		
	}
	else{
		echo "Hata.";
	}


?>

