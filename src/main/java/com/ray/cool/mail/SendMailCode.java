package com.ray.cool.mail;

import java.io.File;

public class SendMailCode implements IEmail {
	private String code;
	private String toAddr;

	@Override
	public String title() {
		return "酷么绑定邮箱验证";
	}

	@Override
	public String header() {
		return "欢迎您选购酷么小店的智能产品";
	}

	@Override
	public String body() {
		return "【酷么】您正在注册酷么网站的邮箱验证,您的验证码是[" + code + "],欢迎您选购酷么小店的智能产品!";
	}

	@Override
	public String host() {
		return "smtp.163.com";
	}

	@Override
	public String from() {
		return "ognlen@163.com";
	}

	@Override
	public String to() {
		return toAddr;
	}

	@Override
	public String fromName() {
		return "酷么小店";
	}

	@Override
	public MailAuthenticator proper() {

		return new MailAuthenticator("ognlen", "softenit");
	}

	@Override
	public File file() {
		return null;
	}

	@Override
	public String htmlText() {
		return null;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setToAddr(String toAddr) {
		this.toAddr = toAddr;
	}

}
