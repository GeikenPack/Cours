package hash.test;

import static org.junit.Assert.assertTrue;

import java.util.List;

import hash.JMHashTable;
import hash.Mapping;

/**
 * A class exposing the protected fields of the hash table under test.
 */
public class OpenHashTable<K, V> extends JMHashTable<K, V> {
	
	public String classUnderTest() {
		return getClass().getSuperclass().getSimpleName();
	}

	public int size() {
		return size;
	}
	
	public List<Mapping<K, V>>[] table() {
		return table;
	}
	
	public void check() {
		int n = 0;
		for (int i = 0; i < table.length; i++) {
			for (Mapping<K, V> m : table[i]) {
				int exp_i = m.getKey().hashCode() % table.length;
				assertTrue("The entry " + m + " should be at index " + exp_i
						+ " but was found at index " + i, exp_i == i);
				n++;
			}
		}
		assertTrue("The hash table has size " + size + " but contained " + n
				+ " entries", size == n);
	}

	public int mappingsCount() {
		int n = 0;
		for (List<Mapping<K, V>> l : table) {
			n += l.size();
		}
		return n;
	}
}
