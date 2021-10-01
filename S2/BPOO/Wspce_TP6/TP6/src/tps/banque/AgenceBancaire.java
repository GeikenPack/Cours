package tps.banque;

import java.util.ArrayList;


import tps.banque.Compte;
import tps.banque.exception.ABCompteDejaExistantException;
import tps.banque.exception.ABCompteInexistantException;
import tps.banque.exception.ABCompteNullException;


/************************************************************
 * La classe AgenceBancaire permet de gérer une agence bancaire comme un ensemble de Comptes.<BR>
 * Une AgenceBancaire a un nom, une localisation (ville) et gère un ensemble de Comptes.<BR>
 * Exemple : agence "Agence Caisse Epargne" à "Pibrac".<BR>
 * Chaque Compte de l'AgenceBancaire a un numéro unique (vérification faite lors de l'ajout d'un Compte).<BR>
 * 
 * @author André Péninou.
 * @version 7.02
 *****************************/

public class AgenceBancaire {
	// Attributs
	private String nom;
	private String	loc;
	private ArrayList<Compte> alCptes;

	/**
	 * Constructeur paramétré.<BR>
	 * Permet de créer une AgenceBancaire en donnant son nom et sa ville.<BR>
	 * L'AgenceBancaire est initialisée avec 0 comptes.<BR>
	 * 
	 * @param pfNomAgence
	 *            Le nom de l'AgenceBancaire.
	 * @param pfLocAgence
	 *            La ville de localisation de l'AgenceBancaire.
	 */

	public AgenceBancaire(String pfNomAgence, String pfLocAgence) {

		// TODO : à écrire
		this.nom = pfNomAgence;
		this.loc = pfLocAgence;
		this.alCptes = new ArrayList<Compte>();
	}

	/**
	 * Permet de connaître le nom de l'AgenceBancaire.<BR>
	 * <BR>
	 * 
	 * @return Le nom de l'AgenceBancaire.
	 */

	public String getNomAgence() {

		// TODO : à écrire
		return this.nom;
	}

	/**
	 * Permet de connaître la localisation de l'AgenceBancaire.<BR>
	 * <BR>
	 * 
	 * @return La ville de localisation de l'AgenceBancaire.
	 */

	public String getLocAgence() {

		// TODO : à écrire
		return this.loc;
	}

	/**
	 * Permet de connaître le nombre de Comptes existant dans l'AgenceBancaire.<BR>
	 * <BR>
	 * 
	 * @return Le nombre de comptes de l'AgenceBancaire.
	 */

	public int getNbComptes() {
		
		// TODO : à écrire
		return alCptes.size(); // A enlever
	}

	/**
	 * Permet de retrouver un Compte de l'AgenceBancaire à partir de son numéro de
	 * compte (unique).<BR>
	 * Renvoie null si le Compte de numéro de compte donné n'est pas
	 * trouvé.<BR>
	 * <BR>
	 * 
	 * @param pfNumCompte
	 *            Le numéro du Compte recherché.
	 * @see AgenceBancaire#addCompte(Compte)
	 * @return Le Compte de numéro pNumCompte, null si le compte n'est pas
	 *         trouvé.
	 */

	public Compte getCompte(String pfNumCompte) {
		
		// TODO : à écrire
		if (trouveCompte(pfNumCompte) == -1)
		{
			return null;
		}
		return alCptes.get(trouveCompte(pfNumCompte)); // A enlever
	}

	/**
	 * Permet de retrouver les Comptes de l'AgenceBancaire correspondant à un nom de
	 * propriétaire donné.<BR>
	 * Renvoie un tableau du nombre de Comptes ayant pour propriétaire
	 * le nom de priopriétaire donné (et contenant les Comptes correspondants...).<BR>
	 * Si aucun Compte n'est trouvé, renvoie un tableau de longueur 0.<BR>
	 * <BR>
	 * 
	 * @param pfNomProprietaire
	 *            Le nom du propriétaire de Compte dont on veut les Comptes.
	 * @see AgenceBancaire#addCompte(Compte)
	 * @return Un tableau des Comptes ayant pour propriétaire pNomProprietaire,
	 *         un tableau de longueur 0 si aucun compte n'est trouvé.
	 */

