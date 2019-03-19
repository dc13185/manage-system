package com.ms.business.storeManage.action;

import java.io.IOException;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ms.business.store.entity.Store;
import com.ms.business.store.service.StoreService;
import com.ms.system.entity.SystemIp;
import com.ms.system.entity.SystemUser;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.Const;
import com.ms.system.util.RoleUtil;
import com.ms.system.util.Tools;

@Namespace("/storeManageAction")
@ParentPackage("json-default") 
@Controller
public class StoreManageAction extends SuperAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	 @Autowired
	 private StoreService storeService;
	 
	 private String menu_url ="/storeManageAction/toStoreManage";
	 
	 @Action(value="toStoreManage",results={@Result(name="storeList",location=ROUTE+"business/storeManage/myStore.jsp",type="dispatcher"),
				@Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher"),
				@Result(name="storeError",location=ROUTE+"business/storeManage/storeError.jsp",type="dispatcher")})
		 public String toUserList(){
			Session session = SecurityUtils.getSubject().getSession();  
			 //权限菜单
			SystemUser systemUser= (SystemUser) session.getAttribute(Const.SESSION_USER);
			if(RoleUtil.hasMenu(menu_url) && !Tools.isEmpty(systemUser.getTenant_id())){
				Store store = systemRepository.get(Store.class, systemUser.getTenant_id());
			    if(store!=null){
			    	request.setAttribute("store", store);
			    	if(store.getStatus()==1 || store.getStatus()==2){
			    		return "storeList";   
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
	 
	 
	 //修改
	 @Action(value="editStore")
	 public void editSystem() throws IOException{
		 String storeName=request.getParameter("storeName");
		 String store_introduc=request.getParameter("store_introduc");
		 String store_id=request.getParameter("store_id");
		 Store store=systemRepository.get(Store.class, store_id);
		 store.setStore_name(storeName);
		 store.setStore_introduc(store_introduc);
		 systemRepository.update(store);
	 }
	
		

}
