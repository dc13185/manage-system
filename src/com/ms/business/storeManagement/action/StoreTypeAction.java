package com.ms.business.storeManagement.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.ms.business.storeManagement.entity.StoreType;
import com.ms.business.store.entity.Store;
import com.ms.system.entity.SystemUser;
import com.ms.system.hibernate.page.PageModel;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.Const;
import com.ms.system.util.RoleUtil;
import com.ms.system.util.Tools;


@Namespace("/storeType")
@ParentPackage("json-default") 
@Controller
public  class StoreTypeAction extends SuperAction {
	 
/*	 @Autowired 
	 private FoodMenuService foodMenurService;*/
	 
	 private PageModel<StoreType> page= new PageModel<>();
	 
	 private Map<Object, Object> dataMap = new HashMap<Object, Object>();
	 private String menu_url ="/storeType/toStoreType";

	
	 
	 public PageModel<StoreType> getPage() {
		return page;
	}
    
	public Map<Object, Object> getDataMap() {
		return dataMap;
	}




	@Action(value="toStoreType",results={@Result(name="toStoreType",location=ROUTE+"/business/storeManagerment/typeList.jsp",type="dispatcher"),
			@Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher"),
			@Result(name="storeError",location=ROUTE+"business/storeManage/storeError.jsp",type="dispatcher")})
	 public String tofoodMenuList(){


		Session session = SecurityUtils.getSubject().getSession();  
		SystemUser systemUser= (SystemUser) session.getAttribute(Const.SESSION_USER);
		if(RoleUtil.hasMenu(menu_url) && !Tools.isEmpty(systemUser.getTenant_id())){
			Store store = systemRepository.get(Store.class, systemUser.getTenant_id());
		    if(store!=null){
		    	request.setAttribute("store", store);
		    	if(store.getStatus()==1 || store.getStatus()==2){
		    		return "toStoreType";     
				}else{
					return "storeError";
				}
		    }else{
		    	return "storeError";
		    }
			
		
		}else{
			return "noRole"; 
		}
		
	 }
	
	 @Action(value="findStoreTypeById",results={@Result(name="json",type="json")})
	 public String findStoreTypeById() throws IOException{
		 String  storeType_id  =  request.getParameter("storeType_id");
		 StoreType st = systemRepository.get(StoreType.class, storeType_id);
		 dataMap.put("storeType", st);
		 return "json";
	 }
	//增加店铺类型
	@Action(value="addType",results={@Result(name="json",type="json")})
	public String addType() throws IOException{
		Session session = SecurityUtils.getSubject().getSession();  
		SystemUser systemUser= (SystemUser) session.getAttribute(Const.SESSION_USER);
		StoreType st = new StoreType();
		String storeType_name = request.getParameter("storeType_name");
		st.setStoreType_name(storeType_name);
		st.setTenant_id(systemUser.getTenant_id());
		systemRepository.save(st);
		dataMap.put("status", "success");
		return "json";
	}
	//页面返回
	 @Action(value="findStoreTypeList",results={@Result(name="json",type="json")})
	 public String findStoreTypeList() throws IOException{
		 Session session = SecurityUtils.getSubject().getSession();  
		 SystemUser systemUser= (SystemUser) session.getAttribute(Const.SESSION_USER);
		 String hql=" from StoreType where tenant_id='"+systemUser.getTenant_id()+"'";
		 List<StoreType> typeList = systemRepository.queryByHql(hql);
		 dataMap.put("typeList", typeList);
		return "json";
	 }
	 
	
	 //删除
	 @Action(value="deleteTypeByIds",results={@Result(name="json",type="json")})
	 public String deleteTypeByIds() throws IOException{
		 String  idcard   =  request.getParameter("idcard");
		 String [] _arrays =idcard.split(",");
		 if(_arrays.length>0){
			 String sql="delete from business_storetype where storeType_id in";
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
	 StoreType storeType= systemRepository.get(StoreType.class, storeType_id);
	 storeType.setStoreType_name(storeType_name);
	 systemRepository.update(storeType);
	 return "json";
 }

	
}
