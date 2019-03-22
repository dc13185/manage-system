package com.ms.business.food.action;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ms.business.food.entity.FoodMenu;
import com.ms.business.storeManagement.entity.StoreType;
import com.ms.business.storeManagement.service.StoreTypeService;
import com.ms.business.store.entity.Store;
import com.ms.system.entity.SystemUser;
import com.ms.system.hibernate.page.PageModel;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.Base64Util;
import com.ms.system.util.Const;
import com.ms.system.util.DateUtil;
import com.ms.system.util.RoleUtil;
import com.ms.system.util.Tools;
import com.ms.system.util.UuidUtil;


@Namespace("/foodMenu")
@ParentPackage("json-default") 
@Controller
public  class FoodMenuAction extends SuperAction {

	 @Autowired
	 private StoreTypeService storeTypeService;
	 
	 private PageModel<FoodMenu> page= new PageModel<>();
	 
	 private Map<Object, Object> dataMap = new HashMap<Object, Object>();
	 
	 private String menu_url ="/foodMenu/tofoodMenuList";
	 
	 public PageModel<FoodMenu> getPage() {
		return page;
	}
    
	public Map<Object, Object> getDataMap() {
		return dataMap;
	}




	@Action(value="tofoodMenuList",results={@Result(name="foodMenuList",location=ROUTE+"system/foodMenuAction/foodMenuList.jsp",type="dispatcher"),
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
		    		 String hql=" from StoreType where tenant_id='"+systemUser.getTenant_id()+"'";
		    		List<StoreType> storeTypes = systemRepository.queryByHql(hql);
		    		request.setAttribute("storeTypes", storeTypes);
		    		return "foodMenuList";     
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
	
	 @Action(value="findFoodMenuListById",results={@Result(name="json",type="json")})
	 public String findFoodMenuListById() throws IOException{
		 String  food_menu_id  =  request.getParameter("food_menu_id");
		 FoodMenu fm = systemRepository.get(FoodMenu.class, food_menu_id);
		 dataMap.put("FoodMenu", fm);
		 return "json";
	 }
	//增加食物
	@Action(value="addFood",results={@Result(name="json",type="json")})
	public String addFood() throws IOException{
		Session session = SecurityUtils.getSubject().getSession();  
		SystemUser systemUser= (SystemUser) session.getAttribute(Const.SESSION_USER);
		
		String food_menu_id = request.getParameter("food_menu_id");
		String food_menu_foodpic =request.getParameter("food_menu_foodpic");
		String food_menu_foodname = request.getParameter("food_menu_foodname");
		double food_menu_foodprice =Double.parseDouble(request.getParameter("food_menu_foodprice"));
		String food_menu_foodtime = request.getParameter("food_menu_foodtime");
		String storeType_id =request.getParameter("storeType_id");
		String imgId;
		String nowDay=DateUtil.getDay();
		FoodMenu fm = new FoodMenu();
		
		 if(Tools.isEmpty(food_menu_id)){
			 //先上传图片
			 imgId = UuidUtil.get32UUID();
		     fm.setFood_menu_id(imgId);
		     
		     String path= Base64Util.generateImage(food_menu_foodpic, getUploadImagePath(imgId, nowDay));
		     System.out.println("上传到"+path);
		     fm.setFood_image_path(getSaveImgPath(imgId, nowDay)); 
		     fm.setFood_menu_foodpic(getServerImgPath(imgId, nowDay,path.substring(path.lastIndexOf(".")).toLowerCase()));
		     fm.setFood_menu_foodname(food_menu_foodname);
		     fm.setFood_menu_foodprice(((int)food_menu_foodprice)*100);
		     fm.setFood_menu_foodtime(DateUtil.fomatDate(food_menu_foodtime));
		     fm.setTenant_id(systemUser.getTenant_id());
		     fm.setType_id(storeType_id);
			 systemRepository.save(fm);
		 }
		dataMap.put("status", "success");
		return "json";
	}
	//页面返回
	 @Action(value="findFoodMenuListByPage",results={@Result(name="json",type="json")})
	 public String findUsetListByPage() throws IOException{
		 Session session = SecurityUtils.getSubject().getSession();  
		 SystemUser systemUser= (SystemUser) session.getAttribute(Const.SESSION_USER);
		
		 String pageSize = request.getParameter("pageSize");
		 String pageNumber =request.getParameter("pageNumber");
		 String searchText =request.getParameter("searchText");
	     
		 page.setPageSize(Integer.parseInt(pageSize));
		 page.setPageNumber(Integer.parseInt(pageNumber));
		 
		 
		 String hql=" from FoodMenu where tenant_id='"+systemUser.getTenant_id()+"'";
		 if(searchText!=null && !searchText.equals("")){
			 hql+=" and (food_menu_foodname like '%"+searchText+"%' )";
		 }
	  page = systemRepository.queryByPage(hql, page);
		return "json";
	 }
	 
	
	 //删除
	 @Action(value="deleteFoodByIds",results={@Result(name="json",type="json")})
	 public String deleteFoodByIds() throws IOException{
		 String  idcard   =  request.getParameter("idcard");
		 String [] _arrays =idcard.split(",");
		 if(_arrays.length>0){
			 String sql="delete from business_foodmenu where food_menu_id in";
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
	 @Action(value="editFoodMenu",results={@Result(name="json",type="json")})
	 public String editFoodMenu() throws IOException{
		 String  food_menu_id   =  request.getParameter("food_menu_id");
		 String food_menu_foodname =request.getParameter("food_menu_foodname");
		 double food_menu_foodprice =Double.parseDouble(request.getParameter("food_menu_foodprice"));
		 String food_menu_foodtime = request.getParameter("food_menu_foodtime");
		 String food_menu_foodpic = request.getParameter("food_menu_foodpic");
		 String storeType_id =request.getParameter("storeType_id");
		 FoodMenu fm = systemRepository.get(FoodMenu.class, food_menu_id);
		 fm.setFood_menu_foodname(food_menu_foodname);
		 fm.setFood_menu_foodprice(((int)food_menu_foodprice)*100);
		 fm.setFood_menu_foodtime(DateUtil.fomatDate(food_menu_foodtime));
		 fm = systemRepository.get(FoodMenu.class, food_menu_id);
		 if(food_menu_foodpic!=null){
			 Base64Util.generateImage(food_menu_foodpic, getServerPath()+fm.getFood_image_path());
		 }
		 fm.setType_id(storeType_id);
		 systemRepository.update(fm);
		 dataMap.put("status", "success");
		 return "json";
	 }
	 
	 
	 
	 
	 




	
}
