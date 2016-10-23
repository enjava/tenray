package com.ray.cool.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by en on 2016/10/23.
 */
@SuppressWarnings("serial")
@Entity
@Table(name ="tusr_role")
public class Role {
    @Id
    private Integer id;
    @Column(length = 100)
    private String name;
    @Column(length = 100)
    private String pass;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
