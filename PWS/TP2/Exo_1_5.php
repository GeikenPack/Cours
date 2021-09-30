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
                    $dates = array("01/02/2000", "05/08/1994", "20/12/2005", "16/05/1990", "24/04/2002");
                    echo "<h1> Le tableau des dates de naissances : </h1>";
                    print_r($dates);
                    echo "<BR>";

                    echo "<h1> Le tbaleau des années de naissances : <BR>";
                    for ($i = 0; $i < count($dates); $i++)
                    {
                        $annees[$i] = substr($dates[$i], -4);
                    }
                    print_r($annees);
                ?>
            </div>
        </div>
    </div>

	<?php include("./include/footer.php"); ?>
</body>
</html>
