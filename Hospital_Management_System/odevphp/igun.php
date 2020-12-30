<?php

        $db = pg_pconnect('host=localhost dbname=hastane user=postgres password=fb200019661957'); 
		$result = pg_query($db,"SELECT * FROM medikalmagaza");


?>

<!DOCTYPE html>
<html>
    <head>
        <title>MEDIKAL MAGAZA GORUNTULE</title>
        <link rel="stylesheet" href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css">
    </head>
    <body>
	
	<img id="logo"  >
<center><img src="https://fontmeme.com/temporary/dbee9ed7f1eb1c8d2a8d9df571b6620f.png" border="0"></div>

        <div class="container">
            <h1>MEDIKAL MAGAZA</h1>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Ilac Adi</th>
                        <th>Toplam Miktar</th>
                        <th>Mevcut Miktar</th>
						<th>Tüketilen Miktar</th>
						<th>Ilac Fiyati</th>
						<th>Alinma Tarihi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
					$i=0;
					while ($row=pg_fetch_assoc($result)) { ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['ilac_adi']) ?></td>
                            <td><?php echo htmlspecialchars($row['toplam_miktar']); ?></td>
                            <td><?php echo htmlspecialchars($row['mevcut_miktar']); ?></td>
							<td><?php echo htmlspecialchars($row['tüketilen_miktar']); ?></td>
							<td><?php echo htmlspecialchars($row['ilac_fiyati']); ?></td>
							<td><?php echo htmlspecialchars($row['alinma_tarihi']); ?></td>
							<td><a href = "iguncelle.php?ilac_adi=<?php echo $row["ilac_adi"]; ?>">Guncelle</a></td>
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