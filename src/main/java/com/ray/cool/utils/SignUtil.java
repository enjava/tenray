package com.ray.cool.utils;

/**
 * Created by en on 2016/8/12.
 */

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 请求校验工具类
 * 
 * @author aguang
 * @Email zhaoguiguang@yeah.net
 * 
 */
public class SignUtil {
	private static boolean first = false;
	private static String url = "http://gw.api.taobao.com/router/rest";
	private static String appkey = "23478168";
	private static String secret = "9a5ca24c0d3f28e0a37016e0609190ae";

	public static int nextInt() {
		Random rand = new Random();
		int tmp = Math.abs(rand.nextInt());
		return tmp % (999999 - 100000 + 1) + 100000;
	}

	// 注册发送验证码

	/**
	 * 交易密码
	 * 
	 * @param phone
	 * @param number
	 * @return
	 */
	public static String sendPayPasswd(String phone, String number) {

		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setSmsType("normal");
		req.setSmsFreeSignName("酷么");
		req.setSmsParamString("{\"number\":\"" + number + "\"}");//
		req.setRecNum(phone);
		req.setSmsTemplateCode("SMS_21760072");
		AlibabaAliqinFcSmsNumSendResponse rsp;
		try {
			rsp = client.execute(req);
			return rsp.getBody();
		} catch (ApiException e) {
			e.printStackTrace();
		}
		return "发送异常";

	}

	/**
	 * 注册是的发送手机验证码
	 * 
	 * @param phone
	 * @param number
	 * @return
	 */
	public static String sendcode(String phone, String number) {

		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		// req.setExtend("123456");
		req.setSmsType("normal");
		req.setSmsFreeSignName("酷么");
		req.setSmsParamString("{\"number\":\"" + number + "\"}");//
		req.setRecNum(phone);
		req.setSmsTemplateCode("SMS_17795004");
		AlibabaAliqinFcSmsNumSendResponse rsp;
		try {
			rsp = client.execute(req);
			return rsp.getBody();
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "发送异常";

	}

	/**
	 * 更改手机时,验证原手机发送验证码
	 * 
	 * @param phone
	 * @param number
	 * @return
	 */
	public static String sendOldPhone(String phone, String number) {

		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		// req.setExtend("123456");
		req.setSmsType("normal");
		req.setSmsFreeSignName("酷么");
		req.setSmsParamString("{\"number\":\"" + number + "\"}");//
		req.setRecNum(phone);
		req.setSmsTemplateCode("SMS_20340001");
		AlibabaAliqinFcSmsNumSendResponse rsp;
		try {
			rsp = client.execute(req);
			return rsp.getBody();
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "发送异常";

	}

	/**
	 * 验证新手机发送的验证码
	 * 
	 * @param phone
	 * @param number
	 * @return
	 */
	public static String sendNewPhone(String phone, String number) {

		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		// req.setExtend("123456");
		req.setSmsType("normal");
		req.setSmsFreeSignName("酷么");
		req.setSmsParamString("{\"number\":\"" + number + "\"}");//
		req.setRecNum(phone);
		req.setSmsTemplateCode("SMS_20235003");
		AlibabaAliqinFcSmsNumSendResponse rsp;
		try {
			rsp = client.execute(req);
			return rsp.getBody();
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "发送异常";

	}

	/**
	 * 将字节数组转换为十六进制字符串
	 * 
	 * @param byteArray
	 * @return
	 */
	private static String byteToStr(byte[] byteArray) {
		String strDigest = "";
		for (int i = 0; i < byteArray.length; i++) {
			strDigest += byteToHexStr(byteArray[i]);
		}
		return strDigest;
	}

	/**
	 * 将字节转换为十六进制字符串
	 * 
	 * @param mByte
	 * @return
	 */
	private static String byteToHexStr(byte mByte) {
		char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
				'B', 'C', 'D', 'E', 'F' };
		char[] tempArr = new char[2];
		tempArr[0] = Digit[(mByte >>> 4) & 0X0F];
		tempArr[1] = Digit[mByte & 0X0F];

		String s = new String(tempArr);
		return s;
	}

	public static void sort(String a[]) {
		for (int i = 0; i < a.length - 1; i++) {
			for (int j = i + 1; j < a.length; j++) {
				if (a[j].compareTo(a[i]) < 0) {
					String temp = a[i];
					a[i] = a[j];
					a[j] = temp;
				}
			}
		}
	}

	/**
	 * 将微信消息中的CreateTime转换成标准格式的时间（yyyy-MM-dd HH:mm:ss）
	 * 
	 * @param createTime
	 *            消息创建时间
	 * @return
	 */
	public static String formatTime(String createTime) {
		// 将微信传入的CreateTime转换成long类型，再乘以1000
		long msgCreateTime = Long.parseLong(createTime) * 1000L;
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(new Date(msgCreateTime));
	}

	/**
	 * 将date转换成 微信消息中的CreateTime时间戳
	 * 
	 * @param createTime
	 *            消息创建时间
	 * @return
	 */
	public static String timeStamp(Date createTime) {
		long msgCreateTime = createTime.getTime();
		return msgCreateTime + "";
	}

	/**
	 * 转换成时间戳
	 * 
	 * @return
	 */
	public static String timeStamp() {
		return timeStamp(new Date());

	}

}