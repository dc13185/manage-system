package com.ms.business.store.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ms.business.store.entity.StoreAdminType;
import com.ms.business.store.service.StoreService;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.RoleUtil;


@Namespace("/storeTypeAdminAction")
@ParentPackage("json-default") 
@Controller
public class StoreTypeAdminAction extends SuperAction {

	
	 @Autowired 
	 private StoreService storeService;
	
	 
	 private String menu_url ="/storeTypeAdminAction/toStoreTypeList";
	 
	 
	 private Map<Object, Object> dataMap = new HashMap<Object, Object>();
   
	public Map<Object, Object> getDataMap() {
		return dataMap;
	}
	
	
	@Action(value="toStoreTypeList",results={@Result(name="toStoreTypeList",location=ROUTE+"business/storeAction/toStoreTypeList.jsp",type="dispatcher"),
			@Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher")})
	 public String toUserList(){
		 //权限菜单
		if(RoleUtil.hasMenu(menu_url)){
			return "toStoreTypeList";   
		}else{
			return "noRole"; 
		}
	 }
	
	
	
	 @Action(value="findStoreListByPage",results={@Result(name="json",type="json")})
	 public String findUsetListByPage() throws IOException{
		 String searchText =request.getParameter("searchText");
		 List<StoreAdminType> typeList = storeService.finStoreTypeList(searchText);
		 dataMap.put("typeList", typeList);
		 return "json";
	 }
	 
	 
	//增加店铺类型
	@Action(value="addType",results={@Result(name="json",type="json")})
	public String addType() throws IOException{
		StoreAdminType st = new StoreAdminType();
		String storeType_name = request.getParameter("storeType_name");
		st.setStoreType_name(storeType_name);
		systemRepository.save(st);
		dataMap.put("status", "success");
		return "json";
	}
	
	
	 //删除
	 @Action(value="deleteTypeByIds",results={@Result(name="json",type="json")})
	 public String deleteTypeByIds() throws IOException{
		 String  idcard   =  request.getParameter("idcard");
		 String [] _arrays =idcard.split(",");
		 if(_arrays.length>0){
			 String sql="delete from business_adminstoretype where storeType_id in";
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
	 @Action(value="editType",results={@Result(name="json",type="json")})
	 public String editType() throws IOException{
		 String storeType_id= request.getParameter("storeType_id");
		 String storeType_name=request.getParameter("storeType_name");
		 StoreAdminType storeAdminType= systemRepository.get(StoreAdminType.class, storeType_id);
		 storeAdminType.setStoreType_name(storeType_name);
		 systemRepository.update(storeAdminType);
		 return "json";
	 }
	

}
