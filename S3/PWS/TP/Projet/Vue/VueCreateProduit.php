<html>
    <head>
        <link rel="stylesheet" href="include/bootstrap.min.css">
        <link rel="stylesheet" href="include/styles.css">
    </head>
    <body>
        <?php include("./include/header.php"); ?>

        <?php include("./include/menus.php"); ?>
        <br><br>
        <form method="POST" enctype='multipart/form-data'>
            <table border=2>
                <tr><td>idProduit:</td><td><input type="text" name="idProduit"></td></tr>
                <tr><td>idCategorie:</td><td><select name="idCategorie">
                    <?php
                        foreach($vListeCat as $vCat)
                        {
                            echo '<option value="'.$vCat->idCategorie.'">'.$vCat->nomCategorie.'</option>';
                        }
                    ?></select>
                </td></tr>
                <tr><td>nom produit:</td><td><input type="text" name="nomProduit"></td></tr>
                <tr><td>prix produit:</td><td><input type="number" name="prixProduit"></td></tr>
                <tr><td>image:</td><td><input type="file" name="image"></td></tr>
            </table><br>
            <center><input type="submit" name="Valider" value = Valider><center>
        </form>

        <?php include("./include/footer.php"); ?>
    </body>
</html>
    
