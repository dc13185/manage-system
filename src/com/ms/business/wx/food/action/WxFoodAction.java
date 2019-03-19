package com.ms.business.wx.food.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ms.business.Food.entity.FoodMenu;
import com.ms.business.Food.service.FoodMenuService;
import com.ms.business.StoreManagement.entity.StoreType;
import com.ms.business.store.entity.Store;
import com.ms.business.store.service.StoreService;
import com.ms.business.wx.order.entity.Comment;
import com.ms.system.service.impl.IPService;
import com.ms.system.superAction.SuperAction;

import jdk.jfr.events.SocketReadEvent;
import net.sf.json.JSONObject;

@Namespace("/wxFoodAction")
@ParentPackage("json-default") 
@Controller
public class WxFoodAction extends SuperAction {
	@Autowired
	private IPService ipService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private FoodMenuService foodMenuService;
	
	private Map<Object, Object> dataMap = new HashMap<Object, Object>();

	public Map<Object, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<Object, Object> dataMap) {
		this.dataMap = dataMap;
	}
	
	@Action(value="toFoodList",results={@Result(name="toFoodList",location=ROUTE+"business/wx/FoodList/FoodList.jsp",type="dispatcher")})
	public String toLogin(){
		resultIp();
		
		String store_id=request.getParameter("store_id");
		Store store = systemRepository.get(Store.class, store_id);
		
		List<StoreType> storeTypes = storeService.findStoreTypeByStoreId(store_id);
		for (StoreType storeType : storeTypes) {
			List<FoodMenu> foodMenus = foodMenuService.findFoodMenusByTypeId(storeType.getStoreType_id());
			storeType.setFoodMenus(foodMenus);
		}
		store.setStoreTypes(storeTypes);
		
		JSONObject jsonObject= JSONObject.fromObject(store);
		
		request.setAttribute("store", jsonObject);
		return "toFoodList"; 
	}	
	
	
	
	
	
	
	@Action(value="toShowCart",results={@Result(name="toShowCart",location=ROUTE+"business/wx/shopCar/shopcart.jsp",type="dispatcher")})
	public String toShowCart(){
		resultIp();
		return "toShowCart";
	}
	
	
	
	@Action(value="toFoodDetails",results={@Result(name="foodDetails",location=ROUTE+"business/wx/shopCar/pro_info.jsp",type="dispatcher")})
	public String toFoodDetails(){
		resultIp();
		String food_id=request.getParameter("food_id");
		FoodMenu foodMenu= systemRepository.get(FoodMenu.class, food_id);
		request.setAttribute("foodMenu",  foodMenu);
		JSONObject json_foodMenu = JSONObject.fromObject(foodMenu);
		request.setAttribute("json_foodMenu",  json_foodMenu);
		List<Comment> comments = systemRepository.queryByHql("from Comment where food_id = '"+food_id+"'");
		request.setAttribute("comments", comments);
		return "foodDetails";
	}
	
	
	
	/* ---------------------存IP------------------------------*/
	public void resultIp(){
		request.setAttribute("ip", ipService.getSystemIp());
	}
}
