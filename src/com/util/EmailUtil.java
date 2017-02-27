package com.util;

import org.apache.commons.mail.*;

public class EmailUtil {
	private static String host = "smtp.163.com";
	private static String sender = "zhuqihui90@163.com";
	private static String pwd = "Zqh199065";

	public static void registerMail(String username, String email, String md5)
			throws EmailException {
		try {
			SimpleEmail mail = new SimpleEmail();
			mail.setHostName(host);
			// mail.setSmtpPort(25);
			mail.setAuthentication(sender, pwd);
			//mail.setSSLOnConnect(true);
			mail.addTo(email);
			mail.setFrom(sender, "DuangDuang");
			mail.setSubject("Dear " + username + ":");
			String url = "http://localhost:8080/bookstore/registered.jsp?user="
					+ username + "&md5=" + md5;
			mail.setMsg(url);
			System.out.println(url);
			mail.send();
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}

	public static void selledMail(String username, String seller, String email,
			String book) throws EmailException {
		HtmlEmail mail = new HtmlEmail();
		mail.setHostName(host);
		mail.setAuthentication(sender, pwd);
		mail.addTo(email);
		mail.setFrom(sender);
		mail.setSubject("Dear" + seller + "; Your book has been selled");
		mail.setHtmlMsg("<center><h2>Conguratulations! Your book " + book
				+ " has been bought by " + username
				+ ".Please login our website to check detail.</h2></center>");
		mail.send();
	}

	public static void adminMail(String seller, String book)
			throws EmailException {
		HtmlEmail mail = new HtmlEmail();
		mail.setHostName(host);
		mail.setAuthentication(sender, pwd);
		mail.addTo("zhaozhe1005@163.com");
		mail.setFrom(sender);
		mail.setSubject("A new book is added to sell.");
		mail.setHtmlMsg("<center><a>A new book " + book + " has been added by "
				+ seller + " now.</a></center>");
	}
}