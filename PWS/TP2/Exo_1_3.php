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
                    $tab1["The Greatest Showman"] = array("Michael Gracey", "USA", 2018);
                    $tab1["Koe no Katachi"] = array("Naoko Yamada", "Japon", "2016");
                    $tab1["La La Land"] = array("Damien Chazelle", "USA", "2016");

                    $tab2["The Greatest Showman"] = array("Réalisateur" => "Michael Gracey", "Pays" => "USA", "Année de sortie" => 2018);
                    $tab2["Koe no Katachi"] = array("Réalisateur" => "Naoko Yamada", "Pays" => "Japon", "Année de sortie" => "2016");
                    $tab2["La La Land"] = array("Réalisateur" => "Damien Chazelle", "Pays" => "USA", "Année de sortie" => "2016");

                    foreach($tab1 as $film => $val)
                    {
                        echo"<b>Element ".$film." :</b>";
                        echo"<BR>";
                        foreach($val as $elm)
                        {
                            echo "Elément ".array_search($elm,$val)." : ".$elm;
                            echo"<BR>";
                        }
                    }
                    echo "<BR>";
                    foreach($tab2 as $film => $val)
                    {
                        echo"<b>Element ".$film." :</b>";
                        echo"<BR>";
                        foreach($val as $elm)
                        {
                            echo array_search($elm,$val)." : ".$elm;
                            echo"<BR>";
                        }
                    }
                ?>
            </div>
        </div>
    </div>

	<?php include("./include/footer.php"); ?>
</body>
</html>
