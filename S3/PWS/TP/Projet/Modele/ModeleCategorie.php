<?php
// ModeleGroupe.php
include_once("Categorie.php"); 
include_once("connect.inc.php");

class ModeleCategorie {
	// methode qui renvoie un tableau d'objets Groupes
	// ce tableau est construit à partir d'une requête SQL sur la table Groupes de la BD
    
	public function getListeCategories() {
		global $conn;
		$res = $conn->prepare("Select * from Categories");
		$res->execute();
		foreach($res as $cat) {
		    $ListeCat[] = new Categorie($cat["idCategorie"], $cat["nomCategorie"]);
 		}
		return $ListeCat; 
    }
}
?>
