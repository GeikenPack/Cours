<!-- VueListeGroupes.php -->
<html>
<head></head>
<body>
    <table border="2">
        <tbody>
          <tr><th>Id Categorie</th><th>Nom Categorie</th></tr>
        </tbody>
        <?php
            foreach ($vListeCategories as $vCat) {               
                 echo '<tr><td><a href="index.php?route=categorieRead&id='
						.$vCat->idCategorie.'">'.$vCat->idCategorie.'</a></td>';
				 echo '<td>'.$vCat->nomCategorie.'</td></tr>';
            }
        ?>
    </table>
</body>
</html>



