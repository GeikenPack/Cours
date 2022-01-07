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
							case 'produitCreate' :  
								$ctrlProd = new ControleurProduit();
								$ctrlProd->createProduit();
								break;
													
							case 'produitRead' :     
								if (!empty($_GET['id'])) {
									$ctrlProd = new ControleurProduit();
									$ctrlProd->getProduit($_GET['id']);
								}
								else { // s'il manque le paramètre id alors on affiche la liste des étudiants
									$ctrlProd = new ControleurProduit();
									$ctrlProd->getListeProduits();
								}
								break;
													
							case 'produitUpdate' :   // modification d'un étudiant à partir de son id
								break;
														
							case 'produitDelete' :   // suppression d'un étudiant à partir de son id
								break;
					
							case 'categorieCreate' :     // ajout d'un groupe...
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

							case 'categorieUpdate' : 	  // modification d'un groupe à partir de son id
								break;
													
							case 'categorieDelete' : 	  // suppression d'un groupe à partir de son id
								break;
							
							case 'deconnexion' : //Deconnexion de l'utilisateur
								session_destroy();
								$ctrlConn = new ControleurConnexion();
								$ctrlConn->getFormConnexion();
								break;
													
							default: 	              // pour toutes les autres valeurs, on affiche la liste des groupes 
								$ctrlAcc = new ControleurAccueil();
								$ctrlAcc->getAccueil();
								break;			
						}
					}
					// aucune paramètre 'route' : on affiche la liste des groupes
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
