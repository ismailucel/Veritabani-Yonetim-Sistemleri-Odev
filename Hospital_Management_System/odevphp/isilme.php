<?php

        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957'); 
		
		$query = "DELETE FROM medikalmagaza WHERE ilac_adi='" . $_GET["ilac_adi"] . "'";
	if($result = pg_query($query)){
		echo "Ilac Basariyla Silindi.";
		
	}
	else{
		echo "Error.";
	}


?>

