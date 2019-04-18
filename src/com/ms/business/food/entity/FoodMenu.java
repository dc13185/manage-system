package com.ms.business.food.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="business_foodmenu")
public class FoodMenu {
	@Id
	@GeneratedValue(generator="FoodMenuGenerator")
	@GenericGenerator(name="FoodMenuGenerator",strategy="uuid")
	private String food_menu_id;		    //食物id
	@Column(length=125)
	private String food_menu_foodname;	
	@Column(length=125)
	private String food_menu_foodpic;       //食物图片
	@Column(length=125)
	private String food_image_path;
	@Column
	private int food_menu_foodprice;        //食物价格(分)
	
	@Column(name="food_menu_foodtime",columnDefinition="TIMESTAMP")
	private Date food_menu_foodtime;
	
	@Column(length=125)
	private String type_id;
	
	@Column(length=125)
	private String tenant_id;
	
	public String getFood_menu_id() {
		return food_menu_id;
	}
	public void setFood_menu_id(String food_menu_id) {
		this.food_menu_id = food_menu_id;
	}
	public String getFood_menu_foodname() {
		return food_menu_foodname;
	}
	public void setFood_menu_foodname(String food_menu_foodname) {
		this.food_menu_foodname = food_menu_foodname;
	}
	
	public Date getFood_menu_foodtime() {
		return food_menu_foodtime;
	}
	public void setFood_menu_foodtime(Date food_menu_foodtime) {
		this.food_menu_foodtime = food_menu_foodtime;
	}
	public int getFood_menu_foodprice() {
		return food_menu_foodprice;
	}
	public void setFood_menu_foodprice(int food_menu_foodprice) {
		this.food_menu_foodprice = food_menu_foodprice;
	}
	public String getFood_menu_foodpic() {
		return food_menu_foodpic;
	}
	public void setFood_menu_foodpic(String food_menu_foodpic) {
		this.food_menu_foodpic = food_menu_foodpic;
	}
	public String getFood_image_path() {
		return food_image_path;
	}
	public void setFood_image_path(String food_image_path) {
		this.food_image_path = food_image_path;
	}
	public String getTenant_id() {
		return tenant_id;
	}
	public void setTenant_id(String tenant_id) {
		this.tenant_id = tenant_id;
	}
	public String getType_id() {
		return type_id;
	}
	public void setType_id(String type_id) {
		this.type_id = type_id;
	}
	

	

	
	

	
}
