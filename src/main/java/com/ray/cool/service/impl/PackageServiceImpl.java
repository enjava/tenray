package com.ray.cool.service.impl;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ray.cool.base.DaoSupportImpl;
import com.ray.cool.entity.MyPackage;
import com.ray.cool.service.PackageService;


@Service("packageServiceImpl")
@Transactional
public class PackageServiceImpl extends DaoSupportImpl<MyPackage> implements PackageService {
	
}
