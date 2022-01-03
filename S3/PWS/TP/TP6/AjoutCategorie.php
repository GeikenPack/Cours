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
                    if (isset($_GET['errMsg']))
                    {
                        echo '<h1>'.$_GET['errMsg'].'</h1><br>';
                    }
                ?>
                Veuillez entrer les informations de la nouvelle catégorie : <br> <br>
                
                <form method='POST' action="<?php echo $_SERVER['PHP_SELF'] ?>"> 
                    Id Categorie : <input type="text" name ="idCat" value="400"> <br> <br>
                    Nom de catégorie : <input type="text" name="nomCat" value ="Cle USB"> <br> <br>
                    <input type="submit" value="Valider" name = "afficher">
                </form>

                <?php
                    require_once('connect.inc.php');
                    if (isset($_POST['afficher']))
                    {
                        if (preg_match("#^[4-9]00$#", $_POST['idCat']) && preg_match('#^[a-zA-Z ]{3,25}$#i', $_POST['nomCat']))
                        {
                            $req = "INSERT INTO Categories VALUES(:idCat, :nomCat)";
                            $res =$conn->prepare($req);
                            $res->execute(array('idCat' => $_POST['idCat'], 'nomCat' => $_POST['nomCat']));
                            header('Location: ConsultCat.php');
                        }
                        else
                        {
                            header('Location: AjoutCategorie.php?errMsg=Erreur de saisie dans les champs...');
                        }
                    }
                ?>
            </div>
        </div>
    </body>
</html>