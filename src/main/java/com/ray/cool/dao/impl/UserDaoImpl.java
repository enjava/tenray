package com.ray.cool.dao.impl;


import com.ray.cool.dao.UserDao;
import com.ray.cool.entity.User;
import org.springframework.stereotype.Repository;
@Repository
public class UserDaoImpl extends BaseDaoImpl<User, Integer> implements UserDao {

}
