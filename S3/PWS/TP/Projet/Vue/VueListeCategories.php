<!-- VueListeGroupes.php -->
<html>
    <head>
        <link rel="stylesheet" href="include/bootstrap.min.css">
        <link rel="stylesheet" href="include/styles.css">
    </head>
    <body>
        <?php include("./include/header.php"); ?>

        <?php include("./include/menus.php"); ?>
        <br><br>
        <table border="2">
            <tbody>
            <tr><th>Id Categorie</th><th>Nom Categorie</th><th>Modifier</th><th>Supprimer</th></tr>
            </tbody>
            <?php
                foreach ($vListeCategories as $vCat) {               
                    echo '<tr><td><a href="index.php?route=categorieRead&id='
                            .$vCat->idCategorie.'">'.$vCat->idCategorie.'</a></td>';
                    echo '<td>'.$vCat->nomCategorie.'</td>';
                    echo '<td><a href="index.php?route=categorieUpdate&id='.$vCat->idCategorie.'"><img src="Vue/images/modifier.jpg" height=60/></a></td>';
                    echo '<td><a href="index.php?route=categorieDelete&id='.$vCat->idCategorie.'"><img src="Vue/images/supprimer.jpg" height=60/></a></td>';
                    echo '</tr>';
                }
            ?>
        </table>
        <center><a href="index.php?route=categorieCreate"><img src="Vue/images/ajouter.jpg" height=60/></a></center>
        <?php include("./include/footer.php"); ?>
    </body>
</html>



