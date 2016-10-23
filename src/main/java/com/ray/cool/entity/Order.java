package com.ray.cool.entity;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @author en 订单
 */
@Entity
@Table(name = "cool_order")
public class Order {
	@Id
	private Long id;//
	@Column(length = 1)
	private String state;// 状态 0为付款,1已经完成
	@Column
	private Date buyTime;// 购买时间
	@Column
	private Date finishTime;// 完成购买

	@ManyToOne
	@JoinColumn(name = "userId")
	private User user;// 用户表 多对多

	@ManyToOne
	@JoinColumn(name = "myPackageId")
	private MyPackage myPackage;// 套餐表，多对一

	@OneToMany
	@Cascade(value=CascadeType.ALL)//设置级联
	@JoinColumn(name = "orderId")
	private Set<RecommendedAward> recommendedAwards = new HashSet<RecommendedAward>();// 一对多

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public Set<RecommendedAward> getRecommendedAwards() {
        return recommendedAwards;
    }

    public void setRecommendedAwards(Set<RecommendedAward> recommendedAwards) {
        this.recommendedAwards = recommendedAwards;
    }
}
