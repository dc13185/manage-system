package com.ms.system.action;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.ms.system.entity.Menu;
import com.ms.system.entity.SystemIp;
import com.ms.system.entity.SystemUser;
import com.ms.system.hibernate.base.SystemRepository;
import com.ms.system.service.MenuService;
import com.ms.system.service.SystemUserService;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.Const;
import com.ms.system.util.DateUtil;
import com.ms.system.util.MD5;
import com.ms.system.util.RightsHelper;
import com.ms.system.util.Tools;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;


@Namespace("/loginAction")
@ParentPackage("json-default") 
/*@ParentPackage("struts-default")*/
@Controller
public class LoginAction extends SuperAction {
	@Autowired
	private SystemUserService systemUserService;
	@Autowired
	private MenuService menuService;
	
	private Map<Object, Object> dataMap = new HashMap<Object, Object>();
	
	private List<Object> dataList = new ArrayList<Object>();
	
	public Map<Object, Object> getDataMap() {
		return dataMap;
	}

	public List<Object> getDataList() {
		return dataList;
	}


	@Action(value="toLogin",results={@Result(name="login",location=ROUTE+"system/login.jsp",type="dispatcher"),
							@Result(name="isAuth",location=ROUTE+"main.jsp",type="dispatcher")})
	public String toLogin(){
		
		 Subject currentUser = SecurityUtils.getSubject();  
     
		 SystemIp systemIp=systemRepository.queryUniqueByHql("from SystemIp");
		 request.setAttribute("systemName", systemIp.getSystemName());
		//shiro管理的session

		 //没有认证过
		 if(!currentUser.isAuthenticated()){
			 return "login";
		 }else{
			return "isAuth";
		 }
		
	}	
		
		
		
	
	
	 @Action(value="login",results={@Result(name="json",type="json"),@Result(name="isAuth",location=ROUTE+"system/welcome.jsp",type="dispatcher")})
	 public String login(){
		//shiro管理的session
		 Subject currentUser = SecurityUtils.getSubject();  
		 //没有认证过
		if(!currentUser.isAuthenticated()){
			 String username =request.getParameter("username");
			 String password=request.getParameter("password");
			 String code=request.getParameter("code");
			
			 Session session = currentUser.getSession();
			 String  session_code= (String)session.getAttribute(Const.SESSION_SECURITY_CODE);
			 if(!code.equals("") && !code.equals(session_code)){
				 dataMap.put("status", "codeError"); //验证码错误
				 return "json";
			 }
				 
			 
			 
			
			 String md5_password= MD5.md5(password);
			 
			 if(systemUserService.checkUserSave(username)){
				 //查找用户
				 SystemUser systemUser= systemUserService.getUserByNameAndPwd(username, md5_password);
				 
				 if(systemUser!=null){
					 String nowtime =DateUtil.getTime().toString();
					 String IP = getRemortIP();
					 systemUser.setIp(IP);
					 systemUser.setLast_login(nowtime);
					 systemRepository.save(systemUser);
					 
					 //存入session
					 session.setAttribute(Const.SESSION_USER, systemUser);
					 
					 UsernamePasswordToken token = new UsernamePasswordToken(username, password); 
					 try {
						 //登陆
						 currentUser.login(token);
						 
					 	 String rights= systemUser.getRights();
					     List<Menu> menuList =  menuService.finAllParentMenu();
					 	 if(!Tools.isEmpty(rights)){
					 		 for (Menu parentMenu : menuList) {
					 			 parentMenu.setHasMenu(RightsHelper.testRights(rights, parentMenu.getMenu_id()));  
					 			 for (Menu sonMenu : parentMenu.getSonMenu()) {
					 				sonMenu.setHasMenu(RightsHelper.testRights(rights, sonMenu.getMenu_id()));
								}
							}
					 		 
					 	 }
					 	session.setAttribute(Const.SESSION_menuList, menuList);
						 
					 } catch (AuthenticationException e) {
						 // TODO: handle exception
						 dataMap.put("status", "loginError");
						 System.out.println("身份验证错误");   //身份验证错误
					 }
					 dataMap.put("status", "success"); //认证通过
					  
				 }else{
					  dataMap.put("status", "passwordError");
					  System.out.println("账号密码错误");
				 }
				//通过认证 
			 }else{
				 dataMap.put("status", "userNoFoundError"); //不存在该用户
			 }
				
			  return "json";	
		 }else{
			//已经认证过了
			 return "isAuth";
		 }
			 
			 
		 
	
		
	 }
	 
	 
	 
	 

		@Action(value="logout",results={@Result(name="login",location=ROUTE+"system/login.jsp",type="dispatcher")})
		public String logout(){
			//shiro管理的session
			 Subject currentUser = SecurityUtils.getSubject();  
			 Session session = currentUser.getSession();
			 
			 //取出session中的对象
			 session.removeAttribute(Const.SESSION_USER);
			 session.removeAttribute(Const.SESSION_SECURITY_CODE);
			 session.removeAttribute(Const.SESSION_menuList);
			 currentUser.logout();
			 
			 SystemIp systemIp=systemRepository.queryUniqueByHql("from SystemIp");
			 request.setAttribute("systemName", systemIp.getSystemName());
			 return "login";
		}	
			
	 
	 
	 
	 	
	 
		/**
		 * 获取登录用户的IP
		 * @throws Exception 
		 */
	    @JSON(serialize=false)
		public String getRemortIP(){  
			String ip = "";
			if (request.getHeader("x-forwarded-for") == null) {  
				ip = request.getRemoteAddr();  
		    }else{
		    	ip = request.getHeader("x-forwarded-for");  
		    }
			
			 return ip ;
		}  
	    
	    

		

}
