package com.ray.cool.service;

import com.ray.cool.base.DaoSupport;
import com.ray.cool.entity.Order;

import java.util.List;

public interface OrderService extends DaoSupport<Order>{
	public List<Order> findAll();

	public void delete(Long id);

	public void save(Order order);

	public Order getById(Long id);

	public void update(Order order);
	
}
