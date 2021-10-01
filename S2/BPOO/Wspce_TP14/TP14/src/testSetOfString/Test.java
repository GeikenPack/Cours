package testSetOfString;

import setOfString.*;

public class Test 
{
	public static void main(String[] args) 
	{
		String[] res;

		SetOfString sos, sos2, sos3;

		sos = new SetOfString();
		  res = sos.toArray();   for (String s : res) {System.out.print("  " + s);}
		  //  (Rien)
		  
		  System.out.println("\n================================");

		sos.add("S3");
		  res = sos.toArray();   for (String s : res) {System.out.print("  " + s);}
		  //  "S3"

		  System.out.println("\n================================");
		  
		sos.add("S1");
		sos.add("S2");
		  res = sos.toArray();   for (String s : res) {System.out.print("  " + s);}
		  //  "S3"  "S1"  "S2"

		  System.out.println("\n================================");
		  
		sos.add("S1");
		sos.add("S2");
		sos.add("S4");
		sos.add(null);
		  res = sos.toArray();   for (String s : res) {System.out.print("  " + s);}
		  //  "S3"  "S1"  "S2"  "S4"
		  
		  System.out.println("\n================================");
		  
		  System.out.println( sos.contains("S2") ); // true
		  System.out.println( sos.contains("S4") ); // true
		  System.out.println( sos.contains("toto") ); // false
		  System.out.println( sos.contains("s1") ); // false
		  System.out.println( sos.contains(null) ); // false
		  
		  System.out.println("\n================================");
		  
		  sos.remove(null);
		  sos.remove("s2");
		  sos.remove("toto");
		    res = sos.toArray();   for (String s : res) {System.out.print("  " + s);}
		    //  "S3"  "S1"  "S2"  "S4"

		    System.out.println("\n================================");
		    
		  sos.remove("S2");
		    res = sos.toArray();   for (String s : res) {System.out.print("  " + s);}
		    //  "S3"  "S1"  "S4"

		    System.out.println("\n================================");
		    
		  sos.remove("S1");
		  sos.remove("S4");
		  sos.remove("S3");
		    res = sos.toArray();   for (String s : res) {System.out.print("  " + s);}
		    //  (Rien)
		    
		    System.out.println("\n================================ ensembles");
		    
		    sos2 = new SetOfString();
		    sos2.add("S1"); sos2.add("S2"); sos2.add("S3");

		    sos3 = new SetOfString();
		    sos3.add("S1"); sos3.add("S3"); sos3.add("S4");

		    sos = sos2.union(sos3);
		      res = sos.toArray();   for (String s : res) {System.out.print("  " + s);}
		      //  "S1"  "S2"  "S3"  "S4"

		      System.out.println("\n================================");
		      
		    sos = sos2.intersect(sos3);
		      res = sos.toArray();   for (String s : res) {System.out.print("  " + s);}
		      //  "S1"  "S3"

		      System.out.println("\n================================");
		      
		    sos = sos2.difference(sos3);
		      res = sos.toArray();   for (String s : res) {System.out.print("  " + s);}
		      //  "S2"
	}
}
