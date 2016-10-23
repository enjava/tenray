package com.ray.cool.interceptor;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.ray.cool.entity.User;

@SuppressWarnings("serial")
@Component("loginedCheckInterceptor")
public class LoginedCheckInterceptor extends AbstractInterceptor {

	@Override
	/* session过期、登录有效性及操作的权限验证拦截器 */
	public String intercept(ActionInvocation ai) throws Exception {
		// 取得请求的URL
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setDateHeader("Expires", 0);
		User systemUser = null;
		// 对登录与注销请求直接放行,不予拦截

		// 验证Session是否过期
		if (!ServletActionContext.getRequest().isRequestedSessionIdValid()) {
			// session过期,转向session过期提示页,最终跳转至登录页面
			return "tologin";
		} else {
			systemUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
			// 验证是否已经登录
			if (systemUser == null) {
				// 尚未登录,跳转至登录页面
				return "tologin";
			} else {
				return ai.invoke();

			}

		}
	}

}
