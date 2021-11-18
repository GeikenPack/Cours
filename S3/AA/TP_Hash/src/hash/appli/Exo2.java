package hash.appli;

import hash.JMHashTable;

public class Exo2 {

	public static void main(String[] args) 
	{
		JMHashTable<String, String> ht = new JMHashTable<>();
		
		ht.put("two", "deux");
		ht.put("four", "quatre");
		ht.put("six", "6");
//		System.out.println(ht.get("two"));
//		System.out.println(ht.get("deux"));
		System.out.println(ht);

	}

}
