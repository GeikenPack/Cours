<?php
include_once("Modele/ModeleProduit.php");
class ControleurProduit {
	
    private $modeleProduit;
	
    public function __construct() {
          $this->modeleProduit = new ModeleProduit();
    }
	
	public function getListeProduits() {
        var_dump($modeleProduit);
        $vListeProduits = $this->modeleProduit->getListeProduits();
        include 'Vue/VueListeProduits.php';
	} 
	
    public function getProduit($idProd) {
		$vProd = $this->modeleProduit->getProduit($idProd);
        include 'Vue/VueProduit.php';
    }
	   
}
?>
