<?php

try{

    $myPDO = new PDO("pgsql:host=localhost;port=5432;dbname=hastane;user=postgres;password=fb200019661957");
    
       $sql = "SELECT * FROM medikalmagaza";


}catch(PDOExpection $e){

    echo $e->getMessage();
}

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
						<th>Tuketilen Miktar</th>
						<th>Ilac Fiyati</th>
						<th>Alinma Tarihi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($myPDO->query($sql) as $row) : ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['ilac_adi']) ?></td>
                            <td><?php echo htmlspecialchars($row['toplam_miktar']); ?></td>
                            <td><?php echo htmlspecialchars($row['mevcut_miktar']); ?></td>
							<td><?php echo htmlspecialchars($row['tüketilen_miktar']); ?></td>
							<td><?php echo htmlspecialchars($row['ilac_fiyati']); ?></td>
							<td><?php echo htmlspecialchars($row['alinma_tarihi']); ?></td>
                        </tr>
                    <?php endforeach; ?>
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