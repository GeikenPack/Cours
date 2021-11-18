package hash.test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class PutTest {

	OpenHashTable<String, Integer> h;

	@Before
	public void setup() {
		h = new OpenHashTable<>();
	}

	@Test
	public void onePutGivesSizeOne() {
		h.put("a", 0);
		assertEquals("The size attribute after one put should be 1", 1, h.size());
	}
	
	@Test
	public void updatingKeepSameSize() {
		String s = "Once";
		h.put(s, 8);
		h.put(s, 9);
		assertEquals("The size attribute after two put with same key should be 1", 1, h.size());
	}

	@Test
	public void onePutGivesOneMapping() {
		h.put("a", 0);
		assertEquals("The number of mappings after one put should be 1", 1,
				h.mappingsCount());
	}
	
	@Test
	public void nullKeyAreRefused() {
		try {
			h.put(null, 1);
			fail("Putting a null key should have failed");
		} catch (NullPointerException e) {
		} catch (Throwable e) {
			fail("Putting a null key should fail with a NullPointerException but was "
					+ e);
		}
	}

	@Test
	public void addingNullValueIsRefused() {
		try {
			h.put("Hello", null);
			fail("Putting a null value should have failed");
		} catch (NullPointerException e) {
		} catch (Throwable e) {
			fail("Putting a null value should fail with a NullPointerException but was "
					+ e);
		}
	}

	@Test
	public void updatingToNullValueIsRefused() {
		h.put("Hello", 1);
		try {
			h.put("Hello", null);
			fail("Updating with a null value should have failed");
		} catch (NullPointerException e) {
		} catch (Throwable e) {
			fail("Updating with a null value should fail with a NullPointerException but was "
					+ e);
		}
	}

	@Test
	public void notTwoIdenticalKeys() {
		String s = "Once";
		h.put(s, 8);
		h.put(s, 9);
		assertEquals("Putting twice the same key should give a unique mapping",
				1, h.mappingsCount());
	}

	@Test
	public void notTwoEqualKeys() {
		String s1 = "Why";
		String s2 = new String(s1);
		assert(s1 != s2);
		assert(s1.equals(s2));
		h.put(s1, 8);
		h.put(s2, 9);
		assertEquals("Putting two equal keys should give a unique mapping", 1,
				h.mappingsCount());
	}
}
