package tps.banque;

import java.util.ArrayList;


import tps.banque.Compte;
import tps.banque.exception.ABCompteDejaExistantException;
import tps.banque.exception.ABCompteInexistantException;
import tps.banque.exception.ABCompteNullException;


/************************************************************
 * La classe AgenceBancaire permet de g�rer une agence bancaire comme un ensemble de Comptes.<BR>
 * Une AgenceBancaire a un nom, une localisation (ville) et g�re un ensemble de Comptes.<BR>
 * Exemple : agence "Agence Caisse Epargne" � "Pibrac".<BR>
 * Chaque Compte de l'AgenceBancaire a un num�ro unique (v�rification faite lors de l'ajout d'un Compte).<BR>
 * 
 * @author Andr� P�ninou.
 * @version 7.02
 *****************************/

public class AgenceBancaire {
	// Attributs
	private String nom;
	private String	loc;
	private ArrayList<Compte> alCptes;

	/**
	 * Constructeur param�tr�.<BR>
	 * Permet de cr�er une AgenceBancaire en donnant son nom et sa ville.<BR>
	 * L'AgenceBancaire est initialis�e avec 0 comptes.<BR>
	 * 
	 * @param pfNomAgence
	 *            Le nom de l'AgenceBancaire.
	 * @param pfLocAgence
	 *            La ville de localisation de l'AgenceBancaire.
	 */

	public AgenceBancaire(String pfNomAgence, String pfLocAgence) {

		// TODO : � �crire
		this.nom = pfNomAgence;
		this.loc = pfLocAgence;
		this.alCptes = new ArrayList<Compte>();
	}

	/**
	 * Permet de conna�tre le nom de l'AgenceBancaire.<BR>
	 * <BR>
	 * 
	 * @return Le nom de l'AgenceBancaire.
	 */

	public String getNomAgence() {

		// TODO : � �crire
		return this.nom;
	}

	/**
	 * Permet de conna�tre la localisation de l'AgenceBancaire.<BR>
	 * <BR>
	 * 
	 * @return La ville de localisation de l'AgenceBancaire.
	 */

	public String getLocAgence() {

		// TODO : � �crire
		return this.loc;
	}

	/**
	 * Permet de conna�tre le nombre de Comptes existant dans l'AgenceBancaire.<BR>
	 * <BR>
	 * 
	 * @return Le nombre de comptes de l'AgenceBancaire.
	 */

	public int getNbComptes() {
		
		// TODO : � �crire
		return alCptes.size(); // A enlever
	}

	/**
	 * Permet de retrouver un Compte de l'AgenceBancaire � partir de son num�ro de
	 * compte (unique).<BR>
	 * Renvoie null si le Compte de num�ro de compte donn� n'est pas
	 * trouv�.<BR>
	 * <BR>
	 * 
	 * @param pfNumCompte
	 *            Le num�ro du Compte recherch�.
	 * @see AgenceBancaire#addCompte(Compte)
	 * @return Le Compte de num�ro pNumCompte, null si le compte n'est pas
	 *         trouv�.
	 */

	public Compte getCompte(String pfNumCompte) {
		
		// TODO : � �crire
		if (trouveCompte(pfNumCompte) == -1)
		{
			return null;
		}
		return alCptes.get(trouveCompte(pfNumCompte)); // A enlever
	}

	/**
	 * Permet de retrouver les Comptes de l'AgenceBancaire correspondant � un nom de
	 * propri�taire donn�.<BR>
	 * Renvoie un tableau du nombre de Comptes ayant pour propri�taire
	 * le nom de priopri�taire donn� (et contenant les Comptes correspondants...).<BR>
	 * Si aucun Compte n'est trouv�, renvoie un tableau de longueur 0.<BR>
	 * <BR>
	 * 
	 * @param pfNomProprietaire
	 *            Le nom du propri�taire de Compte dont on veut les Comptes.
	 * @see AgenceBancaire#addCompte(Compte)
	 * @return Un tableau des Comptes ayant pour propri�taire pNomProprietaire,
	 *         un tableau de longueur 0 si aucun compte n'est trouv�.
	 */

