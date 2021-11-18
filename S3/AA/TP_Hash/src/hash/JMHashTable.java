package hash;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Generic hash table implementation, mapping keys to values.
 * 
 * @param <K>
 *            the type of the keys
 * @param <V>
 *            the type of the values
 */
public class JMHashTable<K, V> implements Map<K, V>{

	/**
	 * Variable de type Liste contenant des Mapping d'ensemble clé/valeur
	 */
	protected List<Mapping<K, V>>[] table;

	/**
	 * Variable de type entier contenant le nombre d'élément dans la table
	 */
	protected int size;
	
	/**
	 * Construct an empty hashtable with an initial capacity of 4.
	 */
	public JMHashTable()
	{
		table = new List[4];
		for(int i = 0; i < table.length; i++)
		{
			table[i] = new LinkedList<Mapping<K, V>>();
		}
		
		size = 0;
	}

	/**
	 * Associates the specified value with the specified key in this map. If the
	 * map previously contained a mapping for the key, the old value is
	 * replaced.
	 * 
	 * @param key
	 *            key with which the specified value is to be associated
	 * @param value
	 *            value to be associated with the specified key
	 * @return the previous value associated with <tt>key</tt>, or <tt>null</tt>
	 *         if there was no mapping for <tt>key</tt>.
	 * @throws NullPointerException
	 *             if the key or the value is <tt>null</tt>
	 */
	public V put(Object key, Object value) throws NullPointerException
	{
		if (key == null || value == null)
		{
			throw new NullPointerException();
		}
		V val = get(key);
		if (val != null)
		{
			for (Mapping<K, V> elm : table[key.hashCode()%table.length])
			{
				if (elm.getKey().hashCode() == key.hashCode())
				{
					elm.setValue((V) value);
				}
			}
		}
		else
		{
			table[key.hashCode()%table.length].add(new Mapping<K, V>((K) key, (V) value));
			size++;
			if (size*1.0/table.length > 0.8)
			{
				doubleCapacity();
			}
		}
		return val;
	}

	/**
	 * Returns the value to which the specified key is mapped, or <tt>null</tt>
	 * if this map contains no mapping for the key.
	 * 
	 * @param key
	 *            the key whose associated value is to be returned
	 * @return the value to which the specified key is mapped, or <tt>null</tt>
	 *         if this map contains no mapping for the key
	 * @throws NullPointerException
	 *             if the key is <tt>null</tt>
	 */
	public V get(Object key) 
	{
		for (Mapping<K, V> elm : table[key.hashCode()%table.length])
		{
			if (elm.getKey().hashCode() == key.hashCode())
			{
				return elm.getValue();
			}
		}
		return null; // TODO
	}
	
	private void doubleCapacity()
	{
		List<Mapping<K, V>>[] tmp = new List[table.length*2];
		for (int i = 0; i < tmp.length; i++)
		{
			tmp[i] = new LinkedList<Mapping<K, V>>();
		}
		Iterator<Mapping<K, V>> it = iterator();
		while (it.hasNext()) {
		        Mapping<K, V> m = it.next();
		        tmp[m.getKey().hashCode()%tmp.length].add(m);
		}
		this.table = tmp;
	}
	
	/**
	 * Iterates over the table entries.
	 *
	 * @return An iterator over the table entries
	 */
	public Iterator<Mapping<K, V>> iterator() {
	        return new HashIterator();
	}
	
	@Override
	public String toString() 
	{
		String res = "{";
		Iterator<Mapping<K, V>> it = this.iterator();
		while (it.hasNext()) {
		        res += it.next();
		        if (it.hasNext()) {
		                res += ", ";
		        }
		}
		res += "}";
		return res;
	}
	
	private class HashIterator implements Iterator<Mapping<K, V>>
	{

