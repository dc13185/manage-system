package com.ms.business.store.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="business_adminstoretype")
public class StoreAdminType {
	@Id
	@GeneratedValue(generator="systemUserGenerator")
	@GenericGenerator(name="systemUserGenerator",strategy="uuid")
	private String storeType_id;
	
	@Column(length=125)
	private String storeType_name;  
	
	@Transient
	private List<Store> stores;
	
	public String getStoreType_id() {
		return storeType_id;
	}

	public String getStoreType_name() {
		return storeType_name;
	}

	public void setStoreType_id(String storeType_id) {
		this.storeType_id = storeType_id;
	}

	public void setStoreType_name(String storeType_name) {
		this.storeType_name = storeType_name;
	}

	public List<Store> getStores() {
		return stores;
	}

	public void setStores(List<Store> stores) {
		this.stores = stores;
	}


	
}
