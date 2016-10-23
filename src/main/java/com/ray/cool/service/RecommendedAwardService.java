package com.ray.cool.service;

import com.ray.cool.base.DaoSupport;
import com.ray.cool.entity.RecommendedAward;

import java.util.List;



public interface RecommendedAwardService extends DaoSupport<RecommendedAward> {

	public List<RecommendedAward> findAll();

	public void delete(Long id);

	public void save(RecommendedAward recommendedAward);

	public RecommendedAward getById(Long id);

	public void update(RecommendedAward recommendedAward);
}
