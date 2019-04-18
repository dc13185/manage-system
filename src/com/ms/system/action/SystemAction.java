package com.ms.system.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ms.system.entity.SystemIp;
import com.ms.system.service.impl.IPService;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.RoleUtil;


@Namespace("/systemAction")
@ParentPackage("json-default") 
@Controller
public class SystemAction extends SuperAction {
	 
	@Autowired
	 private IPService ipService;
	 
	 private Map<Object, Object> dataMap = new HashMap<Object, Object>();
	 
	 public Map<Object, Object> getDataMap() {
		return dataMap;
	}


	public void setDataMap(Map<Object, Object> dataMap) {
		this.dataMap = dataMap;
	}


	private String menu_url ="/systemAction/toSystemAction";
	 


	@Action(value="toSystemAction",results={@Result(name="toSystem",location=ROUTE+"/system/systemManage/systemManage.jsp",type="dispatcher"),
			@Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher")})
	 public String toSystemAction(){
		SystemIp systemIp=systemRepository.queryUniqueByHql("from SystemIp");
		request.setAttribute("systemIp", systemIp);
		if(RoleUtil.hasMenu(menu_url)){
			return "toSystem";
		}else{
			return "noRole"; 
		}
	 }
	
 
	 //修改
	 @Action(value="editSystem",results={@Result(name="json",type="json")})
	 public String editSystem() throws IOException{
		 SystemIp systemIp=systemRepository.queryUniqueByHql("from SystemIp");
		 String systemName=request.getParameter("systemName");
		 String ip=request.getParameter("systemIp");
		 
		 systemIp.setSystemName(systemName);
		 systemIp.setIp(ip);
		 systemRepository.update(systemIp);
		 ipService.editIp(ip);
		 dataMap.put("systemIp", systemIp);
		 return "json";
	 }
	
		
	 
	 @Action(value="toQrcode",results={@Result(name="toQrcode",location=ROUTE+"/system/systemManage/toQrcode.jsp",type="dispatcher")})
		 public String toQrcode(){
			String ip=ipService.getSystemIp();
			request.setAttribute("ip", ip);
			return "toQrcode";
		 }


}
