package com.ray.cool.service;

import com.ray.cool.base.DaoSupport;
import com.ray.cool.entity.Leve;

import java.util.List;

public interface LeveService extends DaoSupport<Leve> {

	public List<Leve> findAll();

	public void delete(Long id);

	public void save(Leve leve);

	public Leve getById(Long id);

	public void update(Leve leve);
	
}
