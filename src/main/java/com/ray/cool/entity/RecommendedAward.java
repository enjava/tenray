package com.ray.cool.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * @author en 推荐奖励
 */
@Entity
@Table(name = "cool_recommendedaward")
public class RecommendedAward {
	@Id
    @GenericGenerator(name = "idGenerator", strategy = "native")
    @GeneratedValue(generator = "idGenerator")
	private Long id;
	@Column
	private Long orderUserId;// 订单用户ID
	@Column (length = 20 )
	private String orderMoney;// 订单金额
	@Column
	private Date orderfinshiTime;// 订单完成时间
	@Column (nullable = false)
	private Date orderbuyTime;// 订单购买时间
	@Column
	private Double leveGrade;// 级差比例
	@Column(length = 20 )
	private String reward;// 推荐奖励
	@Column(length = 50 )
	private String userLeve;// 会员等级 //描述
	@Column
	private Double leve;// 会员等级
	@Column(length =1 )
	private String state;// 状态 1为完成
	@Column(length = 10 )
	private String pushType;// 推广类型


	@ManyToOne
    @JoinColumn(name = "userId")
	private User user;// 与用户是多对一的关系

	@ManyToOne
    @JoinColumn(name = "orderId")
	private Order order;// 多对一

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrderUserId() {
        return orderUserId;
    }

    public void setOrderUserId(Long orderUserId) {
        this.orderUserId = orderUserId;
    }

    public String getOrderMoney() {
        return orderMoney;
    }

    public void setOrderMoney(String orderMoney) {
        this.orderMoney = orderMoney;
    }

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

    public Double getLeve() {
        return leve;
    }

    public void setLeve(Double leve) {
        this.leve = leve;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPushType() {
        return pushType;
    }

    public void setPushType(String pushType) {
        this.pushType = pushType;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
