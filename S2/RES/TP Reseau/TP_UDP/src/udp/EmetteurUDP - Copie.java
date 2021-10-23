package udp;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
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
		
		InetAddress[] ip = {InetAddress.getByName("8.8.8.8"), InetAddress.getByName("8.8.8.9"), InetAddress.getByName("8.8.8.10")};
		int port = 2021;
		DatagramSocket socket = new DatagramSocket();
		DatagramPacket dataPa = new DatagramPacket(message.getBytes(), message.getBytes().length, ip[0], port);
		socket.send(dataPa);
		System.out.println(message + " a été envoyé sur " + ip[0] + ":" + port);
		socket.close();
	}
}
