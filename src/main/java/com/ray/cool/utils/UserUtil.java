package com.ray.cool.utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import com.ray.cool.entity.User;



public abstract class UserUtil {

	/**
	 * 遍历部门树，把所有的部门遍历出来放到同一个集合中返回，并且其中所有部门的名称都修改了，以表示层次。
	 * 
	 * @param topList
	 * @return
	 */
	public static List<User> getAllUsers(User topUser) {
		Set<User> topList=topUser.getChildren();
		List<User> list = new ArrayList<User>();
		walkUserTreeList(topList, "", list);
		return list;
	}

	/**
	 * 遍历部门树，把遍历出的部门信息放到指定的集合中
	 * 
	 * @param topList
	 */
	private static void walkUserTreeList(Collection<User> topList, String prefix, List<User> list) {
		for (User top : topList) {
			// 顶点
			User copy = new User(); // 使用副本，因为原对象在Session中
			copy.setId(top.getId());
			copy.setName(prefix + top.getName());		
			// 子树
			walkUserTreeList(top.getChildren(), "" + prefix, list); // 使用全角的空格
		}
	}
}

