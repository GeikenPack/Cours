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
				if ($page == 'Exo_1_1.php') {
					echo '<a class="nav-link active" href="Exo_1_1.php">Exo_1_1</a>';
				}
				else {
					echo '<a class="nav-link" href="Exo_1_1.php">Exo_1_1</a>';
				}
				echo '</li>';
				
				//Modificationde "AfficheTitres" par Exo_1_2
				echo '<li class="nav-item">';
				if ($page == 'Exo-1-2.php') {
					echo '<a class="nav-link active" href="exo_1_2.php">Exo_1_2</a>';
				}
				else {
					echo '<a class="nav-link" href="Exo_1_2.php">Exo_1_2</a>';
				}
				echo '</li>';
				
				
				echo '<li class="nav-item">';
				if ($page == 'Exo_1_3.php') {
					echo '<a class="nav-link active" href="Exo_1_3.php">Exo_1_3</a>';
				}
				else {
					echo '<a class="nav-link" href="Exo_1_3.php">Exo_1_3</a>';
				}
				echo '</li>';

				echo '<li class="nav-item">';
				if ($page == 'Exo_1_4.php') {
					echo '<a class="nav-link active" href="Exo_1_4.php">Exo_1_4</a>';
				}
				else {
					echo '<a class="nav-link" href="Exo_1_4.php">Exo_1_4</a>';
				}
				echo '</li>';	

				echo '<li class="nav-item">';
				if ($page == 'Exo_1_5.php') {
					echo '<a class="nav-link active" href="Exo_1_5.php">Exo_1_5</a>';
				}
				else {
					echo '<a class="nav-link" href="Exo_1_5.php">Exo_1_5</a>';
				}
				echo '</li>';

				echo '<li class="nav-item">';
				if ($page == 'Test_multiplie.php') {
					echo '<a class="nav-link active" href="Test_multiplie.php">Exo_2</a>';
				}
				else {
					echo '<a class="nav-link" href="Test_multiplie.php">Exo_2</a>';
				}
				echo '</li>';
			?>
        </ul>
    </div>
</div>

