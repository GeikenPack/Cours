<?php
include_once("Produit.php");
include_once("connect.inc.php");

class ModeleProduit {
	// methode qui renvoie un tableau d'objets Etudiants
	// ce tableau est construit à partir d'une requête SQL sur la table Etudiants de la BD
    public function getListeProduits() {
		// cette instruction permet d'utiliser dans cette fonction la variable $conn 
		// qui a été initialisée dans le script connect.inc.php
		global $conn;
		$res = $conn->prepare("Select * from Produits");
		$res->execute();
		var_dump($res);	
		$ListeProd = NULL;		
		foreach($res as $prod) {
		    $ListeProd[] = new Produit($prod["idProduit"], $prod["idCategorie"], $prod["nomProduit"], $prod["prixProduit"]);
 		}
		return $ListeProd; 
    }
	
    public function getProduit($idProduit) {
		global $conn;
		$res = $conn->prepare("Select * from Produits where idProduit = :pIdProduit");
		$res->execute(array('pIdProduit' => $idProduit));
		$prod = $res->fetch();
		$unProduit = new Produit($prod["idProduit"], $prod["idCategorie"], $prod["nomProduit"],$prod["prixProduit"]);
        return $unProduit;
    }	
	
	public function getListeProduitsByCategorie($idCategorie) {
		global $conn;
		$res = $conn->prepare("Select * from Produits where idCategorie = :pIdCategorie");
		$res->execute( array ('pIdCategorie' => $idCategorie) );	
		$ListeProdCat = NULL;
		foreach($res as $prod) {
		    $ListeProdCat[] = new Produit($prod["idProduit"], $prod["idCategorie"], $prod["nomProduit"], $prod["prixProduit"]);
 		}
		return $ListeProdCat; 
    }		
}
?>
