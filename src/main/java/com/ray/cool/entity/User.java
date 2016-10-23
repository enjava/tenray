package com.ray.cool.entity;

import org.springframework.context.annotation.Lazy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by en on 2016/10/12. 会员
 */
@Entity
@Table(name = "cool_user")
public class User implements Serializable {
    @Id
	private Long id;
    @Column(length = 20,nullable = false)
    private String mobile;// 手机号
    @Column(length = 50,nullable = false)
	private String password;// 密码
    @Column(length = 50 )
	private String username;// 昵称
    @Column(length = 50 )
	private String email;// 邮箱
    @Column(length = 20 )
	private String name;// 真实姓名
    @Column(length = 20 )
	private String iDcard;// 身份证
    @Column(length = 1 )
	private String gender;// 性别 0为未知 1男 2女
    @Column(length = 10 )
	private String province;// 省份
    @Column(length = 20 )
	private String city;// 城市
    @Column(length = 50 )
	private String company;// 公司
    @Column(length = 100 )
	private String position;// 职位
    @Column
    private String selfIntroduction;// 自我介绍
    @Column
	private String blog;// 博客或微博
    @Column(length = 30 )
	private String account;// 银行账号
    @Column
	private String headImg;// 头像
    @Column
	private Date birthday;// 生日
    @Column(length = 50 )
	private String qq;// qq号
    @Column(length = 50 )
	private String weixin;// 微信号
    @Column(nullable = false)
	private Date createTime;// 创建时间
    @Column
	private Long code;// 用于保存 父亲的id

    @Column (length = 1 )
	private String is3000;// 是否有购买过3000的订单
    @Column (length = 50 )
    private String payPassword;// 支付密码

    @ManyToOne               //指定多对一关系
    @JoinColumn(name="parentId")  //自关联
    private User parent;// 自关联 父亲

    @OneToMany
    @JoinColumn(name = "parentId")
	private Set<User> children = new HashSet<User>();// 自关联 孩子

    @OneToMany
    @JoinColumn(name = "userId")
	private Set<Order> orders = new HashSet<Order>();// 与订单 多对多

    @ManyToOne               //指定多对一关系
    @JoinColumn(name="leveId")  //一个员工只有一个等级  和登记表,多对一
    @Lazy(value = false)
	private Leve leve;// 等级表，多对一

    @OneToMany
    @JoinColumn(name = "userId")
    @Lazy(value = false)
	private Set<RecommendedAward> recommendedAwards;// 推荐奖励表一对多

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setCode(Long code) {
        this.code = code;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getiDcard() {
        return iDcard;
    }

    public void setiDcard(String iDcard) {
        this.iDcard = iDcard;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getSelfIntroduction() {
        return selfIntroduction;
    }

    public void setSelfIntroduction(String selfIntroduction) {
        this.selfIntroduction = selfIntroduction;
    }

    public String getBlog() {
        return blog;
    }

    public void setBlog(String blog) {
        this.blog = blog;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getWeixin() {
        return weixin;
    }

    public void setWeixin(String weixin) {
        this.weixin = weixin;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getIs3000() {
        return is3000;
    }

    public void setIs3000(String is3000) {
        this.is3000 = is3000;
    }

    public String getPayPassword() {
        return payPassword;
    }

    public void setPayPassword(String payPassword) {
        this.payPassword = payPassword;
    }

    public User getParent() {
        return parent;
    }

    public void setParent(User parent) {
        this.parent = parent;
    }

    public Set<User> getChildren() {
        return children;
    }

    public void setChildren(Set<User> children) {
        this.children = children;
    }

    public Set<Order> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }

    public Leve getLeve() {
        return leve;
    }

    public void setLeve(Leve leve) {
        this.leve = leve;
    }

    public Set<RecommendedAward> getRecommendedAwards() {
        return recommendedAwards;
    }

    public void setRecommendedAwards(Set<RecommendedAward> recommendedAwards) {
        this.recommendedAwards = recommendedAwards;
    }
}
