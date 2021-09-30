package tp1;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.ListIterator;

//Morgado-Samagaio Jonathan Tandol Noémie

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
		List<String> temp = new ArrayList<String>();
		for(String s : strList) {
			if(s.length()>=minLen) {
				temp.add(s);
			}
		}
		
		return temp;
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
		ListIterator<String> it = strList.listIterator();
		while(it.hasNext()) {
			String s = it.next();
			if(s.length()>maxLen) {
				it.remove();
			}
		}
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
		
		//for(int i = 0; i < strList.size(); i++) {
		//	if(strList.get(i).length() > maxLen) {
		//		strList.set(i, strList.get(i).substring(0, maxLen));
		//	}
		//}
		
		ListIterator<String> it = strList.listIterator();
		while(it.hasNext()) {
			String s = it.next();
			if(s.length()>maxLen) {
				it.set(s.substring(0, maxLen));
			}
			
		}
		
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
		List<String> temp = new ArrayList<String>(strList);
		Comparator c = new Comparator<String>() {
			public int compare(String s1, String s2) {
				return Integer.compare(s1.length(), s2.length());
			}
		};
		temp.sort(c);
		
		
		return temp;
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
		List<String> temp = new ArrayList<String>(strList);
		temp = increasingLength(temp);
		
		int taille = 0;
		int tailleMax = strList.get(0).length();
		int compteur = 0;
		int compteurMax = 0;
		
		ListIterator<String> it = temp.listIterator();
		while (it.hasNext()) {
			String s = it.next();
			taille = s.length();
			
			if(it.hasNext()) {
				s = it.next();
				if(s.length()==taille) {
					compteur++;
				}
				else {
					if(compteur >= compteurMax) {
						compteurMax = compteur;
							tailleMax = taille;
						
					}
					compteur = 0;
				}
				
				s = it.previous();
			}
		}
		
		if(compteur >= compteurMax) {
			compteurMax = compteur;
				tailleMax = taille;
		}
		
		return tailleMax;
	}

}
