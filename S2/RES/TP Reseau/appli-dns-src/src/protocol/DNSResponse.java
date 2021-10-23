package protocol;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * Represents a response received from a DNS server.
 */
public class DNSResponse {

	/**
	 * An array of bytes large enough to contain the DNS response.
	 */
	private byte[] data;

	/**
	 * The number of bytes to take into account within the array data.
	 */
	private int length;

	public DNSResponse(byte[] data, int length) {
		this.data = data;
		this.length = length;
	}

	public boolean estValide()
	{
		return this.length > 0;
	}

	public InetAddress ipResp()
	{
		InetAddress aIp = null;
		if (estValide())
		{
			String ip = "" + (this.data[data.length - 4] & 0xFF);
			for (int i = data.length - 3; i < this.data.length; i++)
			{
				ip +=  "." + (this.data[i] & 0xFF);
			}
			try {
				aIp = InetAddress.getByName(ip);
			} catch (UnknownHostException e) {e.printStackTrace();}
		}
		return aIp;
	}

	@Override
	public String toString() {
		return "DNS Response of " + this.length + " bytes";
	}

}
