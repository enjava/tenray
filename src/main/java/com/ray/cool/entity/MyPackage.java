package com.ray.cool.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;


/**
 * @author en 套餐
 */
@Entity
@Table(name = "cool_package")
public class MyPackage {
	@Id
    @GenericGenerator(name = "idGenerator", strategy = "native")
    @GeneratedValue(generator = "idGenerator")
	private Long id;//
	@Column (length = 20 )
	private String price;// 总价
	@Column(length = 50)
	private String description;// 描述
	@Column
	private Integer amount;// 数量


	@OneToMany
	@JoinColumn(name = "myPackageId")
	private Set<Order> orders = new HashSet<Order>();// 订单表，一对多

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Set<Order> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }
}
