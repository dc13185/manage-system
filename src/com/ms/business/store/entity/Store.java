package com.ms.business.store.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.ms.business.Food.entity.FoodMenu;
import com.ms.business.StoreManagement.entity.StoreType;

//店铺的实体类
@Entity
@Table(name="business_store")
public class Store {
	@Id
	@GeneratedValue(generator="systemUserGenerator")
	@GenericGenerator(name="systemUserGenerator",strategy="assigned")
	private String store_id;
	
	@Column(length=125)
	private String store_name;  
	
	@Column(length=125)
	private String store_image;  //店铺图片
	
	@Column(length=125)
	private String image_path;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;   //创建时间
	
	@Column(length=125)
	private String store_introduc; //店铺简介
	
	@Column(length=125)
	private String store_user_id;  //店铺拥有者id
	
	@Column(length=125)
	private String store_user_name;  //店铺拥有者
	
	
	@Column(length=125)
	private String storeType_id;  //类型id
	
	@Column(length=125)
	private String storeType_name;  //类型名称
	
	@Transient
	private List<StoreType> storeTypes;
	
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

	@Column(columnDefinition="int  default 2")
	private int status=2;  //状态 2:未启用    1:正常  0:冻结   -1:已经删除

	
	
	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}


	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getStore_user_name() {
		return store_user_name;
	}

	public void setStore_user_name(String store_user_name) {
		this.store_user_name = store_user_name;
	}

	public String getStore_image() {
		return store_image;
	}

	public String getStore_introduc() {
		return store_introduc;
	}

	public String getStore_user_id() {
		return store_user_id;
	}

	public void setStore_image(String store_image) {
		this.store_image = store_image;
	}

	public void setStore_introduc(String store_introduc) {
		this.store_introduc = store_introduc;
	}

	public void setStore_user_id(String store_user_id) {
		this.store_user_id = store_user_id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getImage_path() {
		return image_path;
	}

	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}

	public List<StoreType> getStoreTypes() {
		return storeTypes;
	}

	public void setStoreTypes(List<StoreType> storeTypes) {
		this.storeTypes = storeTypes;
	}

	
	
	

}
