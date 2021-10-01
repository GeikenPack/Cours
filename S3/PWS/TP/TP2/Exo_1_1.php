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
                    $tab["The Greatest Showman"] = array("Michael Gracey", "USA", 2018);
                    $tab["Koe no Katachi"] = array("Naoko Yamada", "Japon", "2016");
                    $tab["La La Land"] = array("Damien Chazelle", "USA", "2016");

                    var_dump($tab);
                    echo "<BR><BR>";
                    print_r($tab);
                ?>
            </div>
        </div>
    </div>

	<?php include("./include/footer.php"); ?>
</body>
</html>
