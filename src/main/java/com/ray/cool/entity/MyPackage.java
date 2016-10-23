package com.ray.cool.entity;

import java.util.HashSet;
import java.util.Set;


/**
 * @author en 套餐
 */
public class MyPackage {
	private Integer id;//	
	private String price;// 总价
	private String description;// 描述
	private int amount;// 数量
	private Set<Order> orders = new HashSet<Order>();// 订单表，一对多
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}


}
