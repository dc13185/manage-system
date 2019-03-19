package com.ms.business.wx.wxUser.action;

import java.util.Date;
import java.util.HashMap;
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

import com.ms.business.store.service.StoreService;
import com.ms.business.wx.order.entity.Recharge;
import com.ms.business.wx.wxUser.entity.User;
import com.ms.business.wx.wxUser.service.WxUserService;
import com.ms.system.entity.SystemUser;
import com.ms.system.service.impl.IPService;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.Const;
import com.ms.system.util.MD5;

@Namespace("/userAction")
@ParentPackage("json-default") 
@Controller
public class UserAction extends SuperAction{
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
	
	@Action(value="toMine",results={@Result(name="mine",location=ROUTE+"business/wx/my/mine.jsp",type="dispatcher")})
	public String toMine(){
		resultIp();
		Session session = SecurityUtils.getSubject().getSession(); 
		User shrioUser= (User)session.getAttribute(Const.SESSION_USER);
		User user=systemRepository.get(User.class, shrioUser.getUser_id());
		request.setAttribute("user", user);
		return "mine";
	}
	
	
	@Action(value="toMyburse",results={@Result(name="myburse",location=ROUTE+"business/wx/my/myburse.jsp",type="dispatcher")})
	public String toMyburse(){
		resultIp();
		Session session = SecurityUtils.getSubject().getSession(); 
		User shrioUser= (User)session.getAttribute(Const.SESSION_USER);
		User user=systemRepository.get(User.class, shrioUser.getUser_id());
		request.setAttribute("user", user);
		return "myburse";
	}
	
	
	@Action(value="toChongzhi",results={@Result(name="chongZhi",location=ROUTE+"business/wx/my/chongzhijsp.jsp",type="dispatcher")})
	public String toChongzhi(){
		resultIp();
		Session session = SecurityUtils.getSubject().getSession(); 
		User shrioUser= (User)session.getAttribute(Const.SESSION_USER);
		User user=systemRepository.get(User.class, shrioUser.getUser_id());
		request.setAttribute("user", user);
		return "chongZhi";
	}
	
	
	@Action(value="recharge",results={@Result(name="all_recharge",location=ROUTE+"business/wx/my/mine.jsp",type="dispatcher")})
	public String recharge(){
		resultIp();
		Session session = SecurityUtils.getSubject().getSession(); 
		User shrioUser= (User)session.getAttribute(Const.SESSION_USER);
		User user=systemRepository.get(User.class, shrioUser.getUser_id());
		int money=Integer.parseInt(request.getParameter("moeny"));
		
		Recharge recharge=new Recharge();
		recharge.setRecharge_data(new Date());
		recharge.setRecharge_money(money);
		recharge.setUser_id(shrioUser.getUser_id());
		systemRepository.save(recharge);
		
		user.setMoney(user.getMoney()+money*100);
		systemRepository.update(recharge);
		//request.setAttribute("user", user);
		return "all_recharge";
	}
	
	
	@Action(value="toResetPassword",results={@Result(name="resetPassword",location=ROUTE+"business/wx/my/psd_chage.jsp",type="dispatcher")})
	public String toResetPassword(){
		resultIp();
		return "resetPassword";
	}
	
	@Action(value="resetPassword",results={@Result(name="json",type="json")})
	public String resetPassword(){
		resultIp();
		Session session = SecurityUtils.getSubject().getSession(); 
		//User shrioUser= (User)session.getAttribute(Const.SESSION_USER);
		
		String tel=request.getParameter("tel");
		String password=request.getParameter("pwd");
		String code=request.getParameter("code");
		
		//Subject currentUser = SecurityUtils.getSubject(); 
		String sesson_code = (String) session.getAttribute(Const.SESSION_SECURITY_CODE);
		session.removeAttribute(Const.SESSION_SECURITY_CODE);
		if(code.equals(sesson_code)){
			User user =systemRepository.queryUniqueByHql("from User where phone='"+tel+"'");
			//User user = systemRepository.get(User.class, shrioUser.getUser_id());
			user.setPassword(MD5.md5(password));
			systemRepository.update(user);
			
			// UsernamePasswordToken token = new UsernamePasswordToken(user.getPhone(), user.getPassword()); 
			 //登陆
			 //currentUser.login(token);
			 
			 
		      dataMap.put("status", "success");
		}else{
			dataMap.put("status", "codeError"); //验证码错误
		}
		return "json";
	}
	
	
	
	
	/* ---------------------存IP------------------------------*/
	public void resultIp(){
		request.setAttribute("ip", ipService.getSystemIp());
	}
}
