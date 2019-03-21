package com.ms.${template.type}.${template.packageName}.action;

import com.ms.${template.type}.${template.packageName}.entity.${template.entityName};
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.RoleUtil;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
//dsflsdfkjslk
@Namespace("/${template.packageName}Action")
@ParentPackage("json-default")
@Controller
public class ${template.entityName}Action extends SuperAction{


	 private String menu_url = "/${template.entityName}ction/to${template.entityName}List";

	 @Autowired
	 private ${template.entityName}Service ${template.packageName}Service;


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






	//新增
	@Action(value="add${template.entityName}",results={@Result(name="json",type="json")})
	public String add${template.entityName}() throws IOException{
		<#list template.columns as column>
		String ${column} =request.getParameter("${column}");
		</#list>
		${template.entityName} ${template.packageName} = new  ${template.entityName}();
		<#list template.columns as column>
		${template.packageName}.set${column ? cap_first}(${column})
		</#list>
		dataMap.put("status", "success");
		return "json";
	}




	 //删除
	 @Action(value="delete${template.entityName}s",results={@Result(name="json",type="json")})
	 public String delete${template.entityName}s() throws IOException{
		 String  ${template.columns[0]}s = request.getParameter("${template.columns[0]}");
		 String [] _arrays =${template.columns[0]}s.split(",");
		 ${template.packageName}Service.deleteStaffByIds(_arrays);
		 dataMap.put("status", "success");
		 return "json";
	 }

	//修改
	@Action(value="edit${template.entityName}",results={@Result(name="json",type="json")})
	public String edit${template.entityName}() throws IOException{
		<#list template.columns as column>
		String ${column} =request.getParameter("${column}");
		</#list>
		${template.entityName} ${template.packageName} = systemRepository.get(${template.entityName}.class, ${template.columns[0]});
		<#list template.columns as column>
		${template.packageName}.set${column ? cap_first}(${column})
		</#list>
		systemRepository.update(${template.packageName});
		dataMap.put("status", "success");
		return "json";
	}
}
