<?php
    session_start();
	require_once 'Controleur/ControleurCategorie.php';
	require_once 'Controleur/ControleurProduit.php';
	require_once 'Controleur/ControleurAccueil.php';
	require_once 'Controleur/ControleurConnexion.php';

	class Routeur {
		// Route une requête entrante : exécution la bonne méthode de contrôleur en fonction de l'URL 
		public function routerRequete() {
			// s'il y a un parametre 'route'
			if (isset($_SESSION['SmorgadoJonathan']))
			{
				if ($_SESSION['SmorgadoJonathan'] != 'Achille')
				{
					$ctrlConn = new ControleurConnexion();
					$ctrlConn->getFormConnexion();
				}
				else
				{
					if (!empty($_GET['route'])) {
						// on détermine avec quelle méthode de quel contrôleur on veut travailler
						switch($_GET['route']) {
							case 'produitCreate' :  //Création d'un produit
								$ctrlProd = new ControleurProduit();
								$ctrlProd->createProduit();
								break;
													
							case 'produitRead' :     
								if (!empty($_GET['id'])) {
									$ctrlProd = new ControleurProduit();
									$ctrlProd->getProduit($_GET['id']);
								}
								else { // s'il manque le paramètre id alors on affiche la liste des produits
									$ctrlProd = new ControleurProduit();
									$ctrlProd->getListeProduits();
								}
								break;
													
							case 'produitUpdate' :   // modification d'un produit à partir de son id
								$ctrlProd = new ControleurProduit();
								$ctrlProd->updateProduit($_GET['id']);
								break;
														
							case 'produitDelete' :   // suppression d'un produit à partir de son id
								$ctrlProd = new ControleurProduit();
								$ctrlProd->deleteProduit($_GET['id']);
								break;
					
							case 'categorieCreate' :     // ajout d'une catégorie...
								$ctrlCat = new ControleurCategorie();
								$ctrlCat->ajouterCategorie();
								break;
							
							case 'categorieRead' : 	  
								if (!empty($_GET['id'])) {
									$ctrlCat = new ControleurCategorie();
									$ctrlCat->getListeProduitsByCategorie($_GET['id']);
								}
								else { // s'il manque le paramètre id alors on affiche la liste des groupes
									$ctrlCat = new ControleurCategorie();
									$ctrlCat->getListeCategories();
								}
								break;

							case 'categorieUpdate' : 	  // modification d'une catégorie à partir de son id
								// TODO : Update de catégorie
								$ctrlCat = new ControleurCategorie();
								$ctrlCat->modifierCategorie($_GET['id']);
								break;
													
							case 'categorieDelete' : 	  // suppression d'une cat"gorie à partir de son id
								// TODO : Suppression de catégorie
								break;
							
							case 'deconnexion' : //Deconnexion de l'utilisateur
								session_destroy();
								$ctrlConn = new ControleurConnexion();
								$ctrlConn->getFormConnexion();
								break;
													
							default: 	              // pour toutes les autres valeurs, on affiche la page d'accueil 
								$ctrlAcc = new ControleurAccueil();
								$ctrlAcc->getAccueil();
								break;			
						}
					}
					// aucune paramètre 'route' : on affiche la page d'accueil
					else {  
						$ctrlAcc = new ControleurAccueil();
						$ctrlAcc->getAccueil();
					}
				}        
			}
			else
			{
				$ctrlConn = new ControleurConnexion();
				$ctrlConn->getFormConnexion();
			}  
		}
	}
?>
