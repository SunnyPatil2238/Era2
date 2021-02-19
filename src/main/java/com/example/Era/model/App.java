package com.example.Era.model;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Enumeration;

import org.springframework.stereotype.Component;

@Component
public class App {

	public String[] getpcMacAddress() throws SocketException {
	
		String addresses[]=new String[5];
		int j=0;
		final Enumeration<NetworkInterface> e = NetworkInterface.getNetworkInterfaces();
	    while (e.hasMoreElements()) {
	        final byte [] mac = e.nextElement().getHardwareAddress();
	        if (mac != null) {
	            StringBuilder sb = new StringBuilder();
	            for (int i = 0; i < mac.length; i++)
	                sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
	            addresses[j++]=sb.toString();
	            System.out.println(sb.toString());
	        }
	    }
		return addresses;
	}
}


