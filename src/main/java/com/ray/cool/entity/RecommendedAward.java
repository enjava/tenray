package com.ray.cool.entity;

import java.util.Date;

/**
 * @author en 推荐奖励
 */
public class RecommendedAward {
	private Integer id;
	private Integer orderUserId;// 订单用户ID
	private String orderMoney;// 订单金额
	private Date orderfinshiTime;// 订单完成时间
	private Date orderbuyTime;// 订单购买时间
	private Double leveGrade;// 级差比例
	private String reward;// 推荐奖励
	private String userLeve;// 会员等级 //描述
	private Double leve;// 会员等级
	private String state;// 状态 1为完成
	private String pushType;// 推广类型
	private User user;// 与用户是多对一的关系
	private Order order;// 多对一

	public Date getOrderfinshiTime() {
		return orderfinshiTime;
	}

	public void setOrderfinshiTime(Date orderfinshiTime) {
		this.orderfinshiTime = orderfinshiTime;
	}

	public Date getOrderbuyTime() {
		return orderbuyTime;
	}

	public void setOrderbuyTime(Date orderbuyTime) {
		this.orderbuyTime = orderbuyTime;
	}

	public Integer getOrderUserId() {
		return orderUserId;
	}

	public void setOrderUserId(Integer orderUserId) {
		this.orderUserId = orderUserId;
	}

	public String getPushType() {
		return pushType;
	}

	public void setPushType(String pushType) {
		this.pushType = pushType;
	}

	public String getOrderMoney() {
		return orderMoney;
	}

	public void setOrderMoney(String orderMoney) {
		this.orderMoney = orderMoney;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Double getLeve() {
		return leve;
	}

	public void setLeve(Double leve) {
		this.leve = leve;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}



	public Double getLeveGrade() {
		return leveGrade;
	}

	public void setLeveGrade(Double leveGrade) {
		this.leveGrade = leveGrade;
	}

	public String getReward() {
		return reward;
	}

	public void setReward(String reward) {
		this.reward = reward;
	}


	public String getUserLeve() {
		return userLeve;
	}

	public void setUserLeve(String userLeve) {
		this.userLeve = userLeve;
	}


}
