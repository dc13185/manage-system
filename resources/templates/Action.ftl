package com.ms.${template.type}.${template.packageName}.action;

import com.ms.system.entity.${template.entityName};
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.RoleUtil;
import com.ms.system.util.Tools;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Namespace("/menuAction")
@ParentPackage("json-default") 
@Controller
public class ${template.entityName}Action extends SuperAction{


	 private String menu_url = "/${template.entityName}ction/to${template.entityName}List";
	 
	 private Map<Object, Object> dataMap = new HashMap<Object, Object>();
	 
	 public Map<Object, Object> getDataMap() {
			return dataMap;
		}


	@Action(value="to${template.entityName}List",results={@Result(name="menuList",location=ROUTE+"${template.type}/${template.entityName}Action/${template.packageName}List.jsp",type="dispatcher"),
			@Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher")})
	 public String to${template.entityName}List(){
		 if(RoleUtil.hasMenu(menu_url)){
			 return "${template.packageName}List";
		 }else{
			 return "noRole";
		 }
		
	 }
	
	

	//页面返回
	 @Action(value="find${template.entityName}List",results={@Result(name="json",type="json")})
	 public String find${template.entityName}List(){
		String searchText =request.getParameter("searchText");
		String hql ="from ${template.entityName}" ;
		if(searchText!=null && !searchText.equals("")){
			hql += " and (${template.columns[1]} like '%"+searchText+"%')";
		}
		List<${template.entityName}> ${template.packageName}s= systemRepository.queryByHql(hql);
		dataMap.put("${template.packageName}s", ${template.packageName}s);
		
		return "json";
	 }
	 
	 
	//根据id查询
	 @Action(value="find${template.entityName}ById",results={@Result(name="json",type="json")})
	 public String find${template.entityName}ById() throws IOException{
		String  ${template.columns[0]} = request.getParameter("${template.columns[0]}");
		${template.entityName} ${template.packageName} = systemRepository.get(${template.entityName}.class, ${template.columns[0]});
		dataMap.put("${template.packageName}", ${template.packageName});
		return "json";
	 }

	 

	 
	 
	 //新增菜单
	 @Action(value="saveOrEdit${template.entityName}",results={@Result(name="json",type="json")})
	 public String saveOrEditMenu(){
		<#list template.columns as column>
			String ${column} =request.getParameter("${column}");
		</#list>

		${template.entityName} ${template.packageName} = null;
		if(${template.columns[0]} == null || ${template.columns[0]}.equals("")){
			${template.packageName} = new ${template.entityName}();
		}else{
			${template.packageName} = systemRepository.get(${template.entityName}.class, ${template.columns[0]});
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
	 

	 
	 
	 //删除
	 @Action(value="delete${template.entityName}s",results={@Result(name="json",type="json")})
	 public String delete${template.entityName}s() throws IOException{
		 String  ${template.columns[0]}s = request.getParameter("${template.columns[0]}");
		 String [] _arrays =${template.columns[0]}s.split(",");
		 if(_arrays.length>0){
			 for (int i = 0; i < _arrays.length; i++) {
				 systemRepository.delete(${template.entityName}.class, _arrays[i]);
			 }
		 }
		 dataMap.put("status", "success");
		 return "json";
	 }
}
