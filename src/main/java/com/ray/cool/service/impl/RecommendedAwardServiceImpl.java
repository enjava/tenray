package com.ray.cool.service.impl;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ray.cool.base.DaoSupportImpl;
import com.ray.cool.entity.RecommendedAward;
import com.ray.cool.service.RecommendedAwardService;

@Service("recommendedAwardServiceImpl")
@Transactional
public class RecommendedAwardServiceImpl extends DaoSupportImpl<RecommendedAward> implements RecommendedAwardService {
	
}
