package com.ms.business.wx.order.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.ms.business.Food.entity.FoodMenu;
import com.ms.business.wx.order.entity.Comment;
import com.ms.business.wx.order.entity.Order;
import com.ms.business.wx.wxUser.entity.User;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.Const;

@Namespace("/orderAction")
@ParentPackage("json-default") 
@Controller
public class OrderAction extends SuperAction{
	
	
	private static final long serialVersionUID = 1L;

	private Map<Object, Object> dataMap = new HashMap<Object, Object>();

	public Map<Object, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<Object, Object> dataMap) {
		this.dataMap = dataMap;
	}



	@Action(value="toOrderList",results={@Result(name="toOrderList",location=ROUTE+"business/wx/order/order_info.jsp",type="dispatcher")})
	public String toShowCart(){
		resultIp();
		Session session = SecurityUtils.getSubject().getSession();  
		User user= (User) session.getAttribute(Const.SESSION_USER);
		
		user = systemRepository.get(User.class, user.getUser_id());
		request.setAttribute("user", user);
		return "toOrderList";
	}
	
	
	@Action(value="saveOrder",results={@Result(name="json",type="json")})
	public String saveOrder(){
		resultIp();
		String foodIds =request.getParameter("ids");
		String [] lengths =  request.getParameter("lengths").split(",");
		String [] ids = foodIds.split(",");
		String zwh = request.getParameter("zwh");
		String bj = request.getParameter("bj");
		
		Session session = SecurityUtils.getSubject().getSession();  
		User user= (User) session.getAttribute(Const.SESSION_USER);
		user = systemRepository.get(User.class, user.getUser_id());
		
		int allSum=0;
		for (int i = 0; i < ids.length; i++) {
			int length = Integer.parseInt(lengths[i]);
			FoodMenu foodMenu=systemRepository.get(FoodMenu.class, ids[i]);
			
			Order order =new Order();
			order.setUser_id(user.getUser_id());
			order.setStatus(1);
			order.setSeat(zwh);
			order.setRemarks(bj);
			order.setFood_id(foodMenu.getFood_menu_id());
			order.setStore_id(foodMenu.getTenant_id());
			order.setCount(length);   // 数量
			order.setMoney(foodMenu.getFood_menu_foodprice()*length);
			allSum+= (foodMenu.getFood_menu_foodprice())*length;
			order.setcTime(new Date());
			
			systemRepository.save(order);
		}
		
		user.setMoney(user.getMoney()-allSum);
		
		systemRepository.update(user);
		
		return "json";
	}
	
	
	@Action(value="toAllOrder",results={@Result(name="allOrder",location=ROUTE+"business/wx/order/all_orders.jsp",type="dispatcher")})
	public String toAllOrder(){
		resultIp();
		return "allOrder";
	}
	
	
	//根据用户状态查询账单
	@Action(value="findOrdersByStatus",results={@Result(name="json",type="json")})
	public String findOrdersByStatus(){
		String  status = request.getParameter("status");
		Session session = SecurityUtils.getSubject().getSession();  
		User user= (User) session.getAttribute(Const.SESSION_USER);
		
		StringBuffer sb =new StringBuffer();
		sb.append("SELECT o.order_id,o.money AS all_money,o.count, f.food_menu_foodname,f.food_menu_foodprice,f.food_menu_foodpic,o.status,f.food_menu_id  from business_order o ");
		sb.append(" LEFT JOIN business_foodmenu  f ON f.food_menu_id = o.food_id");
		sb.append("  WHERE  o.user_id='"+user.getUser_id()+"' ");
		if(!StringUtils.isEmpty(status)){
			sb.append(" and o.status = "+status+" ");
		}
		sb.append("  ORDER BY o.cTime asc");
		
		List<Map> orders= systemRepository.queryMapWithSql(sb.toString());
		dataMap.put("orders", orders);
		return "json";
	}
	
	
	@Action(value="toComment",results={@Result(name="comment",location=ROUTE+"business/wx/order/comment.jsp",type="dispatcher")})
	public String toComment(){
		resultIp();
		String food_id=request.getParameter("food_id");
		String order_id=request.getParameter("order_id");
		request.setAttribute("food_id", food_id);
		request.setAttribute("order_id", order_id);
		return "comment";
	}
	
	
	@Action(value="comment",results={@Result(name="comment_alreday",location=ROUTE+"business/wx/order/all_orders.jsp",type="dispatcher")})
	public String comment(){
		resultIp();
		String food_id=request.getParameter("food_id");
		String order_id=request.getParameter("order_id");
		request.setAttribute("food_id", food_id);
		request.setAttribute("order_id", order_id);
		
		Session session = SecurityUtils.getSubject().getSession();  
		User user= (User) session.getAttribute(Const.SESSION_USER);
		
		String comment_main =request.getParameter("comment_main");
		
		//完成评论
		Comment comment=new Comment();
		comment.setComment_main(comment_main);
		comment.setFood_id(food_id);
		comment.setComment_data(new Date());
		comment.setOrder_id(order_id);
		comment.setUser_id(user.getUser_id());
		systemRepository.save(comment);
		
		//更改状态
		Order order =systemRepository.get(Order.class, order_id);
		order.setStatus(2);
		systemRepository.update(order);
		
		return "comment_alreday";
	}
	
	
	
	/* ---------------------存IP------------------------------*/
	public void resultIp(){
		request.setAttribute("ip", ipService.getSystemIp());
	}
}
