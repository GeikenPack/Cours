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
				
				//Modification de "page 2" Par AffecterCategories
				echo '<li class="nav-item">';
				if ($page == 'AffecterCategories.php') {
					echo '<a class="nav-link active" href="AffecterCategories.php">AffecterCategories</a>';
				}
				else {
					echo '<a class="nav-link" href="AffecterCategories.php">AffecterCategories</a>';
				}
				echo '</li>';
				
				//Modificationde "page 3" par AfficheTitres
				echo '<li class="nav-item">';
				if ($page == 'AfficheTitres.php') {
					echo '<a class="nav-link active" href="AfficheTitres.php">AfficheTitres</a>';
				}
				else {
					echo '<a class="nav-link" href="AfficheTitres.php">AfficheTitres</a>';
				}
				echo '</li>';
				
				
				echo '<li class="nav-item">';
				if ($page == 'Test_multiplie.php') {
					echo '<a class="nav-link active" href="Test_multiplie.php">Test_multiplie</a>';
				}
				else {
					echo '<a class="nav-link" href="Test_multiplie.php">Test_multiplie</a>';
				}
				echo '</li>';	
			?>
        </ul>
    </div>
</div>

