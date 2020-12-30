<?php

        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957'); 
		
		$query = "DELETE FROM randevu_takvimi WHERE doktor_id='" . $_GET["doktor_id"] . "'";
	if($result = pg_query($query)){
		echo "Randevu basariyla silindi.";
		
	}
	else{
		echo "Hata.";
	}


?>