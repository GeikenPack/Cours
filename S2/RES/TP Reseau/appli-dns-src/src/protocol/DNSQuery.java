package protocol;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.nio.charset.StandardCharsets;

/**
 * Represents a DNS query for a given name.
 */
public class DNSQuery 
{

	/**
	 * The name, split at the dot.
	 * 
	 * Example: "webetud.iut-blagnac.fr" -> { "webetud", "iut-blagnac", "fr" }
	 */
	protected String[] nameFragments;

	public DNSQuery(String name) 
	{
		if (name == null || name.length() == 0)
			throw new IllegalArgumentException(name);
		this.nameFragments = name.split("\\.");
	}

	/**
	 * The name to be queried.
	 * 
	 * @return
	 */
	public String getName() 
	{
		return String.join(".", this.nameFragments);
	}

	@Override
	public String toString() 
	{
		return "DNS Request for " + this.getName();
	}

	/**
	 * Constructs an array of bytes corresponding to a request of type A for the
	 * name.
	 */
	public byte[] requestA() 
	{
		byte[] tab;
		tab = new byte[12 + this.getName().getBytes().length + 4 + 2];
		//0000 0001
		tab[2] = 1;
		tab[5] = 1;
		int indAct = 12;
		for (int i = 0; i < this.nameFragments.length; i++)
		{
			String m = this.nameFragments[i];
			tab[indAct++] = (byte) m.length();
			byte[] mCode = m.getBytes(StandardCharsets.US_ASCII);
			for (int j = 0; j < mCode.length; j++)
			{
				tab[indAct++] = mCode[j];
			}
		}
		tab[indAct + 2] = 1;
		tab[indAct + 4] = 1;
		return tab;
	}

	/**
	 * Perform a DNS query of type A.
	 * 
	 * @param server The IP address of the DNS server
	 * @return the DNS response made by the server
	 * @throws IOException when the server cannot be contacted or does not respond
	 *                     within a second
	 */
	public DNSResponse resolveA(InetAddress server) throws IOException 
	{
		// TODO: tasks 3 and 5
		DatagramSocket sock = new DatagramSocket();
		byte[] b = requestA();
		byte[] rep = new byte[56];
		DatagramPacket dp = new DatagramPacket(b, b.length, server, 53);
		sock.send(dp);

		DatagramPacket respDp = new DatagramPacket(rep, rep.length);
		sock.receive(respDp);
		sock.close();
		
		DNSResponse resp = new DNSResponse(respDp.getData(), respDp.getLength());
		resp.estValide();
		return resp;
	}
}
