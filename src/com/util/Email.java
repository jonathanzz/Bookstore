package com.util;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class Email {

	public static void sendEmail(String sendTo, String username,String usertype) {
		SimpleEmail email = new SimpleEmail();
		String myUserName = "zhuqihui90@163.com";
		String Password = "Zqh199065";
		
		// String sendTo = Email;
		StringBuffer sb = new StringBuffer(
				"The mail is from SHABIBA, please click the URL to complete registration\n");
		sb.append("Dear " + username + "\n");
		sb.append("Thank you for choosing SHABIBA, please click the URL below to complete");
		sb.append(" your registration:\n");
		sb.append("http://localhost:8080/9321A2/emailActive.jsp?email=");
		sb.append(sendTo);
		sb.append("&username=");
		sb.append(username);
		sb.append("&usertype=");
		sb.append(usertype);
		sb.append("\n\n");
		sb.append("Kindest Regard\n" + "SHABIBA");
		

		try {
			email.setHostName("smtp.163.com");

			email.setAuthentication(myUserName, Password);
			email.setSSLOnConnect(true);
			email.setFrom(myUserName);
			email.setSubject("Register Confirmation");

			String s = sb.toString();

			email.setMsg(s);
			email.addTo(sendTo);
			email.send();
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public static void sendToSeller(String sendTo, String username) {
		SimpleEmail email = new SimpleEmail();
		String myUserName = "zhuqihui90@163.com";
		String Password = "Zqh199065";
		
		// String sendTo = Email;
		StringBuffer sb = new StringBuffer(
				"The mail is from SHABIBA, please click the URL to complete registration\n");
		sb.append("Dear " + username + "\n");
		sb.append("The i, please click the URL below to complete");
		sb.append(" your registration:\n");
		sb.append("http://localhost:8080/9321A2/emailActive.jsp?email=");
		sb.append(sendTo);
		sb.append("&username=");
		sb.append(username);
		sb.append("\n\n");
		sb.append("Kindest Regard\n" + "SHABIBA");
		

		try {
			email.setHostName("smtp.163.com");

			email.setAuthentication(myUserName, Password);
			email.setSSLOnConnect(true);
			email.setFrom(myUserName);
			email.setSubject("Register Confirmation");

			String s = sb.toString();

			email.setMsg(s);
			email.addTo(sendTo);
			email.send();
			System.out.println("shabiba");
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
