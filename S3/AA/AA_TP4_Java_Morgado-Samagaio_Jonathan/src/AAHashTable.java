package hash;

import java.util.List;

/**
 * Generic hash table implementation, mapping keys to values.
 * 
 * @param <K>
 *            the type of the keys
 * @param <V>
 *            the type of the values
 */
public class AAHashTable<K, V> {

	protected List<Mapping<K, V>>[] table;

	protected int size;

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
	public V put(K key, V value) {
		return null; // TODO
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
	public V get(Object key) {
		return null; // TODO
	}
}
