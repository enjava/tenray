package com.ray.cool.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ray.cool.entity.User;
import com.ray.cool.service.LeveService;
import com.ray.cool.service.UserService;
import com.ray.cool.utils.SignUtil;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;


/**
 * Created by en on 2016/10/12.
 */
@Controller("registerAction")
@Scope("prototype")
public class RegisterAction extends ActionSupport {
	private Long user_code;
	private String mobile;
	private String user_pwd;
	private Long id;
	private String phoneverifyCode;
	@Resource
	private UserService userService;
	@Resource
	private LeveService leveService;
	private User user;
	private String verify_coder;

	@Override
	public String execute() throws Exception {
		return super.execute();
	}

	public String saveUser() throws Exception {
		user = new User();
		// 1 判断输入的手机号和密码
		// if (verify_coder != phoneverifyCode)
		try {
			if (StringUtils.hasLength(mobile) && StringUtils.hasLength(user_pwd)) {
				if (ActionContext.getContext().getSession().containsKey("phoneverifyCode")
						&& ActionContext.getContext().getSession().containsKey("mobileCode")) {

					String phoneCode = (String) ActionContext.getContext().getSession().get("phoneverifyCode");
					String mobileCode = (String) ActionContext.getContext().getSession().get("mobileCode");

					if (mobile.equals(mobileCode) && phoneCode.equals(verify_coder)) {

						while (true) {
							id = (long)SignUtil.nextInt();
							User userid = userService.getById(id);
							if (userid == null)
								break;
						}
						// 2推荐码
						if (user_code!=null&&user_code > 100000 && userService.getById(user_code) != null) {
							user.setCode(user_code);
							user.setParent(userService.getById(user_code));
						}
						// 3用户ID 手机号 密码 初始化用户
						user.setId(id);
						user.setMobile(mobile);
						user.setPassword(user_pwd);
						user.setCreateTime(new Date());
						user.setLeve(leveService.getById(1l));
						user.setIs3000("0");
						// 保存用户
						userService.save(user);
						return "success";
					}
				}
			}

		} catch (Exception e) {
			return "fail";
		}
		return "fail";
	}

	// 检查推荐码
	public void checkCode() {
		try {
			// 1、获取帐号
			if (user != null && StringUtils.hasLength(user.getId() + "")) {
				// 2、根据帐号到数据库中校验是否存在该帐号对应的用户
				user = userService.getById(user.getId());

				String strResult = "false";
				if (user != null) {
					// 说明该帐号已经存在
					user_code = user.getId();
					strResult = "true";
				}
				// 输出
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setContentType("text/html");
				ServletOutputStream outputStream = response.getOutputStream();
				outputStream.write(strResult.getBytes());
				outputStream.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 发送手机验证码
	public void verifyCoder() {
		if (user != null) {
			mobile = user.getMobile();
			System.out.println(mobile);
		} else {
			return;
		}
		// 检查输入的手机号码用户是否存在
		// userService.getBymobile(mobile)
		if (userService.getBymobile(mobile).size() > 0)
			phoneverifyCode = "cunzai";
		else {// 不存在
			if (StringUtils.hasLength(mobile)) {
				phoneverifyCode = SignUtil.nextInt() + "";
				String str = SignUtil.sendcode(mobile, phoneverifyCode);// 发送验证码
				ActionContext.getContext().getSession().put("phoneverifyCode", phoneverifyCode);
				ActionContext.getContext().getSession().put("mobileCode", mobile);
				System.out.println(str);

				// phoneverifyCode="1234";
			} else {
				return;
			}
		}
		// 返回结果
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		ServletOutputStream outputStream;
		try {
			outputStream = response.getOutputStream();
			outputStream.write(phoneverifyCode.getBytes());
			outputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

    public Long getUser_code() {
        return user_code;
    }

    public void setUser_code(Long user_code) {
        this.user_code = user_code;
    }

    public String getVerify_coder() {
		return verify_coder;
	}

	public void setVerify_coder(String verify_coder) {
		this.verify_coder = verify_coder;
	}

}
