<?php
// ControleurGroupe.php
include_once("Modele/ModeleCategorie.php");
include_once("Modele/ModeleProduit.php");

class ControleurCategorie {  
	private $modeleCat;
	private $modeleProduit;
    
	public function __construct() {
        $this->modeleCat = new ModeleCategorie();
		$this->modeleProduit = new ModeleProduit();  
    }
	
	public function getlisteCategories() {
        $vListeCategories = $this->modeleCat->getListeCategories();
        include 'Vue/VueListeCategories.php';
    }
	
	public function getListeProduitsByCategorie($idCat) {
		$vListeProduits = $this->modeleProduit->getListeProduitsByCategorie($idCat);
        include 'Vue/VueListeProduits.php';
    }
}
?>
