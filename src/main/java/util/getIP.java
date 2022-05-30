package util;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;

public class getIP {

	public static String getIPV4(HttpServletRequest request) {
		
		String ip = request.getHeader("X-Forwarded-For");
		
		if(ip==null)ip=request.getHeader("Proxy-Client-IP");
		if(ip==null)ip=request.getHeader("WL-Proxy-Client-IP");
		if(ip==null)ip=request.getHeader("HTTP_CLIENT_IP");
		if(ip==null)ip=request.getHeader("HTTP_X_FORWARDED_FOR");
		if(ip==null)ip=request.getRemoteAddr();

		return ip;
	}
}
