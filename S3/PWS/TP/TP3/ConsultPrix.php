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
            <form method="POST" action="<?php echo $_SERVER['PHP_SELF'] ?>">
                -500€ <input type="radio" name="prix" checked value="-500"><br><br>
                +500 <input type="radio" name="prix" value="+=500"><br><br>
                <input type="submit" name="Valider" value="Valider">
            </form>
                <?php 
                    include("InitTableaux.php");
                    if (isset($_POST['Valider']))
                    {
                        switch($_POST['prix'])
                        {
                            case "+=500":
                                $prix = 1;
                                break;
                            case "-500":
                                $prix = 0;
                                break;
                        }
                        $tmp = array();
                        for ($i = 0; $i < sizeof($tabProd); $i++)
                        {
                            if ($tabProd[$i]['prixProduit'] >= 500 && $prix == 1)
                            {
                                array_push($tmp, $tabProd[$i]);
                                
                            } 
                            elseif($tabProd[$i]['prixProduit'] < 500 && $prix == 0)
                            {
                                array_push($tmp, $tabProd[$i]);
                            }
                        }
                        echo '<BR><BR>';
                        include("Fonctions.php");
                        afficheTabHtml($tabProd, $tmp);
                    }
                ?>
            </div>
        </div>
    </div>

	<?php include("./include/footer.php"); ?>
</body>
</html>
