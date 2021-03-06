package utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Utility class for dictionaries. This class offers static methods for
 * manipulating objects of type Map.
 * 
 * @author Jonathan Morgado-Samagaio
 */
public class MapUtils {

	/**
	 * Exchange the values attached to two given keys.
	 * 
	 * @param dict
	 *            the dictionary where the exchange is performed
	 * @param k1
	 *            one key
	 * @param k2
	 *            another key
	 * @throws IllegalArgumentException
	 *             if any of the two keys is not in the dictionary.
	 */
	public static <K, V> void exchange(Map<K, V> dict, K k1, K k2) {
		// TODO: exercise 1
		if (!dict.containsKey(k1) || !dict.containsKey(k2))
		{
			throw new IllegalArgumentException();
		}
		V temp = null;
		temp = dict.get(k1);
		dict.replace(k1, dict.get(k2));
		dict.replace(k2, temp);
	}

	/**
	 * Construct a dictionary from a list of strings representing the key-value
	 * pairs. Each string must be of the form "key:value" where key and value
	 * contains no ":".
	 * 
	 * @param pairs
	 *            a list of strings, each representing a pair
	 * @return the corresponding dictionary.
	 * @throws IllegalArgumentException
	 *             if any of the strings is not well-formed.
	 */
	public static Map<String, String> ofPairList(List<String> pairs) throws IllegalArgumentException {
		// TODO: exercise 2
		Map<String, String> m = new HashMap<String, String>();
		for (String s : pairs)
		{
			if (s.contains(":"))
			{
				if (s.indexOf(":") != s.lastIndexOf(":"))
				{
					throw new IllegalArgumentException();
				}
				String[] temp = s.split(":");
				if (temp.length < 2)
				{
					throw new IllegalArgumentException();
				}
				m.put(temp[0], temp[1]);
			}
			else
			{
				throw new IllegalArgumentException();
			}
		}
		return m;
	}

	/**
	 * Return the list of keys that map to a given value.
	 * 
	 * @param dict
	 *            the dictionary where to search
	 * @param value
	 *            the value to search
	 * @return the list of keys mapping to that value.
	 */
	public static <K, V> List<K> selectByValue(Map<K, V> dict, V value) {
		// TODO: exercise 3
		List<K> l = new ArrayList<K>();
		for (Map.Entry<K, V> e : dict.entrySet())
		{
			if (e.getValue().equals(value))
			{
				l.add(e.getKey());
			}
		}
		return l;
	}

	/**
	 * Remove the pairs where the key is equal to the value.
	 * 
	 * @param dict
	 *            the dictionary where to remove the pairs
	 */
	public static <T> void removeEquals(Map<T, T> dict) {
		// TODO: exercise 4
		Iterator<Map.Entry<T, T>> it = dict.entrySet().iterator();
		while (it.hasNext())
		{
			Map.Entry<T, T> e = it.next();
			if (e.getKey().equals(e.getValue()))
			{
				it.remove();
			}
		}
	}

}
