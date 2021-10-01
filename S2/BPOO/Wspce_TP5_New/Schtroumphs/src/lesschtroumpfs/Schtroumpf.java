package lesschtroumpfs;

public class Schtroumpf 
{
	private String nom;
	private int age;
	private boolean estContent;
	private Village vil;
	
	public Schtroumpf(String _nom, int _age)
	{
		this.nom = _nom;
		this.age = _age;
		this.estContent = true;
		this.vil = null;
	}
	
	public Schtroumpf(String _nom, int _age, Village _vil)
	{
		this.nom = _nom;
		this.age = _age;
		this.estContent = true;
		this.vil = _vil;
	}
	
	public String getNom()
	{
		return this.nom;
	}
	
	public int getAge()
	{
		return this.age;
	}
	
	public boolean estContent()
	{
		return estContent;
	}
	
	public Village getVillage() 
	{
		return vil;
	}
	
	public void setVillage(Village pfV)
	{
		vil = pfV;
	}
	
	public String toString()
	{
		String chaine = "";
		if (estContent())
		{
			chaine += ("Je suis " + nom + ", j'ai " + age + " ans, je suis content et");
		}
		else
		{
			chaine += ("Je suis " + nom + ", j'ai " + age + " ans, je suis PAS content et");
		}
		
		if (vil != null)
		{
			chaine += (" j'appartient au village " + vil.getnom());
		}
		else
		{
			chaine += (" je suis un hermite");
		}
		return chaine;
	}
	
	public void sePresenter()
	{
		System.out.println(toString());
	}
	
	public String leChant()
	{
		if (estContent)
		{
			return "la, la, la Schtroumpf la, la";
		}
		else
		{
			return "Gloups";
		}
	}
	
	public void chanter()
	{
		System.out.println(leChant());
	}
	
	public void anniversaire()
	{
		age++;
	}
	
	public void manger(int pfQte)
	{
		if (pfQte > 0)
		{
			estContent = true;
		}
	}
	
	public void allerTravailler() 
	{
		estContent = false;
	}
	
	public void recolterSalsepareille()
	{
		if(vil != null)
		{
			vil.augmenterReserve(5);
			allerTravailler();
		}
		else
		{
			manger(5);
		}
	}
	
	public void dinerAuVillage()
	{
		if (vil != null)
		{
			if (vil.getStockSalsepareille() >= 3)
			{
				vil.baisserReserve(3);
				manger(3);
			}
		}
		else
		{
			estContent = false;
		}
	}
}
