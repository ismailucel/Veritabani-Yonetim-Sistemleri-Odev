  <?php 
$db = pg_pconnect("dbname=hastane password='fb200019661957' user='postgres'");
if (!$db) {
  echo "Hata olustu.\n";
  exit;
}

$result = pg_query($db, "SELECT toplam_yatak,uygun_yatak,cinsiyet,y_id,y_tip FROM yatak where y_id = '$_POST[yid]'");
if (!$result) {
  echo "Hata olustu.\n";
  exit;
}

pg_close($db);
      ?> 
<!DOCTYPE html>
<html>
    <head>
        <title>ODALARI GORUNTULE</title>
        <link rel="stylesheet" href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css">
    </head>
    <body>
	
	<img id="logo"  >
<center><img src="https://fontmeme.com/temporary/dbee9ed7f1eb1c8d2a8d9df571b6620f.png" border="0"></div>

        <div class="container">
            <h1>YATAKLAR</h1>
            <table class="table table-bordered">
                <thead>
                    <tr>
						<th>Toplam Yatak</th>
                        <th>Uygun Yatak</th>
                        <th>Cinsiyet</th>
						<th>Yatak_ID</th>
						<th>Yatak Tip<th>
                    </tr>
                </thead>
                <tbody>
				<?php
                    $i=0;
							while ($row=pg_fetch_assoc($result)) { ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['toplam_yatak']) ?></td>
                            <td><?php echo htmlspecialchars($row['uygun_yatak']); ?></td>
                            <td><?php echo htmlspecialchars($row['cinsiyet']); ?></td>
							<td><?php echo htmlspecialchars($row['y_id']); ?></td>
							<td><?php echo htmlspecialchars($row['y_tip']); ?></td>		
							
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