package com.ms.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ms.system.entity.Menu;
import com.ms.system.hibernate.base.SystemRepository;
import com.ms.system.service.MenuService;


@Service
public class MenuServiceImpl  implements MenuService{
	
	@Autowired
	private SystemRepository systemRepository;
	
	//查询出所有的一级菜单
	@Override
	public List<Menu> finAllParentMenu() {
		List<Menu> menus = systemRepository.queryByHql("from Menu where parent_id is null");
		return menus;
	}
	
	public List<Menu> findSonMenuByParent(int parent_id){
		List<Menu> menus = systemRepository.queryByHql("from Menu where parent_id = "+parent_id+"");
		return menus;
	}
	
	//查询出所有的菜单
	public List<Menu> findAllMenuList() {
		List<Menu> menus = finAllParentMenu();
		for (Menu menu : menus) {
			List<Menu> sonMenus = findSonMenuByParent(menu.getMenu_id());
			menu.setSonMenu(sonMenus);
		}
		return menus;
	}
	
	
	


}
