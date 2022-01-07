<html>
	<head>
		<link rel="stylesheet" href="include/bootstrap.min.css">
		<link rel="stylesheet" href="include/styles.css">
	</head>
	<body>
		<?php include("./include/header.php"); ?>

		<?php include("./include/menus.php"); ?>
		<br><br>
			<?php
				// s'il y a des étudiants à afficher
				if ($vListeProduits != NULL) {	
					echo ' <table border="2">';
					echo '<tbody>';
					echo '<tr><th>id Produit</th><th>id Categorie</th><th>nom Produit</th><th>prix produit</th><th>image</th><th>Modifier</th><th>Supprimer</th></tr>';
					echo '</tbody>';
					foreach ($vListeProduits as $vProd) { 
						// on génère une URL dynamique afin de pouvoir visualiser le  
						//  détail d'un étudiant
						echo '<tr><td><a href="index.php?route=produitRead&id='.$vProd->idProduit.'">'.$vProd->idProduit.'</a></td>';
						echo '<td>'.$vProd->idCategorie.'</td><td>'.$vProd->nomProduit.'</td><td>'.$vProd->prixProduit.'</td><td><img src="Vue/images/'.$vProd->image.'.gif" height=60/></td>';
						echo '<td><img src="Vue/images/modifier.jpg" height=60</td><td><img src="Vue/images/supprimer.jpg" height=60</td></tr>';
					}
					echo "</table>";
					echo '<center><a href="index.php?route=produitCreate"><img src="Vue/images/ajouter.jpg" height=60></a></center>';
				}
				else {
					echo "Pas de produits...<BR>";
				}
			?>
		</table>
		<?php include("./include/footer.php"); ?>
	</body>
</html>