package setOfString;

import java.util.ArrayList;

public class SetOfString 
{
	private   ArrayList<String>  valeurs;
	
	public SetOfString () 
	{
	    this.valeurs = new ArrayList<String>  ();
	}
	
	public int size() 
	{
	    return this.valeurs.size();
	}
	
	public String[] toArray() 
	{
		String[] tmp = new String[valeurs.size()];
		for(int i = 0; i < valeurs.size(); i++)
		{
			tmp[i] = valeurs.get(i);
		}
		return tmp;
	}
	
	public boolean contains(String pfValue) 
	{
		   for (String val : valeurs)
		   {
			   if (val.equals(pfValue))
			   {
				   return true;
			   }
		   }
		   return false;
	}
	
	public void add(String pfValue) 
	{
		if(!this.contains(pfValue) && !(pfValue == null))
		{
			valeurs.add(pfValue);
		}
	}
	
	public void remove(String pfValue) 
	{
		valeurs.remove(pfValue);
	}
	
	public SetOfString union(SetOfString pfOss) 
	{
		SetOfString tmp;
		tmp = new SetOfString();
		for(String val : valeurs)
		{
			tmp.add(val);
		}
		for (String val : pfOss.valeurs)
		{
			
			tmp.add(val);
		}
		return tmp;
	}
	
	public SetOfString difference(SetOfString pfOss) 
	{
		SetOfString tmp;
		tmp = new SetOfString();
		for(String val : valeurs)
		{
			tmp.add(val);
		}
		for(String  val : pfOss.valeurs)
		{
			if (tmp.contains(val))
			{
				tmp.remove(val);
			}
		}
		return tmp;
	}
	
	public SetOfString intersect(SetOfString pfOss)
	{
		SetOfString tmp;
		tmp = new SetOfString();
		for(String val : pfOss.valeurs)
		{
			if(this.contains(val))
			{
				tmp.add(val);
			}
		}
		return tmp;
	}
}