		int indiceTab, indiceListe;
		Mapping<K, V> actuel;
		Mapping<K, V> next;
		
		
		public HashIterator()
		{
			indiceTab = 0;
			indiceListe = 0;
			int tmp = -1;
			actuel = null;
			next = null;
			while (next == null && indiceTab < table.length)
			{
				for (int i = indiceTab; i < table.length; i++)
				{
					indiceTab = i;
					for (int j = indiceListe; j < table[i].size() && next == null; j++)
					{
						next = table[i].get(j);
						tmp = i;
						indiceListe = j;
						break;
					}
					indiceListe = 0;
				}
			}
			if (tmp > -1) 
			{
				indiceTab = tmp;
			}
		}
		
		@Override
		public boolean hasNext() {
			return next != null;
		}

		@Override
		public Mapping<K, V> next() 
		{
			Mapping<K, V> tmp = next;
			for (int i = indiceTab; i < table.length; i++)
			{
				indiceTab = i;
				
				if (table[i].size() > 0)
				{
					for (int j = indiceListe; j < table[i].size(); j++)
					{
						if(next != table[i].get(j))
						{
							actuel = tmp;
							next = table[i].get(j);
							indiceListe = j;
							return tmp;
						}
					}
				}
				indiceListe = 0;
			}
			next = null;
			return tmp;
		}
		
	}

	@Override
	public int size() {
		return size;
	}

	@Override
	public boolean isEmpty() {
		return size == 0;
	}

	@Override
	public boolean containsKey(Object key) {
		for (List<Mapping<K, V>> li : table)
		{
			for (Mapping<K, V> elm : li)
			{
				if (elm.getKey().equals(key))
				{
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public boolean containsValue(Object value) {
		for (List<Mapping<K, V>> li : table)
		{
			for (Mapping<K, V> elm : li)
			{
				if (elm.getValue().equals(value))
				{
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public V remove(Object key) {
		V val = null;
		for (int i = 0; i < table.length; i++)
		{
			for (int j = 0; j < table[i].size(); j++)
			{
				if (table[i].get(j).getKey().equals(key))
				{
					val = table[i].get(j).getValue();
					table[i].remove(j);
					size--;
					return val;
				}
			}
		}
		return null;
	}

	@Override
	public void putAll(Map<? extends K, ? extends V> m) {
		for (Map.Entry<? extends K, ? extends V> key : m.entrySet())
		{
			put(key.getKey(), key.getValue());
		}
		
	}

	@Override
	public void clear() {
		table = new List[4];
		for(int i = 0; i < table.length; i++)
		{
			table[i] = new LinkedList<Mapping<K, V>>();
		}
		
		size = 0;
	}

	@Override
	public Set<K> keySet() {
		Set<K> ens = new HashSet<K>();
		for (List<Mapping<K, V>> li : table)
		{
			for (Mapping<K, V> elm : li)
			{
				ens.add(elm.getKey());
			}
		}
		return ens;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {return true;}
		if (!(obj instanceof Map)) {return false;}
		Map<K, V> m = (Map<K, V>) obj;
        if (m.size() != this.size) {
            return false;
        }
		for (int i = 0; i < table.length; i++)
		{
			for (int j = 0; j < table[i].size(); j++)
			{
				if (!m.containsKey(table[i].get(j).getKey()) || !m.get(table[i].get(j).getKey()).equals(table[i].get(j).getValue()))
				{
					return false;
				}
			}
		}
		return true;
	}

	@Override
	public int hashCode() {
        int hash = 0;
        for(int i = 0; i < table.length; i++)
        {
        	for (int j = 0; j < table[i].size(); j++)
        	{
        		hash += table[i].get(j).hashCode();
        	}
        }
        return hash;
    }

	@Override
	public Collection<V> values() {
		List<V> ens = new ArrayList<V>();
		for (List<Mapping<K, V>> li : table)
		{
			for (Mapping<K, V> elm : li)
			{
				ens.add(elm.getValue());
			}
		}
		return ens;
	}

	@Override
	public Set<Entry<K, V>> entrySet() {
		Set<Entry<K, V>> ens = new HashSet<Entry<K, V>>();
		for (List<Mapping<K, V>> li : table)
		{
			for (Mapping<K, V> elm : li)
			{
				ens.add(elm);
			}
		}
		return ens;
	}
}
