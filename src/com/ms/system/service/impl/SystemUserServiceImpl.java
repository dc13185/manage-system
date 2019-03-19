package com.ms.system.service.impl;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.system.entity.SystemUser;
import com.ms.system.hibernate.base.SystemRepository;
import com.ms.system.service.SystemUserService;


@Service
public class SystemUserServiceImpl implements SystemUserService{
	
	@Autowired
	private SystemRepository systemRepository;
	
	public SystemUser getUserByNameAndPwd(String username,String password){
		String hql= "from SystemUser where username='"+username+"' and password ='"+password+"' ";
		SystemUser systemUser= (SystemUser)systemRepository.queryUniqueByHql(hql);
		return systemUser;
	}
	
	//检查用户名是否存在
	@Override
	public boolean checkUserSave(String username) {
		// TODO Auto-generated method stub 
		String sql= "select count(1) from system_user su where username='"+username+"'";
		int i =((BigInteger)systemRepository.queryUniqueBySql(sql)).intValue();
		if(i==1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<SystemUser> findTenantUser() {
		// TODO Auto-generated method stub
		String hql ="from SystemUser where username!='admin'";
		return systemRepository.queryByHql(hql);
	}


	

}
