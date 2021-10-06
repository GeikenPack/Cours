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
                            include("InitTableaux.php");
                            for ($i = 0; $i < sizeof($tabCat); $i++)
                            {
                                echo '<option value="'.$tabCat[$i]['idCategorie'].'">'.$tabCat[$i]['nomCategorie'].'</option>';
                            }
                        ?>
                    </select>
                    <input type="submit" name="afficher" value="Valider">
                </form>

                <?php 
                    include('Fonctions.php');
                    if (isset($_POST['afficher']))
                    {
                        $tmp = array();
                        for ($i = 0; $i < sizeof($tabProd); $i++)
                        {
                            if ($tabProd[$i]['idCategorie'] == $_POST['cat'])
                            {
                                array_push($tmp, $tabProd[$i]);
                            } 
                        }
                        echo '<br><br>';
                        afficheTabHtml($tabProd, $tmp);
                    }
                ?>
            </div>
        </div>
    </div>

	<?php include("./include/footer.php"); ?>
</body>
</html>
