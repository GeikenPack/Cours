package tps.banque;

import java.util.ArrayList;

import tps.banque.exception.CompteException;

public class CompteDepot extends Compte
{
	private ArrayList<Operation> operations;
	
	public CompteDepot()
	{
		super();
		this.operations= new ArrayList<Operation>();
	}
	
	public CompteDepot(String pfNumCompte, String pfNomProp)
	{
		super(pfNumCompte, pfNomProp);
		this.operations= new ArrayList<Operation>();
	}
	
	public void retirer(double pfMontant) throws CompteException {
		super.retirer(pfMontant);
		new SensOperation();
		operations.add(new Operation(SensOperation.DEBIT, pfMontant));
	}
	
	public void deposer(double pSomme) throws CompteException {
		super.deposer(pSomme);
		new SensOperation();
		operations.add(new Operation(SensOperation.CREDIT, pSomme));
	}
	
	public Operation[] getOperations()
	{
		Operation[] tmp = new Operation[this.operations.size()];
		for(int i = 0; i < tmp.length; i++)
			tmp[i] = operations.get(i);
		return tmp;
		
		/*
		 * 6.1
		 * Si l'on renvoit l'Arraylist de la classe, elle pourra etre modifier depuis l'exterieur. En effet, vu que l'on donne sa r�f�rence, toute modifications ext�rieur s'appliquera aussi a celle de la classe.
		 * Creer un tableau temporaire nous permet de copier toutes les valeurs de l'ArrayList et de donner ensuite la r�f�rence de ce tableau. Ce tableau pourra etre modifier depuis l'exterieur aussi mais vu qu'il est red�finis a chaque appel de getOperations, cela ne gene pas le fonctionnement.
		 * 
		 * 6.2
		 * Les attributs des op�rations ne sont pas modifiables. Ils sont en private et il n'y a aucun setteur.
		 */
		
	}
	
	public void afficher()
	{
		super.afficher();
		for(Operation op : operations)
		{
			System.out.println("Une " + op.getSens() + " de " + op.getMontant());
		}
	}
}
