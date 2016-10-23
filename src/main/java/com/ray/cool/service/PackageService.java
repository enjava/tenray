package com.ray.cool.service;

import com.ray.cool.base.DaoSupport;
import com.ray.cool.entity.MyPackage;

import java.util.List;

public interface PackageService extends DaoSupport<MyPackage>{
	public List<MyPackage> findAll();

	public void delete(Long id);

	public void save(MyPackage mPackage);

	public MyPackage getById(Long id);

	public void update(MyPackage mPackage);
	
}
