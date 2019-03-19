package com.ms.business.StoreManagement.entity;


import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.ms.business.Food.entity.FoodMenu;

@Entity
@Table(name="business_storetype")
public class StoreType {
	@Id
	@GeneratedValue(generator="Store_ManagementGenerator")
	@GenericGenerator(name="Store_ManagementGenerator",strategy="uuid")
	private String storeType_id;		    //类型id
	@Column(length=125)
	private String storeType_name;	   //类型名称
	@Column(length=125)
	private String tenant_id;      //店铺id
	
	@Transient
	private List<FoodMenu> foodMenus;
	
	public String getStoreType_id() {
		return storeType_id;
	}
	public void setStoreType_id(String storeType_id) {
		this.storeType_id = storeType_id;
	}
	public String getStoreType_name() {
		return storeType_name;
	}
	public void setStoreType_name(String storeType_name) {
		this.storeType_name = storeType_name;
	}
	public String getTenant_id() {
		return tenant_id;
	}
	public void setTenant_id(String tenant_id) {
		this.tenant_id = tenant_id;
	}
	public List<FoodMenu> getFoodMenus() {
		return foodMenus;
	}
	public void setFoodMenus(List<FoodMenu> foodMenus) {
		this.foodMenus = foodMenus;
	}

	
	
	

	

	

	
}
