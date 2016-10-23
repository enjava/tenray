package com.ray.cool.entity;

import java.util.HashSet;
import java.util.Set;

/*
 * 会员等级
 */
public class Leve {
	private Integer id;
	private String description;// 描述会员
	private Double rate;// 收益率
    private Set<User> users=new HashSet<User>();		
	
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

}
