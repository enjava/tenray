package com.ray.cool.biz.impl;

import com.ray.cool.bean.Page;
import com.ray.cool.biz.UserBiz;
import com.ray.cool.dao.UserDao;
import com.ray.cool.entity.User;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service
public class UserBizImpl extends BaseBizImpl<User, Integer> implements UserBiz {
	@Resource(type=UserDao.class)
	private UserDao userDao;
	@Resource(type=UserDao.class)
	public void setBaseDao(UserDao userDao) {
		super.setBaseDao(userDao);
	}

	/**
	 * {@inheritDoc}
	 */
	public Page<User> getUserPage(Integer pageSize, Integer nowPage){
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		Page<User> page = new Page<User>();
		page.setOrderBy("id");
		page.setPageSize(pageSize);
		page.setNowPage(nowPage);
		return userDao.getPage(criteria, page);
	} 
}
