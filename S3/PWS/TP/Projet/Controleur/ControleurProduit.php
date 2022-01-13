<?php
include_once("Modele/ModeleProduit.php");
include_once("Modele/ModeleCategorie.php");
include_once("Modele/Produit.php");
class ControleurProduit {
	
    private $modeleProduit;
    private $modeleCategorie;
	
    public function __construct() {
          $this->modeleProduit = new ModeleProduit();
          $this->modeleCategorie = new ModeleCategorie();
    }
	
	public function getListeProduits() {
        $vListeProduits = $this->modeleProduit->getListeProduits();
        include 'Vue/VueListeProduits.php';
	} 
	
    public function getProduit($idProd) {
		$vProd = $this->modeleProduit->getProduit($idProd);
        include 'Vue/VueProduit.php';
    }
	   
    public function createProduit() 
    {
        $vListeCat = $this->modeleCategorie->getListeCategories();
        include 'Vue/VueCreateProduit.php';
        $extensionsAutorisees = array('jpg', 'png', 'gif', 'jpeg');
        if(isset($_POST['Valider']))
        {
            if(is_numeric($_POST['idProduit']) && is_numeric($_POST['prixProduit']))
            {
                if($_POST['idProduit']>=$_POST['idCategorie'] && $_POST['idProduit']<$_POST['idCategorie']+100)
                {
                    if (!empty($_FILES['image']) && $_FILES['image']['error'] == 0)
                    {
                        $infosFichier = pathinfo($_FILES['image']['name']);
                        $extension = $infosFichier['extension'];
                        if (in_array($extension, $extensionsAutorisees))
                        {
                            move_uploaded_file($_FILES['image']['tmp_name'], 'Vue/images/'.basename($_FILES['image']['name']));
                            rename('Vue/images/'.basename($_FILES['image']['name']), 'Vue/images/prod'.$_POST['idProduit'].'.'.$extension);
                            $nomImage = 'prod';
                            $nomImage .= $_POST['idProduit'];
                            $produit = new Produit($_POST['idProduit'], $_POST['idCategorie'], $_POST['nomProduit'], $_POST['prixProduit'], $nomImage);
                            $this->modeleProduit->createProduit($produit);
                            echo "<script type='text/javascript'>alert('Produit ajouté');</script>";
                        }
                    }
                }
            }
            else
            {
                echo "Erreur lors de la saisie";
            }
        }
    }

    public function updateProduit($idProduit)
    {
        $vListeCat = $this->modeleCategorie->getListeCategories();
        $vProd = $this->modeleProduit->getProduit($idProduit);
        include 'Vue/VueUpdateProduit.php';
        $extensionsAutorisees = array('jpg', 'png', 'gif', 'jpeg');
        if(isset($_POST['Valider']))
        {
            if(is_numeric($_POST['prixProduit']))
            {
                if (!empty($_FILES['image']) && $_FILES['image']['error'] == 0)
                {
                    $infosFichier = pathinfo($_FILES['image']['name']);
                    $extension = $infosFichier['extension'];
                    if (in_array($extension, $extensionsAutorisees))
                    {
                        move_uploaded_file($_FILES['image']['tmp_name'], 'Vue/images/'.basename($_FILES['image']['name']));
                        rename('Vue/images/'.basename($_FILES['image']['name']), 'Vue/images/prod'.$idProduit.'.'.$extension);
                    }
                }
                $nomImage = 'prod';
                $nomImage .= $idProduit;
                $produit = new Produit($idProduit, $_POST['idCategorie'], $_POST['nomProduit'], $_POST['prixProduit'], $nomImage);
                $this->modeleProduit->updateProduit($produit);
                echo "<script type='text/javascript'>alert('Produit Modifié'); window.location.href = 'index.php?route=produitRead'</script>";
            }
        }
    }

    public function deleteProduit($idProduit)
    {
        $this->modeleProduit->deleteProduit($idProduit);
        echo "<script type='text/javascript'>alert('Produit Supprimé'); window.location.href = 'index.php?route=produitRead'</script>";
    }
}
?>
