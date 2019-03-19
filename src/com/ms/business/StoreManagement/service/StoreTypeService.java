package com.ms.business.StoreManagement.service;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.business.StoreManagement.entity.StoreType;
import com.ms.business.store.entity.Store;
import com.ms.system.entity.SystemUser;
import com.ms.system.hibernate.base.SystemRepository;
import com.ms.system.hibernate.page.PageModel;
import com.ms.system.util.Const;
import com.ms.system.util.RoleUtil;
import com.ms.system.util.Tools;

@Service
public class StoreTypeService {}
