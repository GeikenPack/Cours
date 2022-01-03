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
    require_once("connect.inc.php");
    $reqp = 'SELECT idCategorie, nomCategorie
                FROM Categories';
    $res = $conn->prepare($reqp);
    $res->execute();
    $res->setFetchMode(PDO::FETCH_ASSOC);
    $tabCat = $res->fetchAll();
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
                    <select name="cat">
                        <?php
                            for ($i = 0; $i < sizeof($tabCat); $i++)
                            { 
                                echo '<option value="'.$tabCat[$i]['idCategorie'].'"';
                                if (isset($_POST['afficher']) && $_POST['cat'] == $tabCat[$i]['idCategorie'])
                                {
                                    echo 'selected';
                                }
                                echo '>'.$tabCat[$i]['nomCategorie'].'</option>';
                            }
                        ?>
                    </select>
                    <input type="submit" name="afficher" value="Valider">
                </form>

                <?php 
                    require_once('connect.inc.php');
                    include('Fonctions.php');
                    if (isset($_POST['afficher']))
                    {
                        $tmp = array();
                        $req = 'SELECT * FROM Produits
                                WHERE idCategorie = :id';
                        $res = $conn->prepare($req);
                        $res->execute(array('id' => $_POST['cat']));
                        if ($res->rowCount() > 1)
                        {
                            foreach ($res->fetchAll(PDO::FETCH_ASSOC) as $elm)
                            {
                                array_push($tmp, $elm);
                            }
                            echo '<br><br>';
                            afficheTabHtml($tmp, $tmp);
                        }
                        else
                        {
                            echo '<br>Pas de produits ...';
                        }
                    }
                ?>
        </div>
    </div>

	<?php include("./include/footer.php"); ?>
</body>
</html>
