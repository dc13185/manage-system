package com.ms.system.util;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.ms.system.entity.Menu;
import com.ms.system.entity.SystemUser;

public  class RoleUtil {
	
	//判断是否拥有权限
	@SuppressWarnings("unchecked")
	public static boolean hasMenu(String menu_url){
		
		Session session = SecurityUtils.getSubject().getSession();  
		SystemUser systemUser= (SystemUser) session.getAttribute(Const.SESSION_USER);
	    
		List<Menu> menuList = (List<Menu>) session.getAttribute(Const.SESSION_menuList);
	
		for (Menu parent_menu : menuList) {
			for (Menu son_menu : parent_menu.getSonMenu()) {
				if(son_menu.getMenu_url().equals(menu_url)){
					return RightsHelper.testRights(systemUser.getRights(), son_menu.getMenu_id());
				}
			}
		}
		return false;
	}

}
