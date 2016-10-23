package com.ray.cool.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * @author en
 * 
 */
public class MailAuthenticator extends Authenticator {
	private String username;
	private String password;

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(username, password);
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public MailAuthenticator(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public MailAuthenticator() {
		super();
	}

}
