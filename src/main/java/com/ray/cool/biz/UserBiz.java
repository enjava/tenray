package com.ray.cool.biz;

import com.ray.cool.bean.Page;
import com.ray.cool.entity.User;

/**
 * 用户的业务层
 * @author ydq
 *
 */
public interface UserBiz extends BaseBiz<User, Integer> {

	/**
	 * 获取用户的分页对象
	 * @param pageSize
	 * @param nowPage
	 * @return
	 */
	public Page<User> getUserPage(Integer pageSize, Integer nowPage);
}
