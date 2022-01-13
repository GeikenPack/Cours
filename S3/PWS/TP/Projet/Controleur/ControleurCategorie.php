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

    public function ajouterCategorie()
    {
        include 'Vue/VueCreateCategorie.php';
        if (isset($_POST['Valider']))
        {
            if (preg_match("#^[4-9]00$#", $_POST['idCat']) && preg_match('#^[a-zA-Z ]{3,25}$#i', $_POST['nomCat']))
            {
                $cat = new Categorie($_POST['idCat'], $_POST['nomCat']);
                $this->modeleCat->ajouterCategorie($cat);
                echo "<script type='text/javascript'>alert('Catégorie ajouté');</script>";
            }
            else
            {
                echo '<center>Erreur de saisie</center';
            }
        }
    }

    public function modifierCategorie($idCat)
    {
        $cat = $this->modeleCat->getCategorie($idCat);
        include 'Vue/VueUpdateCategorie.php';
        if(isset($_POST['Valider']))
        {
            if (preg_match('#^[a-zA-Z éè]{3,25}$#i', $_POST['nomCat']))
            {
                $cat = new Categorie($idCat, $_POST['nomCat']);
                $this->modeleCat->modifierCategorie($cat);
                echo "<script type='text/javascript'>alert('Catégorie modifié'); window.location.href = 'index.php?route=categorieRead'</script>";
            }
            else
            {
                echo '<center>Erreur de saisie</center>';
            }
        }
    }
}
?>
