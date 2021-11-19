<?php
    session_start();
    if (isset($_SESSION['SmorgadoJonathan']))
    {
        if ($_SESSION['SmorgadoJonathan'] != 'Achille')
        {
            header('Location: FormConnexion.php?msgError=Acces Interdit');
        }
    }
    else
    {
        header('Location: FormConnexion.php?msgError=Acces Interdit');
    }
?>
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
                <?php
                    echo '-500€ <input type="radio" name="prix" value="-500"';
                    if (isset($_POST['Valider']) && $_POST['prix'] == "-500")
                    {
                        echo 'checked';
                    }
                    echo '><br><br>';
                    echo '+500 <input type="radio" name="prix" value="+=500"';
                    if (isset($_POST['Valider']) && $_POST['prix'] == "+=500")
                    {
                        echo 'checked';
                    }
                    echo '><br><br>';
                ?>
                <input type="submit" name="Valider" value="Valider">
            </form>
                <?php 
                    include("InitTableaux.php");
                    require_once('connect.inc.php');
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
                        $reqp = 'SELECT idProduit, idCategorie, nomProduit, prixProduit
                                FROM Produits
                                WHERE prixProduit >= 500;';
                        $reqm = 'SELECT idProduit, idCategorie, nomProduit, prixProduit
                                FROM Produits
                                WHERE prixProduit < 500;';
                        if ($prix == 1)
                        {
                            $res = $conn->prepare($reqp);
                            $res->execute();
                        }
                        else if ($prix == 0)
                        {
                            $res = $conn->prepare($reqm);
                            $res->execute();
                        }
                        
                        foreach ($res->fetchAll(PDO::FETCH_ASSOC) as $elm)
                        {
                            array_push($tmp, $elm);
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