	public Compte[] getComptesDe(String pfNomProprietaire) {
		/*
		 * M�thode : cr�er une ArrayList de Compte temporaire : alTemp. 
		 * Parcourir this.alCptes.
		 * 	Si un compe appartient au proprietaire 
		 * 		=> le garder dans alTemp.
		 * Si alTemp non vide : recopier tous les comptes de alTemp dans
		 * un nouveau tableau qui sera renvoy� 
		 * Sinon cr�er un tableau de 0 �l�ments.
		 */
		
		/* Premi�re m�thode
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

		// Si on a trouv� des comptes ...
		if (alTemp.size() != 0) {
			// ... on cr�e un tableau et on les recopie
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
		//Premi�re m�thode, coup de calcul :
		//Deux acc�s en lecture et �criture dans une ArrayList. On a donc un coup de 4n avec n etant le nombre de comptes.
		
		
		//Deuxi�me m�thode
		int iPrem, iDer, nbC;
		iPrem = -1;
		iDer = 0;
		nbC = 0;
		//Cherche le nombre de compte pour le propri�taire donn�e, l'indice du premier et du dernier compte de ce propri�taire.
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
		//Remplir le nouveau tableau de compte si des comptes on �t� trouver
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
		//Deuci�me m�thode, Coup de calcul :
		//On a un acc�s en lecture seulement au d�but de l'ArrayList ce qui nous fait 1n et ensuite un acc�s en lecture et �criture sur une partie r�duite de l'ArrayList ce qui nous fait moins de 2n. Nous avons donc un coup de moins de 3n ce qui est mieux que la premi�re version.
	}
	 

	/**
	 * Permet d'afficher une AgenceBancaire -<B> SPECIAL TP.</B><BR>
	 * <BR>
	 * Affiche le nom de l'AgenceBancaire, sa localisation, le nombre de Comptes,
	 * chaque Compte avec son solde.<BR>
	 * <BR>
	 * <B>ATTENTION : M�thode sp�ciale pour les TP.</B><BR>
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
	 * Permet d'obtenir la repr�sentation String d'une AgenceBancaire.<BR>
	 * <BR>
	 * Donne le nom de l'AgenceBancaire, la localisation, le nombre de Comptes.<BR>
	 * <BR>
	 */

	public String toString() {
		return "Nom Agence : " + this.nom + " (" + this.loc + ") : "+this.alCptes.size()+" cptes";
	}
	
	/**
	 * Permet d'ajouter un Compte � l'AgenceBancaire.<BR>
	 * Le Compte est ajout� � l'AgenceBancaire s'il n'existe pas d�j� un Compte
	 * ayant le m�me num�ro de compte  
	 * (identique en num�ro de compte, cf. m�thode getNumCompte() de la classe Compte).<BR>
	 * Si on appelle la m�thode avec null en param�tre, la m�thode l�ve une exception.<BR>
	 * 
	 * @param pfCompteAAjouter
	 *            Le Compte � ajouter � l'AgenceBancaire.
	 * @throws ABCompteNullException  lorsque pCompteAAjouter == null	
	 * @throws ABCompteDejaExistantException  lorsque un compte de num�ro pCompteAAjouter.getNumCompte() existe d�j� dans l'AgenceBancaire.
	 * @see AgenceBancaire#removeCompte(String)
	 */

	public void addCompte(Compte pfCompteAAjouter) throws ABCompteNullException, ABCompteDejaExistantException {
		
		// TODO : � �crire
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
	 * Permet de supprimer un Compte de l'AgenceBancaire, � partir de son num�ro.<BR>
	 * Le Compte (unique) du num�ro donn� est retir� de l'AgenceBancaire s'il est
	 * trouv�.<BR>
	 * Une exception est lev�e si le compte n'est pas trouv�.<BR>
	 * 
	 * @param pfNumCompte
	 *            Le num�ro du Compte � supprimer de l'AgenceBancaire.
	 * @throws ABCompteInexistantException	Lorsque aucun compte de num�ro pNumCompte ne peut �tre trouv�.
	 * @see AgenceBancaire#addCompte(Compte)
	 */
	
	public void removeCompte(String pfNumCompte) throws ABCompteInexistantException{
		
		// TODO : � �crire
		if (trouveCompte(pfNumCompte) == -1)
		{
			throw new ABCompteInexistantException();
		}
		alCptes.remove(trouveCompte(pfNumCompte));
	}


	/**
	 * M�thode priv�e de recherche du rang du Compte ayant un num�ro recherch�.
	 * Cherche le rang (indice) contenant un compte ayant pour num�ro le num�ro en param�tre.
	 * Renvoie -1 si aucun compte n'est trouv�.
	 *
	 * @param      pfNC  num�ro du compte recherch�
	 * @return     le rang du Compte trouv� ayant pour num�ro pNC ou -1 si non trouv�. 
	 */
	
	private int trouveCompte(String pfNC) {
		
		// TODO : � �crire
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