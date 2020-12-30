<?php

try{

    $myPDO = new PDO("pgsql:host=localhost;port=5432;dbname=hastane;user=postgres;password=fb200019661957");
    
       $sql = "SELECT * FROM hasta WHERE hasta_tip = 'A'";


}catch(PDOExpection $e){

    echo $e->getMessage();
}

?>

<!DOCTYPE html>
<html>
    <head>
        <title>AYAKTA HASTA GORUNTULE</title>
        <link rel="stylesheet" href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css">
    </head>
    <body>
	
	<img id="logo"  >
<center><img src="https://fontmeme.com/temporary/dbee9ed7f1eb1c8d2a8d9df571b6620f.png" border="0"></div>

        <div class="container">
            <h1>AYAKTA HASTALAR</h1>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Hasta Adi</th>
                        <th>Hasta Soyadi</th>
                        <th>Cinsiyet</th>
						<th>Boy</th>
						<th>Kilo</th>
						<th>Dogum Tarihi</th>
						<th>Test Rapor</th>
						<th>Ilac Adi</th>
						<th>Res_ID</th>
						<th>LT_ID</th>
						<th>Hasta_ID</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($myPDO->query($sql) as $row) : ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['ad']) ?></td>
                            <td><?php echo htmlspecialchars($row['soyad']); ?></td>
                            <td><?php echo htmlspecialchars($row['cinsiyet']); ?></td>
							<td><?php echo htmlspecialchars($row['boy']); ?></td>
							<td><?php echo htmlspecialchars($row['kilo']); ?></td>
							<td><?php echo htmlspecialchars($row['dogum_tarihi']); ?></td>
							<td><?php echo htmlspecialchars($row['test_rapor']); ?></td>
							<td><?php echo htmlspecialchars($row['ilac_adi']); ?></td>
							<td><?php echo htmlspecialchars($row['res_id']); ?></td>
							<td><?php echo htmlspecialchars($row['lt_id']); ?></td>
							<td><?php echo htmlspecialchars($row['hasta_id']); ?></td>
							<td><a href = "guncelle_outpatient.php?hasta_id=<?php echo $row["hasta_id"]; ?>">Guncelle</a></td>
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