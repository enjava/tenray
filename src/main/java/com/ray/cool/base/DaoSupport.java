package com.ray.cool.base;

import java.util.List;

public interface DaoSupport<T> {

	/**
	 * 保存实体
	 * 
	 * @param entity
	 */
	public void save(T entity);

	/**
	 * 删除实体
	 *
     *
     *
     *
	 * @param id
	 */
	public void delete(Long id);

	/**
	 * 更新实体
	 * 
	 * @param entity
	 */
	public void update(T entity);

	/**
	 * 按id查询
	 * 
	 * @param id
	 * @return
	 */
	public T getById(Long id);

	/**
	 * 按id查询
	 * 
	 * @param ids
	 * @return
	 */
	public List<T> getByIds(Long[] ids);

	/**
	 * 查询所有
	 * 
	 * @return
	 */
	public List<T> findAll();

}
