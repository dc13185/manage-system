package com.ms.business.wx.wxUser.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import com.ms.business.store.entity.Store;
import com.ms.business.store.entity.StoreAdminType;
import com.ms.business.store.service.StoreService;
import com.ms.business.wx.wxUser.entity.User;
import com.ms.business.wx.wxUser.service.WxUserService;
import com.ms.system.entity.SystemIp;
import com.ms.system.service.impl.IPService;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.Const;
import com.ms.system.util.Tools;

@Namespace("/wxLoginAction")
@ParentPackage("json-default") 
@Controller
public class WxLoginAction extends SuperAction{
	
	@Autowired
	private IPService ipService;
	
	@Autowired
	private WxUserService wxUserService;
	
	@Autowired
	private StoreService storeService;
	
	private Map<Object, Object> dataMap = new HashMap<Object, Object>();

	public Map<Object, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<Object, Object> dataMap) {
		this.dataMap = dataMap;
	}
	
	
	@Action(value="toLogin",results={@Result(name="login",location=ROUTE+"business/wx/loginAction/login.jsp",type="dispatcher"),
			@Result(name="isAuth",location=ROUTE+"business/wx/index.jsp",type="dispatcher")})
	public String toLogin(){
		resultIp();
		Subject currentUser = SecurityUtils.getSubject();  
		//shiro管理的session
		if(!currentUser.isAuthenticated()){
			return "login";
		}else{
		   List<StoreAdminType> storeAdminTypes =	storeService.finStoreTypeList(null);
		   List<Store>  stores= storeService.findStoreList();
		   for (StoreAdminType storeAdminType : storeAdminTypes) {
			   	   List<Store> sonStores =new LinkedList<Store>();
				   for (Store store : stores) {
					   if(storeAdminType.getStoreType_id().equals(store.getStoreType_id())){
						   sonStores.add(store);
					   }
				  }
				   storeAdminType.setStores(sonStores);
		   }
		   request.setAttribute("storeAdminTypes", storeAdminTypes);
		  
		   return "isAuth";
		}
	
	}	
	
	
	
	
	@Action(value="hasTel",results={@Result(name="json",type="json")})
	public String hasTel(){
		String tel =request.getParameter("tel");
		boolean flag= wxUserService.hasTel(tel);
		dataMap.put("flag", flag);
		return "json";
	}
	
	
	
	//虚拟发送手机验证码
	@Action(value="sendCode")
	public void  sendCode(){
		//获取用户的手机号
		String userMobile = StringUtils.trimAllWhitespace(request.getParameter("tel"));
		String code = Tools.getRandomNum()+"";//验证码
		System.out.println("给手机"+userMobile+"发送验证码为"+code);
		
		
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		session.setAttribute(Const.SESSION_SECURITY_CODE, code);
	}
	
	@Action(value="login",results={@Result(name="json",type="json")})
	public String login(){
 		String tel =request.getParameter("tel");
 		String password =request.getParameter("password");
		User user = wxUserService.getUserByTelAndPassword(tel,password);
		
		Subject currentUser = SecurityUtils.getSubject(); 
		if(user!=null){
			UsernamePasswordToken token = new UsernamePasswordToken(user.getPhone(), user.getPassword()); 
			currentUser.getSession().setAttribute(Const.SESSION_USER, user);
			currentUser.login(token);
			dataMap.put("status", "success");	
		}else{
			dataMap.put("status", "pwdError");	
		}
		return "json";
	}
	
	
	@Action(value="logout",results={@Result(name="login",location=ROUTE+"business/wx/loginAction/login.jsp",type="dispatcher")})
	public String logout(){
		 resultIp();
		//shiro管理的session
		 Subject currentUser = SecurityUtils.getSubject();  
		 Session session = currentUser.getSession();
		 
		 //取出session中的对象
		 session.removeAttribute(Const.SESSION_USER);
		 session.removeAttribute(Const.SESSION_SECURITY_CODE);
		 session.removeAttribute(Const.SESSION_menuList);
		 currentUser.logout();
		 
/*		 SystemIp systemIp=systemRepository.queryUniqueByHql("from SystemIp");
		 request.setAttribute("systemName", systemIp.getSystemName());*/
		 return "login";
	}	
	
	
	/* ---------------------存IP------------------------------*/
	public void resultIp(){
		request.setAttribute("ip", ipService.getSystemIp());
	}

}
