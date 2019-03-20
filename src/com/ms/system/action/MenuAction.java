package com.ms.system.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.ms.system.entity.Menu;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.RoleUtil;
import com.ms.system.util.Tools;

@Namespace("/menuAction")
@ParentPackage("json-default") 
@Controller
public class MenuAction extends SuperAction{
	 

	 private String menu_url = "/menuAction/toMenuList";
	 
	 private Map<Object, Object> dataMap = new HashMap<Object, Object>();
	 
	 public Map<Object, Object> getDataMap() {
			return dataMap;
		}

	 
	@Action(value="toMenuList",results={@Result(name="menuList",location=ROUTE+"system/menuAction/menuList.jsp",type="dispatcher"),
			@Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher")})
	 public String toUserList(){
		 if(RoleUtil.hasMenu(menu_url)){
			 return "menuList";
		 }else{
			 return "noRole";
		 }
		
	 }
	
	
	
	//页面返回
	 @Action(value="findMenuList",results={@Result(name="json",type="json")})
	 public String findMenuList(){
		String searchText =request.getParameter("searchText");
		String hql ="from Menu where PARENT_ID is null" ;
		if(searchText!=null && !searchText.equals("")){
			hql += " and (menu_name like '%"+searchText+"%')";
		}
		List<Menu> menus= systemRepository.queryByHql(hql);
		dataMap.put("menus", menus);
		
		return "json";
	 }
	 
	 
	//根据id查询
	 @Action(value="findMenuById",results={@Result(name="json",type="json")})
	 public String findMenuById() throws IOException{
		int  menu_id =Integer.parseInt(request.getParameter("menu_id"));
		Menu menu = systemRepository.get(Menu.class, menu_id);
		dataMap.put("menu", menu);
		return "json";
	 }
	//回显
		 @Action(value="echoMenu",results={@Result(name="json",type="json")})
		 public String echoMenu() throws IOException{
			String sql = "select m.menu_id ,m.menu_name from system_menu m where m.parent_id is null";
		    List<Map> menus = systemRepository.queryBySql(sql);
			dataMap.put("menus", menus);
			return "json";
		 }
	 
	 //根据父id查询
	//根据id查询
	 @Action(value="findMenuByParentId",results={@Result(name="json",type="json")})
	 public String findMenuByParentId() throws IOException{
		String parent_id = request.getParameter("parent_id");
		String hql ="from Menu where parent_id= "+parent_id+" ";
		List<Menu> menus =  systemRepository.queryByHql(hql);
		dataMap.put("sonMenus", menus);
		return "json";
	 }
	 
	 
	 //新增菜单
	 @Action(value="saveOrEditMenu",results={@Result(name="json",type="json")})
	 public String saveOrEditMenu(){
		String menuId =request.getParameter("menuId");
		String name =request.getParameter("name");
		String url =request.getParameter("url");
		String order =request.getParameter("order");
		String menu_parent = request.getParameter("menu_parent") ;
		Menu menu =null;
		if(menuId ==null || menuId.equals("")){
			menu = new Menu();
		}else{
			menu = systemRepository.get(Menu.class, Integer.parseInt(menuId));
		}
		
		menu.setMenu_name(name);
		menu.setMenu_order(order);
		menu.setMenu_url(url);
		if(Tools.isEmpty(menu_parent)){
			menu.setParentMenu(null);
		}else{
			menu.setParentMenu(systemRepository.get(Menu.class, Integer.parseInt(menu_parent)));
		}
		
		systemRepository.saveOrUpdate(menu);
		dataMap.put("status", "success");
		return "json";
	 }
	 
	 //修改图标
	 @Action(value="deitMenuFont",results={@Result(name="json",type="json")})
	 public String deitMenuFont(){
		 int deitMenuId =Integer.parseInt(request.getParameter("deitMenuId"));
		 String menu_font =request.getParameter("menu_font");
		 Menu menu = systemRepository.get(Menu.class, deitMenuId);
		 menu.setMenu_font(menu_font);
		 systemRepository.update(menu);
		 
		 return "json";
	 }
	 
	 
	 //删除
	 @Action(value="deleteMenus",results={@Result(name="json",type="json")})
	 public String deleteMenus() throws IOException{
		 String  idcard   =  request.getParameter("idcard");
		 String [] _arrays =idcard.split(",");
		 if(_arrays.length>0){
			 for (int i = 0; i < _arrays.length; i++) {
				 systemRepository.delete(Menu.class, Integer.parseInt(_arrays[i]));
			 }
		 }
		 dataMap.put("status", "success");
		 return "json";
	 }
}
