package com.ray.cool.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/*
 * 会员等级
 */
@Entity
@Table(name = "cool_leve")
public class Leve {
	@Id
    @GenericGenerator(name = "idGenerator", strategy = "native")
    @GeneratedValue(generator = "idGenerator")
	private Integer id;

	@Column(length = 50)
	private String description;// 描述会员
	@Column
	private Double rate;// 收益率

	@OneToMany              //指定一对多关系

    @JoinColumn(name="leveId")  //指定与本类主键所对应的外表的外键
    private Set<User> users=new HashSet<User>();

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

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }
}
