<html>
    <head>
        <link rel="stylesheet" href="include/bootstrap.min.css">
        <link rel="stylesheet" href="include/styles.css">
    </head>
    <body>
        <?php include("./include/header.php"); ?>

        <?php include("./include/menus.php"); ?>
        <br><br>
        <table border=2>
            <?php
                echo '<tr><td>id Produit </td><td>' . $vProd->idProduit. '</td></tr>';
                echo '<tr><td>id Categorie </td><td>' . $vProd->idCategorie. '</td></tr>';
                echo '<tr><td>nom Produit </td><td>' . $vProd->nomProduit. '</td></tr>';
                echo '<tr><td>prix produit </td><td>' . $vProd->prixProduit. '</td></tr>';
                echo '<tr><td>image produit </td><td><img src="Vue/images/' . $vProd->image.'.gif" height=100/></td></tr>';
            ?>
        </table>
        <?php include("./include/footer.php"); ?>
    </body>
</html>