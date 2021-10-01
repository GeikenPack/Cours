package figure;

import java.lang.Math;

public class Cylindre extends Cercle
{
	private int hauteur;
	
	public Cylindre()
	{
		super();
		this.hauteur = 0;
	}
	
	public Cylindre(int pfX, int pfY, int pfRayon, int pfHauteur)
	{
		super(pfX, pfY, pfRayon);
		this.hauteur = pfHauteur;
	}
	
	public int getHauteur()
	{
		return this.hauteur;
	}
	
	public void setHauteur(int pfHauteur)
	{
		this.hauteur = pfHauteur;
	}
	/*
	public double surface()
	{
		return 2 * Math.PI * this.getRayon() * this.hauteur + 2 * Math.PI * (this.getRayon() * this.getRayon());
	}
	
	public double volume()
	{
		return Math.PI * (this.getRayon() * this.getRayon()) * this.getHauteur();
	}
	*/
	
	public double surface()
	{
		return 2 * Math.PI * this.getRayon() * this.getHauteur() + 2 * super.surface();
	}
	
	public double volume()
	{
		return super.surface() * this.getHauteur();
	}
	
	public void afficher()
	{
		super.afficher();
		System.out.println("Cylindre : Hauteur : " + this.hauteur);
	}
}
