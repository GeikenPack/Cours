package tp1;

import java.util.List;

/**
 * A class offering static methods for processing list of strings according to
 * the length of the strings.
 */
public class StrLen {

	/**
	 * Select in a list of the strings the ones having a length greater or equal
	 * to a minimal length.
	 * 
	 * The order of the elements in the selection respect the initial order.
	 * 
	 * @param strList
	 *            the list of strings
	 * @param minLen
	 *            the minimal length
	 * @return A new list of strings, containing the strings long enough.
	 */
	public static List<String> selectLong(List<String> strList, int minLen) {
		// TODO: exercise 1
		return null;
	}

	/**
	 * Remove from a list of strings the strings strictly longer than a maximal
	 * length.
	 * 
	 * @param strList
	 *            the list of strings
	 * @param maxLen
	 *            the maximal length
	 */
	public static void removeLong(List<String> strList, int maxLen) {
		// TODO: exercise 2
	}

	/**
	 * Truncate the strings in a list of strings to a maximal length. The string
	 * shorter than this length are not modified.
	 * 
	 * @param strList
	 *            the list of strings
	 * @param maxLen
	 *            the maximal length
	 */
	public static void truncate(List<String> strList, int maxLen) {
		// TODO: exercise 3
	}

	/**
	 * Returns a copy of a list of strings, sorted by increasing length. The
	 * sort algorithm is stable.
	 * 
	 * @param strList
	 *            the list of strings
	 * @return A copy sorted by increasing length.
	 */
	public static List<String> increasingLength(List<String> strList) {
		// TODO: exercise 4
		return null;
	}

	/**
	 * Determines the most frequent string length in a list of strings. If
	 * several string length are tie, the highest one is returned.
	 * 
	 * @param strList
	 *            the list of strings
	 * @return The most frequent string length.
	 */
	public static int mostFrequent(List<String> strList) {
		// TODO: exercise 5
		return 0;
	}

}
