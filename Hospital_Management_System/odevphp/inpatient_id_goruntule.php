 <?php 
$db = pg_pconnect("dbname=hastane password='fb200019661957' user='postgres'");
if (!$db) {
  echo "Hata olustu.\n";
  exit;
}

$result = pg_query($db, "SELECT ad,soyad,cinsiyet,boy,kilo,test_rapor,ilac_adi,res_id,lt_id,hasta_id FROM hasta where hasta_id = '$_POST[hid]'and hasta_tip = 'Y'");
if (!$result) {
  echo "Hata olustu.\n";
  exit;
}

pg_close($db);
      ?> 
<!DOCTYPE html>
<html>
    <head>
        <title>YATILI HASTA GORUNTULE</title>
        <link rel="stylesheet" href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css">
    </head>
    <body>
	
	<img id="logo"  >
<center><img src="https://fontmeme.com/temporary/dbee9ed7f1eb1c8d2a8d9df571b6620f.png" border="0"></div>

        <div class="container">
            <h1>YATILI HASTALAR</h1>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Hasta Adi</th>
                        <th>Hasta Soyadi</th>
                        <th>Cinsiyet</th>
						<th>Boy</th>
						<th>Kilo</th>
						<th>Test Rapor</th>
						<th>Ilac Adi</th>
						<th>Res_ID</th>
						<th>LT_ID</th>
						<th>Hasta_ID</th>
                    </tr>
                </thead>
                <tbody>
				<?php
                    $i=0;
							while ($row=pg_fetch_assoc($result)) { ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['ad']) ?></td>
                            <td><?php echo htmlspecialchars($row['soyad']); ?></td>
                            <td><?php echo htmlspecialchars($row['cinsiyet']); ?></td>
							<td><?php echo htmlspecialchars($row['boy']); ?></td>
							<td><?php echo htmlspecialchars($row['kilo']); ?></td>
							<td><?php echo htmlspecialchars($row['test_rapor']); ?></td>
							<td><?php echo htmlspecialchars($row['ilac_adi']); ?></td>
							<td><?php echo htmlspecialchars($row['res_id']); ?></td>
							<td><?php echo htmlspecialchars($row['lt_id']); ?></td>
							<td><?php echo htmlspecialchars($row['hasta_id']); ?></td>
							
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