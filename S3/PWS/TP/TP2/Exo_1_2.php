<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
    <link rel="stylesheet" href="include/bootstrap.min.css">
    <link rel="stylesheet" href="include/styles.css">
	<title>Mon site PWS en PHP!</title>
</head>
<body>
	<?php include("./include/header.php"); ?>

    <?php include("./include/menus.php"); ?>
    <div style="padding-top: 30px" id="main">
        <div style="text-align: center" class="col-md-12">
                <?php
                    $tab["The Greatest Showman"] = array("Réalisateur" => "Michael Gracey", "Pays" => "USA", "Année de sortie" => 2018);
                    $tab["Koe no Katachi"] = array("Réalisateur" => "Naoko Yamada", "Pays" => "Japon", "Année de sortie" => "2016");
                    $tab["La La Land"] = array("Réalisateur" => "Damien Chazelle", "Pays" => "USA", "Année de sortie" => "2016");

                    print_r($tab);
                ?>
            </div>
        </div>
    </div>

	<?php include("./include/footer.php"); ?>
</body>
</html>
