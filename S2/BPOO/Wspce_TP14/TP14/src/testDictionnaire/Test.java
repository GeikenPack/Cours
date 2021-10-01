package testDictionnaire;

import dictionnaire.*;

public class Test {
	public static void main (String[] agv) {

		String [] t;
		Dictionnaire d = new Dictionnaire();

		System.out.println("Ajout de clef a : " + d.put ("a", "une valeur pour  a")); // null
		System.out.println("Ajout de clef c : " + d.put ("c", "une valeur pour c")); // null
		System.out.println("Ajout de clef b : " + d.put ("b", "une valeur pour b")); // null
		System.out.println(d);
		        // [(a, une valeur pour a) (c, une valeur pour c) (b, une valeur pour b) ]

		System.out.println("Ajout de clef a : " + d.put ("a", "valeur DEUX de a")); // une valeur pour a
		System.out.println(d);
		        // [(a, valeur DEUX de a) (c, une valeur pour c) (b, une valeur pour b) ]

		try {
		  System.out.println("Ajout de clef null : " + d.put (null, "v"));
		  System.out.println("PBP"); // Ne devrait JAMAIS arriver
		} catch (NullPointerException e) {System.out.println("Erreur normale");}

		try {
		  System.out.println("Ajout de valeur null : " + d.put ("c", null));
		  System.out.println("PBP"); // Ne devrait JAMAIS arriver
		} catch (NullPointerException e) {System.out.println("Erreur normale");}

		System.out.println("Test getValue");
		System.out.println(d);
		        // [(a, valeur DEUX de a) (c, une valeur pour c) (b, une valeur pour b) ]
		System.out.println("b : " + d.getValue("b")); // une valeur pour b
		System.out.println("a : " + d.getValue("a")); // valeur DEUX de a
		System.out.println("X : " + d.getValue("X")); // null
		System.out.println("null : " + d.getValue(null)); // null

		System.out.println("Test containsKey");
		System.out.println(d);
		System.out.println("b : " + d.containsKey("b")); // true
		System.out.println("null : " + d.containsKey(null)); // false
		System.out.println("X : " + d.containsKey("X")); // false

		System.out.println("Test containsValue");
		System.out.println(d);
		System.out.println("une valur pour b : " + d.containsValue("une valeur pour b")); // true
		System.out.println("null : " + d.containsValue(null)); // false
		System.out.println("bla : " + d.containsValue("bla")); // false

		System.out.println("Test size / keys / values");
		System.out.println(d);
		System.out.println("size : " + d.size()); // 3
		t = d.keys();
		for (String s : t) System.out.print(""+s+", "); // a, c, b,
		System.out.println();
		t = d.values();
		for (String s : t) System.out.print(""+s+", "); // valeur DEUX de a, une valeur pour c, une valeur pour b,
		System.out.println();

		System.out.println("Test remove");
		System.out.println(d);
		        // [(a, valeur DEUX de a) (c, une valeur pour c) (b, une valeur pour b) ]
		System.out.println("X : " + d.remove("X")); // null
		System.out.println("null : " + d.remove("null")); // null
		System.out.println("a : " + d.remove("a")); // valeur DEUX de a
		System.out.println("b : " + d.remove("b")); // une valeur pour b
		System.out.println(d); // [(c, une valeur pour c) ]
		System.out.println("a : " + d.remove("a")); // null
		System.out.println(d); // [(c, une valeur pour c) ]
	}
}
