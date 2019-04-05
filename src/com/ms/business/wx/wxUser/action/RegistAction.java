package com.ms.business.wx.wxUser.action;

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

import com.ms.business.wx.wxUser.entity.User;
import com.ms.system.service.impl.IPService;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.Const;
import com.ms.system.util.MD5;

@Namespace("/registAction")
@ParentPackage("json-default") 
@Controller
public class RegistAction extends SuperAction{
	
	@Autowired
	private IPService ipService;
	
	private Map<Object, Object> dataMap = new HashMap<Object, Object>();

	public Map<Object, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<Object, Object> dataMap) {
		this.dataMap = dataMap;
	}
	
	@Action(value="toRegist",results={@Result(name="regist",location=ROUTE+"business/wx/registAction/regist.jsp",type="dispatcher")})
	public String toLogin(){
		resultIp();
		return "regist";
	}	
	
	
	
	
	@Action(value="regist",results={@Result(name="json",type="json")})
	public String regist(){
		String tel=request.getParameter("tel");
		String password=request.getParameter("pwd");
		String code=request.getParameter("code");
		
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		String sessonCode = (String) session.getAttribute(Const.SESSION_SECURITY_CODE);
		session.removeAttribute(Const.SESSION_SECURITY_CODE);
		if(code.equals(sessonCode)){
			User user = new User();
			user.setPhone(tel);
			user.setPassword(MD5.md5(password));
			systemRepository.save(user);
			
			 UsernamePasswordToken token = new UsernamePasswordToken(user.getPhone(), user.getPassword()); 
			 //登陆
			 currentUser.login(token);
			currentUser.getSession().setAttribute(Const.SESSION_USER, user);
		      dataMap.put("status", "success");
		}else{
            //验证码错误
			dataMap.put("status", "codeError");
		}
		return "json";
	}
	
	
	
	
	
	
	
	
	
	/** ---------------------存IP------------------------------*/
	public void resultIp(){
		request.setAttribute("ip", ipService.getSystemIp());
	}
}
