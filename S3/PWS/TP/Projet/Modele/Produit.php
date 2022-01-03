<?php
// Cette classe servira à transferer, en mode objet, des données entre le modèle, le contrôleur et la vue
class Produit {
    public $idProduit;
    public $idCategorie;
    public $nomProduit;
	public $prixProduit;

    public function __construct($idProduit, $idCategorie, $nomProduit, $prixProduit) {
        $this->idProduit = $idProduit;
        $this->idCategorie = $idCategorie;
        $this->nomProduit = $nomProduit;
		$this->prixProduit = $prixProduit;
    }
}
?>