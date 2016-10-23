package com.ray.cool.service.impl;

import com.ray.cool.base.DaoSupportImpl;
import com.ray.cool.entity.User;
import com.ray.cool.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("userServiceImpl")
@Transactional
@SuppressWarnings("unchecked")
public class UserServiceImpl extends DaoSupportImpl<User> implements
		UserService {

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getBymobile(String mobile) {
		return getSession().createQuery(//
				"FROM User WHERE mobile=?")//
				.setParameter(0, mobile).list();

	}

	@Override
	public List<User> findTopList() {
		return getSession().createQuery(//
				"FROM User d WHERE d.parent IS NULL")//
				.list();
	}

	@Override
	public List<User> findChildren(Long parentId) {
		return getSession().createQuery(//
				"FROM User d WHERE d.parent.id=?")//
				.setParameter(0, parentId)//
				.list();
	}

	@Override
	public List<User> getByEmail(String email) {
		return getSession().createQuery(//
				"FROM User WHERE email=?")//
				.setParameter(0, email).list();
	}

}
