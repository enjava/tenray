package com.ray.cool.service.impl;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ray.cool.base.DaoSupportImpl;
import com.ray.cool.entity.Leve;
import com.ray.cool.service.LeveService;

@Service("leveServiceImpl")
@Transactional
public class LeveServiceImpl extends DaoSupportImpl<Leve> implements LeveService {
	
}
