<?php

        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957'); 
		$result = pg_query($db,"SELECT * FROM randevu_takvimi");


?>

<!DOCTYPE html>
<html>
    <head>
        <title>RANDEVULARI SIL</title>
        <link rel="stylesheet" href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css">
    </head>
    <body>
	
	<img id="logo"  >
<center><img src="https://fontmeme.com/temporary/dbee9ed7f1eb1c8d2a8d9df571b6620f.png" border="0"></div>

        <div class="container">
            <h1>RANDEVULAR</h1>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Doktor ID</th>
                        <th>Hasta ID</th>
                        <th>Randevu Saati</th>
						<th>Randevu Tarihi</th>
						
                    </tr>
                </thead>
                <tbody>
                    <?php 
					$i=0;
					while ($row=pg_fetch_assoc($result)) { ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['doktor_id']) ?></td>
                            <td><?php echo htmlspecialchars($row['hasta_id']); ?></td>
                            <td><?php echo htmlspecialchars($row['randevu_saati']); ?></td>
							<td><?php echo htmlspecialchars($row['randevu_tarihi']); ?></td>
							
							<td><a href = "sil_randevu.php?doktor_id=<?php echo $row["doktor_id"]; ?>">Sil</a></td>
                        </tr>
                    <?php $i++;
					} 
					?>
                </tbody>
            </table>
        </div>
    </body>
</html>


<style>

body{
	background-image: url("bg1.jpg");
	background-size: 1400px;
    background-repeat:repeat;
	
	position:relative;
	}
	h1{
color:#DC143C		; font-family: 'Open Sans', sans-serif;
	
</style>