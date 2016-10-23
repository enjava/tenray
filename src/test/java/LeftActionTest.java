import org.junit.Test;

import com.ray.cool.mail.SendEmail;
import com.ray.cool.mail.SendMailCode;
import com.ray.cool.utils.ThUtil;

public class LeftActionTest {

	@Test
	public void testBuy() {
		String str = "1234567890";
		//
		// System.out.println(ThUtil.isEmail(str));

		System.out.println(str.substring(str.length() - 2, str.length()));
	}

	@Test
	public void name() throws Exception {
		SendMailCode mail = new SendMailCode();
		String code = ThUtil.nextInt() + "";
		mail.setCode(code);
		mail.setToAddr("enjava@qq.com");

		// 发送验证码邮件
		SendEmail.doSendNormalMail(mail);
	}

}
