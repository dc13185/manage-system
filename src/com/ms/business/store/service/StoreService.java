package com.ms.business.store.service;


import java.math.BigInteger;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.business.StoreManagement.entity.StoreType;
import com.ms.business.store.entity.Store;
import com.ms.business.store.entity.StoreAdminType;
import com.ms.business.wx.order.entity.Order;
import com.ms.system.entity.SystemUser;
import com.ms.system.hibernate.base.SystemRepository;
import com.ms.system.hibernate.page.PageModel;
import com.ms.system.util.Const;
import com.ms.system.util.Tools;

@Service
public class StoreService {
	@Autowired
	private SystemRepository systemRepository;
	
	public PageModel<Store> findStoreListByPage(PageModel<Store> page,String searchText) {
		String sql ="SELECT s.* ,SUM(o.money) as all_money from business_store  s"
				+ " LEFT JOIN   business_order o ON s.store_id=o.store_id"
				+ " WHERE s.status != -1   ";
		 if(searchText!=null && !searchText.equals("")){
			 sql+=" and  (s.store_name like '%"+searchText+"%' or s.storeType_name like '%"+searchText+"%')";
		 }
		sql+=" GROUP BY s.store_id  having 1=1 ";
		sql+="order by createDate desc"; 
		
		String hql="from Store where status!=-1 ";
		 if(searchText!=null && !searchText.equals("")){
			 hql+=" and (store_name like '%"+searchText+"%' or storeType_name like '%"+searchText+"%')";
		 }
		 hql+="order by s.createDate desc"; 
		 System.out.println(sql);
	     BigInteger i= systemRepository.queryUniqueBySql("select count(1) from  business_store  s where s.status != -1");
		 
		 page = systemRepository.querySqlByPage(sql, page,i.intValue());		// TODO Auto-generated method stub
		 return page;
	}


	public List<StoreAdminType> finStoreTypeList(String searchText) {
		// TODO Auto-generated method stub
		 String hql=" from StoreAdminType";
		 if(!Tools.isEmpty(searchText)){
			 hql+=" where storeType_name like '%"+searchText+"%'";
			 
		 }
		 List<StoreAdminType> typeList = systemRepository.queryByHql(hql);
		 return typeList;
	}


	public List<Store> findStoreList() {
		// TODO Auto-generated method stub
		String hql=" from Store where status = 1 ";
		List<Store> storeList = systemRepository.queryByHql(hql);
		return storeList;
	}
	
	public List<StoreType> findStoreTypeByStoreId(String StoreId) {
		// TODO Auto-generated method stub
		String hql=" from StoreType where tenant_id = '"+StoreId+"' ";
		List<StoreType> storeTypeList = systemRepository.queryByHql(hql);
		return storeTypeList;
	}


	public PageModel<Order>  findOrderBySotreId(String store_id,PageModel<Order> page) {
		// TODO Auto-generated method stub
		Session session = SecurityUtils.getSubject().getSession();  
		 //权限菜单
		SystemUser systemUser= (SystemUser) session.getAttribute(Const.SESSION_USER);
		 String sql = "SELECT o.money,o.remarks,o.seat,o.status,o.store_id,o.cTime,f.food_menu_foodname,u.phone,o.count  "
		 		+ " from business_order o "
				+" left join wx_user u  on o.user_id = u.user_id"
		 		+" LEFT JOIN business_foodmenu f ON o.food_id = f.food_menu_id"
		 		+ " where o.store_id = '"+systemUser.getTenant_id()+"'";
		 System.out.println(sql);
		 page  = systemRepository.querySqlByPage(sql, page,0);
		 return page;
		
	}

}
