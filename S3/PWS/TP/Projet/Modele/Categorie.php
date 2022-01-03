<?php
// Groupe.php
// Cette classe servira à transferer, en mode objet, des données entre le modèle, le contrôleur et la vue
class Categorie {
    public $idCategorie;
    public $nomCategorie;

    public function __construct($idCategorie, $nomCategorie) {
        $this->idCategorie = $idCategorie;
        $this->nomCategorie = $nomCategorie;
    }
}
?>