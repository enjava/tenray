package com.ray.cool.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @author en 订单
 */
public class Order {

	private Integer id;//
	private String state;// 状态 0为付款,1已经完成
	private Date buyTime;// 购买时间
	private Date finishTime;// 完成购买
	private User user;// 用户表 多对多
	private MyPackage myPackage;// 套餐表，多对一
	private Set<RecommendedAward> recommendedAwards = new HashSet<RecommendedAward>();// 一对多
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getBuyTime() {
		return buyTime;
	}

	public void setBuyTime(Date buyTime) {
		this.buyTime = buyTime;
	}

	public Date getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}

	


	public Set<RecommendedAward> getRecommendedAwards() {
		return recommendedAwards;
	}

	public void setRecommendedAwards(Set<RecommendedAward> recommendedAwards) {
		this.recommendedAwards = recommendedAwards;
	}

	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}

	public MyPackage getMyPackage() {
		return myPackage;
	}

	public void setMyPackage(MyPackage myPackage) {
		this.myPackage = myPackage;
	}

}
