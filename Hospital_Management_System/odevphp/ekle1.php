


  <?php 
$db = pg_pconnect("dbname=hastane password='fb200019661957' user='postgres'");
if (!$db) {
  echo "Hata olustu.\n";
  exit;
}

$result = pg_query($db, "SELECT randevu_tarihi,randevu_saati,doktor_id FROM randevu_takvimi where hasta_id = '$_POST[hid]'");
if (!$result) {
  echo "Hata olustu.\n";
  exit;
}

pg_close($db);
      ?> 

<!DOCTYPE html>
<html>
    <head>
        <title>RANDEVULAR</title>
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
						
                    </tr>
                </thead>
                <tbody>
                    <?php
					$i=0;
							while ($row=pg_fetch_assoc($result)) { ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['randevu_tarihi']) ?></td>
                            <td><?php echo htmlspecialchars($row['randevu_saati']); ?></td>
                            <td><?php echo htmlspecialchars($row['doktor_id']); ?></td>
							
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