	public Compte[] getComptesDe(String pfNomProprietaire) {
		/*
		 * Méthode : créer une ArrayList de Compte temporaire : alTemp. 
		 * Parcourir this.alCptes.
		 * 	Si un compe appartient au proprietaire 
		 * 		=> le garder dans alTemp.
		 * Si alTemp non vide : recopier tous les comptes de alTemp dans
		 * un nouveau tableau qui sera renvoyé 
		 * Sinon créer un tableau de 0 éléments.
		 */
		
		/* Première méthode
		Compte t[], cTemp;
		ArrayList<Compte> alTemp; // ArrayList de Compte temporaire
		int nbC, nbCTemp, i;

		t = null;

		// Recherche des comptes de pNomProprietaire dans l'AgenceBancaire
		alTemp = new ArrayList<Compte>();
		nbC = this.alCptes.size();
		for (i = 0; i < nbC; i++) {
			cTemp = alCptes.get(i);
			if (cTemp.getProprietaire().equals(pfNomProprietaire)) {
				alTemp.add(cTemp);
			}
		}

		// Si on a trouvé des comptes ...
		if (alTemp.size() != 0) {
			// ... on crée un tableau et on les recopie
			nbCTemp = alTemp.size();
			t = new Compte[nbCTemp];
			for (i = 0; i < nbCTemp; i++) {
				t[i] = alTemp.get(i);
			}
			/*
			 * Ou bien directement, sans les lignes ci-dessus :
			 *		t = alTemp.toArray(new Compte[0]); 
			 * cf. doc ArrayList / T[] toArray(T[])
			 *//*
		} else {
			// ... pas de compte dans un tableau vide
			t = new Compte[0];
		}
		return t;
		*/
		//Première méthode, coup de calcul :
		//Deux accès en lecture et écriture dans une ArrayList. On a donc un coup de 4n avec n etant le nombre de comptes.
		
		
		//Deuxiéme méthode
		int iPrem, iDer, nbC;
		iPrem = -1;
		iDer = 0;
		nbC = 0;
		//Cherche le nombre de compte pour le propriétaire donnée, l'indice du premier et du dernier compte de ce propriétaire.
		for (int i = 0; i < alCptes.size(); i++)
		{
			if (alCptes.get(i).getProprietaire().equals(pfNomProprietaire))
			{
				if (iPrem == -1) {
					iPrem = i;}
				iDer = i;
				nbC++;
			}
		}
		//Creation du tableau de compte
		Compte[] tabC = new Compte[nbC];
		int iActTabC = 0;
		//Remplir le nouveau tableau de compte si des comptes on été trouver
		if (nbC != 0)
			{
			for (int i = iPrem; i < iDer+1; i++)
			{
				if (alCptes.get(i).getProprietaire().equals(pfNomProprietaire))
				{
					tabC[iActTabC] = alCptes.get(i);
					iActTabC++;
				}
			}
		}
		return tabC;
		//Deucième méthode, Coup de calcul :
		//On a un accès en lecture seulement au début de l'ArrayList ce qui nous fait 1n et ensuite un accès en lecture et écriture sur une partie réduite de l'ArrayList ce qui nous fait moins de 2n. Nous avons donc un coup de moins de 3n ce qui est mieux que la première version.
	}
	 

	/**
	 * Permet d'afficher une AgenceBancaire -<B> SPECIAL TP.</B><BR>
	 * <BR>
	 * Affiche le nom de l'AgenceBancaire, sa localisation, le nombre de Comptes,
	 * chaque Compte avec son solde.<BR>
	 * <BR>
	 * <B>ATTENTION : Méthode spéciale pour les TP.</B><BR>
	 * <BR>
	 */

