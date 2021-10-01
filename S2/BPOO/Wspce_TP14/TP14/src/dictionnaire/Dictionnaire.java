package dictionnaire;

import java.util.ArrayList;

public class Dictionnaire 
{
	private ArrayList<String> alKeys, alValues;
	
	public Dictionnaire()
	{
		this.alKeys = new ArrayList<String>();
		this.alValues = new ArrayList<String>();
	}
	
	public String getValue(String key)
	{
		if (this.alKeys.indexOf(key) == -1 || key == null)
			return null;
		return this.alValues.get(this.alKeys.indexOf(key));
	}
	
	public String remove(String key)
	{
		if (key == null)
			return null;
		int i = this.alKeys.indexOf(key);
		if (i == -1)
			return null;
		String val;
		val = this.alValues.get(i);
		this.alValues.remove(i);
		this.alKeys.remove(i);
		return val;
	}
	
	public String put(String key, String value) throws NullPointerException
	{
		if (key == null || value == null)
			throw new NullPointerException();
		int i = this.alKeys.indexOf(key);
		if (i != -1)
		{
			String val = this.alValues.get(i);
			this.alValues.set(i, value);
			return val;
		}
		this.alKeys.add(key);
		this.alValues.add(value);
		return null;
	}
	
	public int size()
	{
		return this.alKeys.size();
	}
	
	public boolean containsKey(String key)
	{
		return (this.alKeys.indexOf(key) != -1);
	}
	
	public boolean containsValue(String value)
	{
		return (this.alValues.indexOf(value) != -1);
	}
	
	public String toString()
	{
		String res = "{";
		for(int i = 0; i < this.alKeys.size(); i++)
		{
			res += "(" + this.alKeys.get(i) + ", " + this.alValues.get(i) +") ";
		}
		res += "}";
		return res;
	}
	
	public String[] values()
	{
		return this.alValues.toArray(new String[0]);
	}
	
	public String[] keys()
	{
		return this.alKeys.toArray(new String[0]);
	}
}