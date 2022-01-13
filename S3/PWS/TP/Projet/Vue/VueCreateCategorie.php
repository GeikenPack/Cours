<html>
    <head>
        <link rel="stylesheet" href="include/bootstrap.min.css">
        <link rel="stylesheet" href="include/styles.css">
    </head>
    <body>
        <?php include("./include/header.php"); ?>

        <?php include("./include/menus.php"); ?>
        <br><br>
        <center>
            <p>Veuillez entrer les informations de la nouvelle categorie :</p>
            <form method="POST" enctype='multipart/form-data'>
                Id du type : <input type="text" name="idCat" value="400"><br><br>
                Nom du type : <input type="text" name="nomCat" value="Mobile"><br><br>
                <input type="submit" name="Valider" value = Valider><br><br>
            </form>
        </center>
        <?php include("./include/footer.php"); ?>
    </body>
</html>
    
