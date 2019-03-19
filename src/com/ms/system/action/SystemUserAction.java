package com.ms.system.action;

import java.io.IOException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ms.system.entity.Menu;
import com.ms.system.entity.SystemUser;
import com.ms.system.hibernate.page.PageModel;
import com.ms.system.service.MenuService;
import com.ms.system.service.SystemUserService;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.MD5;
import com.ms.system.util.RightsHelper;
import com.ms.system.util.RoleUtil;
import com.ms.system.util.Tools;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;


@Namespace("/systemUser")
@ParentPackage("json-default") 
@Controller
public class SystemUserAction extends SuperAction {
	 
	 @Autowired 
	 private SystemUserService systemUserService;
	 @Autowired
	 private MenuService menuService;
	
	 private String menu_url ="/systemUser/toUserList";

	 
	 private PageModel<SystemUser> page= new PageModel<>();
	 
	 private Map<Object, Object> dataMap = new HashMap<Object, Object>();
	 
	 public PageModel<SystemUser> getPage() {
		return page;
	}
    
	public Map<Object, Object> getDataMap() {
		return dataMap;
	}




	@Action(value="toUserList",results={@Result(name="userList",location=ROUTE+"system/userAction/userList.jsp",type="dispatcher"),
			@Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher")})
	 public String toUserList(){
		 //权限菜单
		if(RoleUtil.hasMenu(menu_url)){
			return "userList";  //;   
		}else{
			return "noRole"; // ;
		}
	 }
	
	
	//页面返回
	 @Action(value="findUsetListByPage",results={@Result(name="json",type="json")})
	 public String findUsetListByPage() throws IOException{
		 String pageSize = request.getParameter("pageSize");
		 String pageNumber =request.getParameter("pageNumber");
		 String searchText =request.getParameter("searchText");
		 
		 page.setPageSize(Integer.parseInt(pageSize));
		 page.setPageNumber(Integer.parseInt(pageNumber));
		 String hql="from SystemUser";
		 if(searchText!=null && !searchText.equals("")){
			 hql+=" where (username like '%"+searchText+"%' or name like '%"+searchText+"%')";
		 }
		 
		 page = systemRepository.queryByPage(hql, page);
		return "json";
	 }
	 
	 //新增
	 @Action(value="addSystemUser",results={@Result(name="json",type="json")})
	 public String addSystemUser() throws IOException{
		 String username = request.getParameter("username");
		 
		 if(!systemUserService.checkUserSave(username)){
			 String password =request.getParameter("password");
			 String name =request.getParameter("name");
			 
			 SystemUser systemUser =new SystemUser();
			 systemUser.setUsername(username);
			 systemUser.setPassword(MD5.md5(password));
			 systemUser.setName(name);
			 systemUser.setRights("0");
			 systemRepository.save(systemUser);
			
			 dataMap.put("status", "success");
		  }else{
			 dataMap.put("status", "already");
		  }
		 
		 
		
		 return "json";
	 }
	 
	
	 //删除
	 @Action(value="deleteSystemUser",results={@Result(name="json",type="json")})
	 public String deleteSystemUser() throws IOException{
		 String  idcard   =  request.getParameter("idcard");
		 String [] _arrays =idcard.split(",");
		 if(_arrays.length>0){
			 String sql="delete from system_user where user_id in";
			 for (int i = 0; i < _arrays.length; i++) {
				 if(i==0){
					 sql+="('"+_arrays[i]+"'";
				 }else{
					 sql+=",'"+_arrays[i]+"'";
				 }
			}
			 sql+=")";
			 systemRepository.updateBySql(sql);
		 }
		 dataMap.put("status", "success");
		 return "json";
	 }
	 
	 
	 //修改
	 @Action(value="deitSystemUser",results={@Result(name="json",type="json")})
	 public String deitSystemUser() throws IOException{
		 String  systemId   =  request.getParameter("systemId");
		 String password =request.getParameter("password");
		 String name =request.getParameter("name");
		 SystemUser systemUser = systemRepository.get(SystemUser.class, systemId);
		 systemUser.setName(name);
		 systemUser.setPassword(password);
		 systemRepository.update(systemUser);
		 dataMap.put("status", "success");
		 return "json";
	 }
	 
	 @Action(value="findSystemUserById",results={@Result(name="json",type="json")})
	 public String findSystemUserById() throws IOException{
		 String  user_id   =  request.getParameter("user_id");
		 SystemUser systemUser = systemRepository.get(SystemUser.class, user_id);
		 dataMap.put("systemUser", systemUser);
		 return "json";
	 }
	
	 
	 @Action(value="editRoleByUser",results={@Result(name="json",type="json")})
	 public String editRoleByUser() throws IOException{
		 	 String user_id= request.getParameter("user_id");
		 	 SystemUser systemUser=systemRepository.get(SystemUser.class, user_id);
		 	 String rights= systemUser.getRights();
		 	 
		     List<Menu> menuList =  menuService.finAllParentMenu();
		 	 if(!Tools.isEmpty(rights)){
		 		 for (Menu parentMenu : menuList) {
		 			 parentMenu.setHasMenu(RightsHelper.testRights(rights, parentMenu.getMenu_id()));  
		 			 for (Menu sonMenu : parentMenu.getSonMenu()) {
		 				sonMenu.setHasMenu(RightsHelper.testRights(rights, sonMenu.getMenu_id()));
					}
				}
		 		 
		 	 }
		 	 JsonConfig config = new JsonConfig();
		 	 config.setExcludes(new String[]{"parentMenu"});//除去emps属性
		     JSONArray jsonArray=JSONArray.fromObject(menuList,config);
		     String   jsonString= jsonArray.toString();
		     jsonString = jsonString.replaceAll("menu_id", "id").replaceAll("menu_name", "name").replaceAll("sonMenu", "nodes").replaceAll("hasMenu", "checked");
		     dataMap.put("menuList", jsonString);
		     return "json";
     }
	 
	 
	 
	 //修改权限
	 @Action(value="toEditRoleByUser",results={@Result(name="json",type="json")})
	 public String toEditRoleByUser() throws IOException{
		 String user_id=request.getParameter("user_id");
		 String [] nodes =Tools.str2StrArray(request.getParameter("nodes"));
		 SystemUser systemUser= systemRepository.get(SystemUser.class, user_id);
		 if(nodes!=null && nodes.length>0 ){
			BigInteger rights = RightsHelper.sumRights(nodes);
			systemUser.setRights(rights.toString());
		 }else{
			 systemUser.setRights(0+"");
		 }
		 systemRepository.update(systemUser);
		 return "json";
	 }
	




	
}
