package com.ray.cool.mail;

import java.io.File;

/**
 * @author en
 * 
 */
/**
 * @author en
 * 
 */
public interface IEmail {

	/**
	 * 邮件标题
	 * 
	 * @return
	 */
	public String title();

	/**
	 * 邮件标签,可以设置公司公告
	 * 
	 * @return
	 */
	public String header();

	/**
	 * NormalMail 内容
	 * 
	 * @return
	 */
	public String body();

	/**
	 * 发送邮箱的smtp 如 smtp.163.com
	 * 
	 * @return
	 */
	public String host();

	/**
	 * 发件人的邮箱
	 * 
	 * @return
	 */
	public String from();

	/**
	 * 
	 * 收件人的邮箱
	 * 
	 * @return
	 */
	public String to();

	/**
	 * 显示发送者的姓名
	 * 
	 * @return
	 */
	public String fromName();

	/**
	 * 账号密码容器
	 * 
	 * @return
	 */
	public MailAuthenticator proper();

	/**
	 * 发送附件 的文件
	 * 
	 * @return
	 */
	public File file();

	/**
	 * 发送html实现的方法
	 * 
	 * @return
	 */
	public String htmlText();
}
