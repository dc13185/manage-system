package com.ms.business.wx.wxUser.action;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.ms.system.util.*;
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

		String tel=request.getParameter("tel");
		String password=request.getParameter("pwd");
		String code=request.getParameter("code");
		
		String sessonCode = (String) session.getAttribute(Const.SESSION_SECURITY_CODE);
		session.removeAttribute(Const.SESSION_SECURITY_CODE);
		if(code.equals(sessonCode)){
			User user =systemRepository.queryUniqueByHql("from User where phone='"+tel+"'");
			user.setPassword(MD5.md5(password));
			systemRepository.update(user);
            dataMap.put("status", "success");
		}else{
            //验证码错误
			dataMap.put("status", "codeError");
		}
		return "json";
	}


	/**
	* @Description: 跳转到修改个人信息页面
	* @Param: []
	* @return: void
	* @Author: dong.chao
	* @Date: 2019/4/5
	*/
	@Action(value="toMineEdit",results={@Result(name="mineEdit",location=ROUTE+"business/wx/my/mine_edit.jsp",type="dispatcher")})
	public String toMineEdit(){
		resultIp();
		Session session = SecurityUtils.getSubject().getSession();
		User shrioUser= (User)session.getAttribute(Const.SESSION_USER);
		User user=systemRepository.get(User.class, shrioUser.getUser_id());
		request.setAttribute("user",user);
		return "mineEdit";
	}

	
	/** 
	* @Description: 修改个人信息
	* @Param: [] 
	* @return: java.lang.String 
	* @Author: dong.chaoeditUserInfo
	* @Date: 2019/4/5 
	*/ 
    @Action(value="editUserInfo",results={@Result(name="json",type="json")})
    public String editUserInfo(){
		resultIp();

		Session session = SecurityUtils.getSubject().getSession();
		User shrioUser= (User)session.getAttribute(Const.SESSION_USER);
		User user=systemRepository.get(User.class, shrioUser.getUser_id());

		String nickName = request.getParameter("nickName");
		String sex = request.getParameter("sex");
		String introduction = request.getParameter("introduction");
		String department = request.getParameter("department");

		user.setNickName(nickName);
		user.setSex(sex);
		user.setIntroduction(introduction);
		user.setDepartment(department);
		systemRepository.update(user);
		dataMap.put("status","success");
	    return "json";
    }

	
    /** 
    * @Description: 修改头像
    * @Param: [] 
    * @return: java.lang.String 
    * @Author: dong.chao
    * @Date: 2019/4/5 
    */ 
	@Action(value="editPortrait",results={@Result(name="json",type="json")})
	public String editPortrait() throws IOException {
		Session session = SecurityUtils.getSubject().getSession();
		User shrioUser= (User)session.getAttribute(Const.SESSION_USER);
		User user=systemRepository.get(User.class, shrioUser.getUser_id());

		String portraitImg =request.getParameter("img");
		//上传图片
		String uuid = UuidUtil.get32UUID();
		String nowDay = DateUtil.getDay();
		String path= Base64Util.generateImage(portraitImg, getUploadImagePath(uuid,nowDay));
		user.setPortrait(getServerImgPath(uuid, nowDay,path.substring(path.lastIndexOf(".")).toLowerCase()));

		systemRepository.update(user);
		dataMap.put("portrait",user.getPortrait());
		return "json";
	}


	
	
	
	
	/** ---------------------存IP------------------------------*/
	public void resultIp(){
		request.setAttribute("ip", ipService.getSystemIp());
	}
}
