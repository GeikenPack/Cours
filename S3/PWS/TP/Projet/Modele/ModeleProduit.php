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
		$ListeProd = NULL;		
		foreach($res as $prod) {
		    $ListeProd[] = new Produit($prod["idProduit"], $prod["idCategorie"], $prod["nomProduit"], $prod["prixProduit"], $prod["Image"]);
 		}
		return $ListeProd; 
    }
	
    public function getProduit($idProduit) {
		global $conn;
		$res = $conn->prepare("Select * from Produits where idProduit = :pIdProduit");
		$res->execute(array('pIdProduit' => $idProduit));
		$prod = $res->fetch();
		$unProduit = new Produit($prod["idProduit"], $prod["idCategorie"], $prod["nomProduit"],$prod["prixProduit"], $prod["Image"]);
        return $unProduit;
    }	
	
	public function getListeProduitsByCategorie($idCategorie) {
		global $conn;
		$res = $conn->prepare("Select * from Produits where idCategorie = :pIdCategorie");
		$res->execute( array ('pIdCategorie' => $idCategorie) );	
		$ListeProdCat = NULL;
		foreach($res as $prod) {
		    $ListeProdCat[] = new Produit($prod["idProduit"], $prod["idCategorie"], $prod["nomProduit"], $prod["prixProduit"], $prod["Image"]);
 		}
		return $ListeProdCat; 
    }		

	public function createProduit($prod)
	{
		global $conn;
		$res = $conn->prepare('INSERT Into Produits VALUES (:pidProduit, :pidCategorie, :pnomProduit, :pprixProduit, :pImage)');
		
		$res->execute(array('pidProduit' => $prod->idProduit,
							'pidCategorie' => $prod->idCategorie,
							'pnomProduit' => $prod->nomProduit,
							'pprixProduit' => $prod->prixProduit,
							'pImage' => $prod->image));
	}

	public function updateProduit($prod)
	{
		global $conn;
		$res = $conn->prepare('UPDATE Produits SET idCategorie = :idC,
													nomProduit = :nomP,
													prixProduit = :prixP, 
													image = :pimage 
												WHERE idProduit = :idP');
		$res->execute(array('idC' => $prod->idCategorie, 
							'nomP' => $prod->nomProduit, 
							'prixP' => $prod->prixProduit, 
							'pimage' => $prod->image, 
							'idP' => $prod->idProduit));
	}

	public function deleteProduit($idProduit)
	{
		global $conn;
		$res = $conn->prepare('DELETE FROM Produits WHERE idProduit = :idProduit');
		$res->execute(array('idProduit' => $idProduit));
		$filename = 'prod'.$idProduit.'.gif';
		unlink('Vue/images/'.$filename);
	}
}
?>
