package com.ray.cool.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ray.cool.entity.User;
import com.ray.cool.service.LeveService;
import com.ray.cool.service.UserService;


/**
 * Created by en on 2016/10/12.
 */
@Controller("loginAction")
@Scope("prototype")
public class LoginAction extends ActionSupport {

	@Resource
	// 等级业务类
	private LeveService leveService;

	@Resource
	private UserService userService;
	private User user;

	public String register() throws Exception {
		return "zhuce";
	}

	public void loginCheck() throws Exception {

		String strResult = "loginfail";
		if (user != null && StringUtils.hasLength(user.getMobile()) && StringUtils.hasLength(user.getPassword())) {
			String userphone = user.getMobile();
			String userpwd = user.getPassword();
			List<User> listUser = new ArrayList<User>();
			listUser = userService.getBymobile(userphone);
			if (listUser.size() > 0) {
				user = listUser.get(0);
				if (listUser != null && user.getPassword().equals(userpwd)) {
					ActionContext.getContext().getSession().put("user", user);
					strResult = "loginsuccess";
				} else
					strResult = "loginfail";
			} else
				strResult = "loginfail";
		}
		// 输出
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		ServletOutputStream outputStream = response.getOutputStream();
		outputStream.write(strResult.getBytes());
		outputStream.close();
	}

	public String logout() throws Exception {
		Map<String, Object> attibutes = ActionContext.getContext().getSession();
		if (attibutes.containsKey("user"))
			attibutes.remove("user");
		return "logout";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
