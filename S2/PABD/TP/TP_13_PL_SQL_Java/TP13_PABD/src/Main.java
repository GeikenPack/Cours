import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

import oracle.jdbc.OracleDriver;

public class Main 
{
	private static Connection cnx = null;
	
	public static void main(String[] args) throws Exception
	{
		exo2();
	}
	
	public static void exo1() throws Exception
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			System.out.println("Saisir un nom de montagne :");
			String v_nom = sc.nextLine();
			System.out.println("Saisir l'altitude de la montagne :");
			int v_alt = sc.nextInt();
			System.out.println("Saisir un nom de chaine de montagne :");
			String v_chn = sc.nextLine();
			sc.close();
			
			DriverManager.deregisterDriver(new OracleDriver());
			String url = "jdbc:oracle:thin:@oracle.iut-blagnac.fr:1521:db11g";
			String user = "oracle1073";
			String passwd = "SCP173-96EN";
			cnx = DriverManager.getConnection(url, user, passwd);
			System.out.println("Connexion.");
			
			CallableStatement cs = cnx.prepareCall("{call ajouterMontagne(?,?,?)}");
			cs.setString(1, v_nom);
			cs.setInt(2,  v_alt);
			cs.setString(3,  v_chn);
			cs.execute();
			System.out.println("Procédure exécutée.");
			cs.close();
		}
		catch (SQLException se)
		{
			switch(se.getErrorCode())
			{
			case 20010:
				System.err.println("ERREUR DU SGBD " + se.getErrorCode());
				System.err.println(se.getMessage());
				break;
			default:
				System.err.println("Erreur imprévue.");
				throw se;
			}
		}
		finally
		{
			if (cnx != null)
				cnx.close();
			System.out.println("Déconnexion.");
		}
	}
	
	public static void exo2() throws Exception
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			System.out.println("Saisir le nom dy Pays :");
			String vNom = sc.nextLine();
			System.out.println("Saisir la capitale du pays :");
			String vCap = sc.nextLine();
			System.out.println("Saisir la superficie du pays :");
			int vSup =  sc.nextInt();
			sc.nextLine();
			System.out.println("Saisir la population du pays :");
			int vPop = sc.nextInt();
			sc.nextLine();
			System.out.println("Saisir le code iso3 du pays :");
			String vIso3 = sc.nextLine();
			System.out.println("Saisir le code iso2 du pays :");
			String vIso2 = sc.nextLine();
			System.out.println("Saisirle nom du continent :");
			String vNomC = sc.nextLine();
			sc.close();
			
			DriverManager.deregisterDriver(new OracleDriver());
			String url = "jdbc:oracle:thin:@oracle.iut-blagnac.fr:1521:db11g";
			String user = "oracle1073";
			String passwd = "SCP173-96EN";
			cnx = DriverManager.getConnection(url, user, passwd);
			System.out.println("Connexion.");
			
			CallableStatement cs = cnx.prepareCall("{call ajoutePays(?,?,?,?,?,?,?)}");
			cs.setString(1, vNom);
			cs.setString(2, vCap);
			cs.setInt(3, vSup);
			cs.setInt(4, vPop);
			cs.setString(5, vIso3);
			cs.setString(6, vIso2);
			cs.setString(7, vNomC);
			cs.execute();
			System.out.println("Procédure exécutée.");
			cs.close();
		}
		catch (SQLException se)
		{
			switch(se.getErrorCode())
			{
			case 20010:
				System.err.println("ERREUR DU SGBD " + se.getErrorCode());
				System.err.println(se.getMessage());
				break;
			default:
				System.err.println("Erreur imprévue.");
				throw se;
			}
		}
		finally
		{
			if (cnx != null)
				cnx.close();
			System.out.println("Déconnexion.");
		}
	}
}
