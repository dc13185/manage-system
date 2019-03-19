package com.ms.business.store.action;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ms.business.store.entity.Store;
import com.ms.business.store.entity.StoreAdminType;
import com.ms.business.store.service.StoreService;
import com.ms.business.wx.order.entity.Order;
import com.ms.system.entity.SystemUser;
import com.ms.system.hibernate.page.PageModel;
import com.ms.system.service.SystemUserService;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.Base64Util;
import com.ms.system.util.Const;
import com.ms.system.util.DateUtil;
import com.ms.system.util.RoleUtil;
import com.ms.system.util.Tools;
import com.ms.system.util.UuidUtil;
import com.sun.org.apache.xerces.internal.impl.xpath.XPath.Step;

@Namespace("/storeAction")
@ParentPackage("json-default") 
@Controller
public class StoreAction extends SuperAction{
	 
	 /**
	 * 
	 */
	 private static final long serialVersionUID = 1L;
	 @Autowired 
	 private SystemUserService systemUserService;
	
	 @Autowired
	 private StoreService storeService;
	 
	 private String menu_url ="/storeAction/toStoreList";
	 
	 private PageModel<Store> page= new PageModel<>();
	 
	 private PageModel<Order> orderPage= new PageModel<>();
	 
	 
	 public PageModel<Order> getOrderPage() {
		return orderPage;
	}

	public void setOrderPage(PageModel<Order> orderPage) {
		this.orderPage = orderPage;
	}



	private Map<Object, Object> dataMap = new HashMap<Object, Object>();
	 
    public PageModel<Store> getPage() {
		return page;
	}
   
	public Map<Object, Object> getDataMap() {
		return dataMap;
	}
    



