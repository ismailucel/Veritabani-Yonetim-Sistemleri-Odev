<?php

try{

    $myPDO = new PDO("pgsql:host=localhost;port=5432;dbname=hastane;user=postgres;password=fb200019661957");
    
       $sql = "SELECT * FROM randevu_takvimi
				ORDER BY randevu_tarihi DESC";


}catch(PDOExpection $e){

    echo $e->getMessage();
}

?>

<!DOCTYPE html>
<html>
    <head>
        <title>TUM RANDEVULARI GORUNTULE</title>
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
                        <th>Randevu Tarihi</th>
                        <th>Randevu Saati</th>
                        <th>Doktor ID</th>
						<th>Hasta ID</th>
						
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($myPDO->query($sql) as $row) : ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['randevu_tarihi']) ?></td>
                            <td><?php echo htmlspecialchars($row['randevu_saati']); ?></td>
                            <td><?php echo htmlspecialchars($row['doktor_id']); ?></td>
							<td><?php echo htmlspecialchars($row['hasta_id']); ?></td>
							
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