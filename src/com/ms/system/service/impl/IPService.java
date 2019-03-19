package com.ms.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.system.entity.SystemIp;
import com.ms.system.hibernate.base.SystemRepository;
import com.ms.system.util.Tools;

@Service
public class IPService {
	private static String ip;
	
	
	@Autowired
	private SystemRepository systemRepository;
	
	
	public String getSystemIp(){
		if(Tools.isEmpty(ip)){
			SystemIp systemIp=systemRepository.queryUniqueByHql("from SystemIp");
			ip=systemIp.getIp();
		}
		
		return ip;
	}


	public void editIp(String ip2) {
		// TODO Auto-generated method stub
		ip = ip2;
	}
	

}
