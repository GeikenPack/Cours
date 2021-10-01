package main;

import java.util.ArrayList;
import java.util.Iterator;

public class TP4Exo 
{
	public static void main(String[] argv) 
	{
		//2.1
		ArrayList<String> alChaines;
		
		//2.2
		alChaines = new ArrayList<String>();
		
		//2.3
		alChaines.add("Chaine 1");
		alChaines.add("Chaine 2");
		alChaines.add("Chaine 3");
		
		//2.4
		System.out.println("Taille de alChaines : " + alChaines.size());
		
		//2.5
		for (int i = 0; i < alChaines.size(); i++)
		{
			System.out.println("Element de rang " + i + " : " + alChaines.get(i));
		}
		
		//2.6
		alChaines.add("Chaine 4");
		System.out.println(alChaines.size());
		alChaines.add(0, "Chaine 5");
		System.out.println(alChaines.size());
		alChaines.add(alChaines.size()/2, "Chaine 6");
		System.out.println(alChaines.size());
		
		//2.7
		for (int i = 0; i < alChaines.size(); i++)
		{
			System.out.println("Element de rang " + i + " : " + alChaines.get(i));
		}
		System.out.println(alChaines.size());
		
		//2.8
		for (int i = 0; i < 20; i++)
		{
			alChaines.add("Chaine " + (6+i)); 
		}
		
		//2.9
		for (int i = 0; i < alChaines.size(); i++)
		{
			System.out.println("Element de rang " + i + " : " + alChaines.get(i));
		}
		System.out.println(alChaines.size());
		
		//2.10
		try
		{
			alChaines.set(0, "Chaines 1.1");
			alChaines.set(2, "Chaine 3.1");
			alChaines.set(3, "Chaines 4.1");
			alChaines.set(alChaines.size()-1, "Chaines f");
		}
		catch (Exception e) {e.printStackTrace();};
		
		//2.11
		for (int i = 0; i < alChaines.size(); i++)
		{
			System.out.println("Element de rang " + i + " : " + alChaines.get(i));
		}
		System.out.println(alChaines.size());
		
		//2.12
		System.out.println(alChaines.toString());
		
		//2.13
		try
		{
			alChaines.remove(0);
			System.out.println(alChaines.size());
			alChaines.remove(alChaines.size()-1);
			System.out.println(alChaines.size());
			alChaines.remove(5);
			System.out.println(alChaines.size());
		}
		catch (Exception e) {e.printStackTrace();};
		
		//2.14
		//alChaines.clear();
		
		//2.15
		for (int i = 0; i < alChaines.size(); i++)
		{
			System.out.println("Element de rang " + i + " : " + alChaines.get(i));
		}
		System.out.println(alChaines.size());
		
		//2.15
		//La methode trimToSize permet de reduire la taille max de la liste au nombre d�l�ment actuel.
		ArrayList<String> arr = new ArrayList<String>(20);
		arr.add("Chaine1");
		arr.trimToSize();
		//La taille de cette liste en m�moire est donc maintenant de 1.
		
		//5.1
		//Cette syntaxe va afficher tous les �l�ments de alChaines
		for ( String s : alChaines ) 
		{
	        System.out.println ( s.toUpperCase() + " lg : " + s.length() );
		}
		//Ici, alChaines ext vide a la suite du .clear de la 2.14 mais si on l'enleve, nous obtenons bien la liste de tous les elements de alChaines.
		
		//5.2
		//On essaye de faire une ArrayList de Doubles
		ArrayList<Double> alDouble;
		alDouble = new ArrayList<Double>();
		alDouble.add(20.0);
		alDouble.add(50.0);
		///On est obliger d'ajouter le .0 a la fin du nombre
		
		
		//5.3
		Iterator<String> it = alChaines.iterator();
		while(it.hasNext())
		{
			System.out.println(it.next());
		}
	}
}