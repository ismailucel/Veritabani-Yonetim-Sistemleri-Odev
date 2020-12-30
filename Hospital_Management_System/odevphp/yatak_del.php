<?php

try{

    $myPDO = new PDO("pgsql:host=localhost;port=5432;dbname=hastane;user=postgres;password=fb200019661957");
    
       $sql = "SELECT * FROM yatak";


}catch(PDOExpection $e){

    echo $e->getMessage();
}

?>

<!DOCTYPE html>
<html>
    <head>
        <title>YATAK GORUNTULE</title>
        <link rel="stylesheet" href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css">
    </head>
    <body>
	
	<img id="logo"  >
<center><img src="https://fontmeme.com/temporary/dbee9ed7f1eb1c8d2a8d9df571b6620f.png" border="0"></div>

        <div class="container">
            <h1>YATAK BILGILERI</h1>
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
                    <?php foreach ($myPDO->query($sql) as $row) : ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['toplam_yatak']) ?></td>
                            <td><?php echo htmlspecialchars($row['uygun_yatak']); ?></td>
                            <td><?php echo htmlspecialchars($row['cinsiyet']); ?></td>
							<td><?php echo htmlspecialchars($row['y_id']); ?></td>
							<td><?php echo htmlspecialchars($row['y_tip']); ?></td>		
							<td><a href = "yatak_delete.php?y_id=<?php echo $row["y_id"]; ?>">Sil</a></td>
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