	public void afficher() {
		int i, nbC;
		Compte cTemp;

		System.out.println();
		System.out.println("Nom : " + this.nom + " (" + this.loc + ")");
		System.out.println("" + this.alCptes.size() + " Comptes :");
		nbC = this.alCptes.size();
		for (i = 0; i < nbC; i++) {
			cTemp = alCptes.get(i);
			cTemp.afficher();
			System.out.println("   Solde : " + cTemp.soldeCompte());
		}
		System.out.println();
	}

	/**
	 * Permet d'obtenir la représentation String d'une AgenceBancaire.<BR>
	 * <BR>
	 * Donne le nom de l'AgenceBancaire, la localisation, le nombre de Comptes.<BR>
	 * <BR>
	 */

	public String toString() {
		return "Nom Agence : " + this.nom + " (" + this.loc + ") : "+this.alCptes.size()+" cptes";
	}
	
	/**
	 * Permet d'ajouter un Compte à l'AgenceBancaire.<BR>
	 * Le Compte est ajouté à l'AgenceBancaire s'il n'existe pas déjà un Compte
	 * ayant le même numéro de compte  
	 * (identique en numéro de compte, cf. méthode getNumCompte() de la classe Compte).<BR>
	 * Si on appelle la méthode avec null en paramètre, la méthode lève une exception.<BR>
	 * 
	 * @param pfCompteAAjouter
	 *            Le Compte à ajouter à l'AgenceBancaire.
	 * @throws ABCompteNullException  lorsque pCompteAAjouter == null	
	 * @throws ABCompteDejaExistantException  lorsque un compte de numéro pCompteAAjouter.getNumCompte() existe déjà dans l'AgenceBancaire.
	 * @see AgenceBancaire#removeCompte(String)
	 */

	public void addCompte(Compte pfCompteAAjouter) throws ABCompteNullException, ABCompteDejaExistantException {
		
		// TODO : à écrire
		if (pfCompteAAjouter == null)
		{
			throw new ABCompteNullException();
		}
		if (trouveCompte(pfCompteAAjouter.getNumCompte()) != -1)
		{
			throw new ABCompteDejaExistantException();
		}
		alCptes.add(pfCompteAAjouter);
	}

	/**
	 * Permet de supprimer un Compte de l'AgenceBancaire, à partir de son numéro.<BR>
	 * Le Compte (unique) du numéro donné est retiré de l'AgenceBancaire s'il est
	 * trouvé.<BR>
	 * Une exception est levée si le compte n'est pas trouvé.<BR>
	 * 
	 * @param pfNumCompte
	 *            Le numéro du Compte à supprimer de l'AgenceBancaire.
	 * @throws ABCompteInexistantException	Lorsque aucun compte de numéro pNumCompte ne peut être trouvé.
	 * @see AgenceBancaire#addCompte(Compte)
	 */
	
	public void removeCompte(String pfNumCompte) throws ABCompteInexistantException{
		
		// TODO : à écrire
		if (trouveCompte(pfNumCompte) == -1)
		{
			throw new ABCompteInexistantException();
		}
		alCptes.remove(trouveCompte(pfNumCompte));
	}


	/**
	 * Méthode privée de recherche du rang du Compte ayant un numéro recherché.
	 * Cherche le rang (indice) contenant un compte ayant pour numéro le numéro en paramètre.
	 * Renvoie -1 si aucun compte n'est trouvé.
	 *
	 * @param      pfNC  numéro du compte recherché
	 * @return     le rang du Compte trouvé ayant pour numéro pNC ou -1 si non trouvé. 
	 */
	
	private int trouveCompte(String pfNC) {
		
		// TODO : à écrire
		//On ne trouve que 1 ou 0 objet car il ne peut y avoir que 1 compte max par numero de compte
		for (int i = 0; i < alCptes.size(); i++)
		{
			if (alCptes.get(i).getNumCompte().equals(pfNC))
			{
				return i;
			}
		}
		return -1;
	}
}