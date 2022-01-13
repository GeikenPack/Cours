<?php
// ModeleGroupe.php
include_once("Categorie.php"); 
include_once("connect.inc.php");
include_once("ModeleProduit.php");

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

	public function getCategorie($idCat)
	{
		global $conn;
		$res = $conn->prepare("SELECT * FROM Categories WHERE idCategorie = :pIdCat");
		$res->execute(array('pIdCat'=>$idCat));
		$cat = $res->fetch();
		return new Categorie($cat['idCategorie'], $cat['nomCategorie']);
	}

	public function ajouterCategorie($cat)
	{
		global $conn;
		$res = $conn->prepare("INSERT INTO Categories VALUES (:pIdCat, :pNomCat)");
		$res->execute(array('pIdCat'=>$cat->idCategorie, 'pNomCat'=>$cat->nomCategorie));
	}

	public function modifierCategorie($cat)
	{
		global $conn;
		$res = $conn->prepare("UPDATE Categories SET nomCategorie = :pNomC WHERE idCategorie = :pIdC");
		$res->execute(array('pNomC'=>$cat->nomCategorie, 'pIdC'=>$cat->idCategorie));
	}

	public function supprimerCategorie($idCat)
	{
		global $conn;
		$res = $conn->prepare("DELETE FROM Produits WHERE idCategorie = :pIdCat");
		$res->execute(array('pIdCat'=>$idCat));
		$modeleP = new ModeleProduit();
		$listeProd = $modeleP->getListeProduitsByCategorie($idCat);
		foreach($listeProd as $prod)
		{
			$filename = 'prod'.$prod->idProduit.'.gif';
			unlink('Vue/images/'.$filename);
		}
		$res = $conn->prepare("DELETE FROM Categories WHERE idCategorie = :pIdCat");
		$res->execute(array('pIdCat'=>$idCat));
	}
}
?>
