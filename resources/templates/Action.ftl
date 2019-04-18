package com.ms.${template.type}.${template.packageName}.action;

import com.ms.${template.type}.${template.packageName}.entity.${template.entityName};
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.RoleUtil;
import com.ms.${template.type}.${template.packageName}.service.${template.entityName}Service;
import com.ms.system.hibernate.page.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Namespace("/${template.packageName}Action")
@ParentPackage("json-default")
@Controller
public class ${template.entityName}Action extends SuperAction{


	 private String menu_url = "/${template.packageName}Action/to${template.entityName}List";

	 @Autowired
	 private ${template.entityName}Service ${template.packageName}Service;

    private PageModel<${template.entityName}> page= new PageModel<>();


	private Map<Object, Object> dataMap = new HashMap<Object, Object>();

	public PageModel<${template.entityName}> getPage() { return page; }

	public Map<Object, Object> getDataMap() { return dataMap; }


	@Action(value="to${template.entityName}List",results={@Result(name="${template.packageName}List",location=ROUTE+"${template.type}/${template.packageName}Action/${template.packageName}List.jsp",type="dispatcher"),
			@Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher")})
	 public String to${template.entityName}List(){
		 if(RoleUtil.hasMenu(menu_url)){
			 return "${template.packageName}List";
		 }else{
			 return "noRole";
		 }

	 }



	//页面返回数据
	@Action(value="find${template.entityName}ListByPage",results={@Result(name="json",type="json")})
	public String findStaffListByPage(){
		String pageSize = request.getParameter("pageSize");
		String pageNumber =request.getParameter("pageNumber");
		String searchText =request.getParameter("searchText");
		page.setPageSize(Integer.parseInt(pageSize));
		page.setPageNumber(Integer.parseInt(pageNumber));
		page = ${template.packageName}Service.get${template.entityName}ListByPage(page,searchText);
		return "json";
	}


	//根据id查询
	 @Action(value="find${template.entityName}ById",results={@Result(name="json",type="json")})
	 public String find${template.entityName}ById(){
		String  ${template.columns[0]} = request.getParameter("${template.columns[0]}");
		${template.entityName} ${template.packageName} = systemRepository.get(${template.entityName}.class, ${template.columns[0]});
		dataMap.put("${template.packageName}", ${template.packageName});
		return "json";
	 }






	//新增
	@Action(value="add${template.entityName}",results={@Result(name="json",type="json")})
	public String add${template.entityName}(){
		<#list template.columns as column>
		<#if column_index != 0>
		String ${column} =request.getParameter("${column}");
		</#if>
		</#list>
		${template.entityName} ${template.packageName} = new  ${template.entityName}();
		<#list template.columns as column>
		<#if column_index != 0>
		${template.packageName}.set${column ? cap_first}(${column});
		</#if>
		</#list>
		systemRepository.save(${template.packageName});
		dataMap.put("status", "success");
		return "json";
	}




	 //删除
	 @Action(value="delete${template.entityName}ByIds",results={@Result(name="json",type="json")})
	 public String delete${template.entityName}ByIds(){
		 String  idcard = request.getParameter("idcard");
		 String [] _arrays = idcard.split(",");
		 ${template.packageName}Service.delete${template.entityName}ByIds(_arrays);
		 dataMap.put("status", "success");
		 return "json";
	 }

	//修改
	@Action(value="edit${template.entityName}",results={@Result(name="json",type="json")})
	public String edit${template.entityName}(){
		<#list template.columns as column>
		String ${column} =request.getParameter("${column}");
		</#list>
		${template.entityName} ${template.packageName} = systemRepository.get(${template.entityName}.class, ${template.columns[0]});
		<#list template.columns as column>
		${template.packageName}.set${column ? cap_first}(${column});
		</#list>
		systemRepository.update(${template.packageName});
		dataMap.put("status", "success");
		return "json";
	}
}