	@Action(value="toStoreList",results={@Result(name="storeList",location=ROUTE+"business/storeAction/storeList.jsp",type="dispatcher"),
			@Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher")})
	 public String toUserList(){
		 //权限菜单
		if(RoleUtil.hasMenu(menu_url)){
			List<SystemUser> tenanUsers =  systemUserService.findTenantUser();
			List<StoreAdminType> storeAdminTypes =storeService.finStoreTypeList(null);
			request.setAttribute("tenanUsers", tenanUsers);
			request.setAttribute("storeAdminTypes", storeAdminTypes);
			return "storeList";   
		}else{
			return "noRole"; 
		}
	 }
	
	
	//页面返回数据
	 @Action(value="findStoreListByPage",results={@Result(name="json",type="json")})
	 public String findUsetListByPage() throws IOException{
		 String pageSize = request.getParameter("pageSize");
		 String pageNumber =request.getParameter("pageNumber");
		 String searchText =request.getParameter("searchText");
		 page.setPageSize(Integer.parseInt(pageSize));
		 page.setPageNumber(Integer.parseInt(pageNumber));
		 
		 page = storeService.findStoreListByPage(page, searchText);
		 
		 return "json";
	 }
	 
	 
	 //新增
	 @Action(value="addOrEditStore",results={@Result(name="json",type="json")})
	 public String addOrEditStore() throws IOException{
		 String storeId= request.getParameter("storeId");
		 String storeImg =request.getParameter("img");
		 String storeName =request.getParameter("storeName");
		 String storeType_name =request.getParameter("storeType_name");
		 String storeType_id =request.getParameter("storeType_id");
		 String storeUserID=request.getParameter("storeUserID");
		 SystemUser systemUser=systemRepository.get(SystemUser.class, storeUserID);//绑定的用户
		 
		 Store store;
		 String imgId;
		 String nowDay=DateUtil.getDay();
		 if(Tools.isEmpty(storeId)){
			 //先上传图片
			 store = new Store();
			 imgId = UuidUtil.get32UUID();
		     store.setStore_id(imgId);
		     
		     String path= Base64Util.generateImage(storeImg, getUploadImagePath(imgId, nowDay));
		     System.out.println(path);
		     System.out.println(getServerPath());
		     store.setImage_path(getSaveImgPath(imgId, nowDay)); 
		     store.setStore_image(getServerImgPath(imgId, nowDay,path.substring(path.lastIndexOf(".")).toLowerCase()));
			 store.setStore_name(storeName);
			 store.setStore_user_id(storeUserID);
			 store.setStore_user_name(systemUser.getUsername());
			 store.setCreateDate(new Date());
			 store.setStoreType_id(storeType_id);
			 store.setStoreType_name(storeType_name);
			 systemRepository.save(store);
		 }else{
			 store = systemRepository.get(Store.class, storeId);
			 imgId=store.getStore_id();
			 if(storeImg!=null){
				 String path = Base64Util.generateImage(storeImg, getServerPath()+store.getImage_path());
				 System.out.println(path);
			 }
			 store.setStore_name(storeName);
			 store.setStore_user_id(storeUserID);
			 store.setStore_user_name(systemUser.getUsername());
			 store.setStoreType_id(storeType_id);
			 store.setStoreType_name(storeType_name);
			 systemRepository.update(store);
		 }
		 
		 systemUser.setTenant_id(store.getStore_id());
		 systemRepository.update(systemUser);
		 
		 return "json";
	 }
	 
	
	 //删除店铺（逻辑删除）
	 @Action(value="deleteStore",results={@Result(name="json",type="json")})
	 public String deleteStore() throws IOException{
		 String  idcard   =  request.getParameter("idcard");
		 String [] _arrays =idcard.split(",");
		 
		 if(_arrays.length>0){
			// String querySql="select bs.image_path,bs.store_image  from business_store bs where store_id in";
			 String sql="update  business_store set status=-1 where store_id in";
			 String cont_sql="";
			 for (int i = 0; i < _arrays.length; i++) {
				 if(i==0){
					 cont_sql+="('"+_arrays[i]+"'";
				 }else{
					 cont_sql+=",'"+_arrays[i]+"'";
				 }
			}
			 cont_sql+=")";
			 
		 //先删除图片
		/*	List<Object> fileList =  (List<Object>)systemRepository.queryBySql(querySql+cont_sql);
			 for (Object file : fileList) {
				 Object[] i= (Object[]) file;
				 String image_path = (String)i[0];
				 String store_image = (String)i[1];
				 System.out.println(getServerPath()+image_path+ store_image.substring(store_image.lastIndexOf(".")) );
				 FileUtils.deleteFile(getServerPath()+image_path+ store_image.substring(store_image.lastIndexOf(".")) );
			}*/
			 
			 systemRepository.updateBySql(sql+cont_sql);
		 }
		 dataMap.put("status", "success");
		 return "json";
	 }
	 
	 
	 
	 //开张或者关闭店铺
	 @Action(value="upOrDown",results={@Result(name="json",type="json")})
	 public String upOrDown(){
		 String status= request.getParameter("status");
		 String store_id=request.getParameter("storeId");
	     Store store= systemRepository.get(Store.class, store_id);
		 if(status.equals("startup")){
			 if(store.getStatus() == 2){
				 store.setStatus(1);
			 }else{
				 store.setStatus(2);
			 }
		 }else{
			 if(store.getStatus() == 0){
				 store.setStatus(2);
			 }else{
				 store.setStatus(0);
			 }
			 
		 }
		 systemRepository.update(store);
		 return "json";
	 }
	 
	 
	 

		@Action(value="toOrderList",results={@Result(name="toOrderList",location=ROUTE+"business/storeAction/orderList.jsp",type="dispatcher"),@Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher")})
		public String toOrderList(){
			 //权限菜单
			String order_url ="/storeAction/toOrderList";
 			if(RoleUtil.hasMenu(order_url)){
				return "toOrderList";   
			}else{
				return "noRole"; 
			}
		 }


		
		//页面返回数据
		 @Action(value="findOrderListByPage",results={@Result(name="json",type="json")})
		 public String findOrderListByPage() throws IOException{
			 Session session = SecurityUtils.getSubject().getSession();  
		     SystemUser systemUser= (SystemUser) session.getAttribute(Const.SESSION_USER);
			 String  store_id = systemUser.getTenant_id();
				
			 String pageSize = request.getParameter("pageSize");
			 String pageNumber =request.getParameter("pageNumber");
			 String searchText =request.getParameter("searchText");
			 orderPage.setPageSize(Integer.parseInt(pageSize));
			 orderPage.setPageNumber(Integer.parseInt(pageNumber));
			  
			 orderPage = storeService.findOrderBySotreId(store_id,orderPage);
			 
			 return "json";
		 }
	


}
