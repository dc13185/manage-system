package com.ms.system.service;

import java.util.List;
import com.ms.system.entity.Menu;

public interface MenuService {

	List<Menu> finAllParentMenu();
	
	List<Menu> findSonMenuByParent(int parent_id);
	
	List<Menu> findAllMenuList();

}
