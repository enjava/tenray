package com.ray.cool.service;

import com.ray.cool.base.DaoSupport;
import com.ray.cool.entity.User;

import java.util.List;

public interface UserService extends DaoSupport<User> {
	public List<User> findAll();

	public void delete(Long id);

	public void save(User user);

	public User getById(Long id);

	public void update(User user);

	// 根据手机号返回查询的User
	public List<User> getBymobile(String mobile);

	public List<User> findTopList();

	public List<User> findChildren(Long parentId);

	public List<User> getByEmail(String email);
}
