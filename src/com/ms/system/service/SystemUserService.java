package com.ms.system.service;


import java.util.List;

import com.ms.system.entity.SystemUser;

public interface SystemUserService {
	SystemUser getUserByNameAndPwd(String username,String password);

	boolean checkUserSave(String username);

	List<SystemUser> findTenantUser();



}
