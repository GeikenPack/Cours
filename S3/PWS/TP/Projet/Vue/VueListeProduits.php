<html>
<head></head>
<body>
        <?php
			// s'il y a des étudiants à afficher
            if ($vListeProduits != NULL) {	
				echo ' <table border="2">';
				echo '<tbody>';
				echo '<tr><th>id Produit</th><th>id Categorie</th><th>nom Produit</th><th>prix produit</th></tr>';
				echo '</tbody>';
				foreach ($vListeProduits as $vProd) { 
					// on génère une URL dynamique afin de pouvoir visualiser le  
					//  détail d'un étudiant
					 echo '<tr><td><a href="index.php?route=produitRead&id='.$vProd->idProduit.'">'.$vProd->idProduit.'</a></td>';
					 echo '<td>'.$vProd->idCategorie.'</td><td>'.$vProd->nomProduit.'</td><td>'.$vProd->prixProduit.'</td></tr>';
				}
				echo "</table>";
			}
			else {
				echo "Pas de produits...<BR>";
			}
        ?>
    </table>
</body>
</html>



