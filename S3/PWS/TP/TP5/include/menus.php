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
				if ($page == 'ConsultPrix.php') {
					echo '<a class="nav-link active" href="ConsultPrix.php">Consulter les produits par tranche de prix</a>';
				}
				else {
					echo '<a class="nav-link" href="ConsultPrix.php">Consulter les produits par tranche de prix</a>';
				}
				echo '</li>';
				
				//Modificationde "AfficheTitres" par Exo_1_2
				echo '<li class="nav-item">';
				if ($page == 'ConsultCat.php') {
					echo '<a class="nav-link active" href="ConsultCat.php">Consulter les produits par catégories</a>';
				}
				else {
					echo '<a class="nav-link" href="ConsultCat.php">Consulter les produits par catégories</a>';
				}
				echo '</li>';

				echo '<li class="nav-item">';
				if ($page == 'Deconnexion.php') {
					echo '<a class="nav-link active" href="Deconnexion.php">Se déconnecter</a>';
				}
				else {
					echo '<a class="nav-link" href="Deconnexion.php">Se déconnecter</a>';
				}
				echo '</li>';

				echo '<li class="nav-item">';
				if ($page == 'DestCook.php') {
					echo '<a class="nav-link active" href="DestCook.php?lien='.$_SERVER['PHP_SELF'].'">Détruire le cookie</a>';
				}
				else {
					echo '<a class="nav-link" href="DestCook.php?lien='.$_SERVER['PHP_SELF'].'">Détruire le cookie</a>';
				}
				echo '</li>';
			?>
        </ul>
    </div>
</div>

