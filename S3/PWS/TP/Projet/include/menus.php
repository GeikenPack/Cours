<div id="sidebar" class="sidebar-offcanvas">
    <div style="padding-top: 30px;" class="col-md-12">
        <ul class="nav nav-pills flex-column">
            
			<?php
				// on récupère le nom du script executé sans son chemin
				$page = pathinfo($_SERVER['PHP_SELF'], PATHINFO_BASENAME);
				// echo $page;
				echo '<li class="nav-item">';
				if ($page == 'index.php') {
					echo '<a class="nav-link active" href="index.php">Accueil</a>';
				}
				else {
					echo '<a class="nav-link" href="index.php">Accueil</a>';
				}
				echo '</li>';
				
				//Modification de "AffecterCategories" Par Exo_1_1
				echo '<li class="nav-item">';
				if ($page == 'index.php?route=produitRead') {
					echo '<a class="nav-link active" href="index.php?route=produitRead">Consulter les produits</a>';
				}
				else {
					echo '<a class="nav-link" href="index.php?route=produitRead">Consulter les produits</a>';
				}
				echo '</li>';
				
				//Modificationde "AfficheTitres" par Exo_1_2
				echo '<li class="nav-item">';
				if ($page == 'index.php?route=categorieRead') {
					echo '<a class="nav-link active" href="index.php?route=categorieRead">Consulter les catégories</a>';
				}
				else {
					echo '<a class="nav-link" href="index.php?route=categorieRead">Consulter les catégories</a>';
				}
				echo '</li>';


				echo '<li class="nav-item">';
				if ($page == 'index.php?route=deconnexion') {
					echo '<a class="nav-link active" href="index.php?route=deconnexion">Se déconnecter (suppression de la session)</a>';
				}
				else {
					echo '<a class="nav-link" href="index.php?route=deconnexion">Se déconnecter (suppression de la session)</a>';
				}
				echo '</li>';
			?>
        </ul>
    </div>
</div>

