<?php
// Cette classe servira à transferer, en mode objet, des données entre le modèle, le contrôleur et la vue
class Produit {
    public $idProduit;
    public $idCategorie;
    public $nomProduit;
	public $prixProduit;
    public $image;

    public function __construct($idProduit, $idCategorie, $nomProduit, $prixProduit, $image) {
        $this->idProduit = $idProduit;
        $this->idCategorie = $idCategorie;
        $this->nomProduit = $nomProduit;
		$this->prixProduit = $prixProduit;
        $this->image = $image;
    }
}
?>