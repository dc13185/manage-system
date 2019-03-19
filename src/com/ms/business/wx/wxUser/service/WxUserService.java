package com.ms.business.wx.wxUser.service;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.business.wx.wxUser.entity.User;
import com.ms.system.hibernate.base.SystemRepository;
import com.ms.system.util.MD5;

@Service
public class WxUserService {
	@Autowired
	private SystemRepository systemRepository;

	//检查用户名是否存在
	public boolean hasTel(String tel) {
		// TODO Auto-generated method stub 
	    String sql= "select count(1) from wx_user u where phone='"+tel+"'";
		int i =((BigInteger)systemRepository.queryUniqueBySql(sql)).intValue();
		if(i==1){
			return true;
		}else{
			return false;
		}
	}

	public User getUserByTelAndPassword(String tel, String password) {
		// TODO Auto-generated method stub
		String hql="from User where phone='"+tel+"' and password = '"+MD5.md5(password)+"' ";
		User user = systemRepository.queryUniqueByHql(hql);
		return user;
	}


}
