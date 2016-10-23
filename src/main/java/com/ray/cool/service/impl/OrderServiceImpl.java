package com.ray.cool.service.impl;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ray.cool.base.DaoSupportImpl;
import com.ray.cool.entity.Order;
import com.ray.cool.service.OrderService;


@Service("orderServiceImpl")
@Transactional
public class OrderServiceImpl extends DaoSupportImpl<Order> implements OrderService {
	
}
