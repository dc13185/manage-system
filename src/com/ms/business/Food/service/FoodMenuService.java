package com.ms.business.Food.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.business.Food.entity.FoodMenu;
import com.ms.system.hibernate.base.SystemRepository;

@Service
public class FoodMenuService {
	
	@Autowired
	private SystemRepository systemRepositorye;

	public List<FoodMenu> findFoodMenusByTypeId(String storeType_id) {
		// TODO Auto-generated method stub
		String hql = "from FoodMenu where type_id = '"+storeType_id+"'";
		List<FoodMenu> foodMenus =systemRepositorye.queryByHql(hql);
		return foodMenus;
	}

}
