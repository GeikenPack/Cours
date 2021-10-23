package udp;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class EmetteurUDP 
{
	public static void main(String[] args) throws Exception
	{
		String prenom = "Jonathan";
		String nom = "Morgado-Samagaio";
		String message = prenom + "@" + nom;
		message = new String(message.getBytes(), "UTF-8");
		
		InetAddress[] ip = {InetAddress.getByName("8.8.8.8"), InetAddress.getByName("8.8.8.9"), InetAddress.getByName("8.8.8.10"), InetAddress.getByName("93.6.88.80")};
		int port = 2021;
		DatagramSocket socket = new DatagramSocket();
		envoyerTexte(socket, ip, port, message);
		socket.close();
	}
	
	/**
	 * Envoie le texte a l'adresse et au port de destination, via le socket fourni.
	 *
	 * @param socket le socket utilisé pour l'envoi (non null)
	 * @param dest   l'adresse IP du destinataire (non null)
	 * @param port   le port UDP du destinataire
	 * @param texte  le texte à envoyer (non null)
	 * @throws IOException lorsque le système ne parvient pas / ne veut pas envoyer
	 *                     le datagramme UDP
	 */
	public static void envoyerTexte(DatagramSocket socket, InetAddress[] dest, int port, String texte)
	                throws IOException 
	{
		for (int i = 0; i < dest.length; i++)
		{
			DatagramPacket dataPa = new DatagramPacket(texte.getBytes(), texte.getBytes().length, dest[i], port);
			socket.send(dataPa);
			System.out.println(texte + " a été envoyé sur " + dest[i] + ":" + port);
		}
	}
}
