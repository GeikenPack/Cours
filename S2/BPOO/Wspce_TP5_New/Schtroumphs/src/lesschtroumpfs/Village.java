package lesschtroumpfs;

import java.util.ArrayList;

public class Village {
	private String nom;
	private ArrayList<Schtroumpf> habitants;
	private int nbHab;
	private int nbSalse;
	
	public Village(String _nom, int _nbSalse, String[] tabNom)
	{
		this.nom = _nom;
		this.nbSalse = _nbSalse;
		habitants = new ArrayList<Schtroumpf>();
		nbHab = tabNom.length;
		for (int i = 0; i < nbHab; i++)
		{
			habitants.add(new Schtroumpf(tabNom[i], (int)(Math.random()*150), this));
		}
	}
	
	public String getnom()
	{
		return this.nom;
	}
	
	public int getNbSctroumpf()
	{
		return nbHab;
	}
	
	public int getStockSalsepareille()
	{
		return nbSalse;
	}
	
	public void augmenterReserve(int pfMontant)
	{
		nbSalse += pfMontant;
	}
	
	public void baisserReserve(int pfMontant)
	{
		nbSalse -= pfMontant;
	}
	
	public void solstice_d_ete()
	{
		int nbContent = 0;
		for (int i = 0; i < nbHab; i++)
		{
			habitants.get(i).sePresenter();
			habitants.get(i).chanter();
			if (habitants.get(i).estContent())
			{
				nbContent++;
			}
		}
		System.out.println("Dans le village " + nom + ", " + nbHab + " Schtroumpfs se sont présenter et " + nbContent + " de ces Schtroumpfs sont contents\n");
	}
	
	public Schtroumpf chefDuVillage()
	{
		Schtroumpf chef = habitants.get(0);
		for (int i = 1; i < nbHab; i++)
		{
			if (habitants.get(i).getAge() > chef.getAge())
			{
				chef = habitants.get(i);
			}
		}
		return chef;
	}
	
	public void envoyerAuTravail()
	{
		int nbHeureux = getNbSchtroumpfsHeureux();
		int nbTravail = 0;
		for (int i = 0; i < nbHab; i += 2)
		{
			if (nbTravail >= nbHeureux/2)
				break;
			habitants.get(i).allerTravailler();
			nbTravail++;
		}
	}
	
	public int getNbSchtroumpfsHeureux()
	{
		int somme = 0;
		for (int i = 0; i < nbHab; i++)
		{
			if (habitants.get(i).estContent())
			{
				somme++;
			}
		}
		return somme;
	}
	
	public void schtroumpfsHeureux() 
	{
		for (int i = 0; i < nbHab; i++)
		{
			if(habitants.get(i).estContent())
			{
				habitants.get(i).sePresenter();
				habitants.get(i).chanter();
			}
		}
	}
	
	public void dinerTousEnsemble() 
	{
		for (int i = 0; i < nbHab; i++)
		{
			habitants.get(i).dinerAuVillage();
		}
	}
	
	public void envoyerCueillirSalsepareille()
	{
		int nbHeureux = getNbSchtroumpfsHeureux();
		int nbTravail = 0;
		for (int i = 0; i < nbHab; i += 2)
		{
			if (nbTravail >= nbHeureux/2)
				break;
			habitants.get(i).recolterSalsepareille();
			nbTravail++;
		}
	}
}