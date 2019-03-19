package com.ms.business.wx.order.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="business_order")
public class Order {
	@Id
	@GeneratedValue(generator="systemUserGenerator")
	@GenericGenerator(name="systemUserGenerator",strategy="uuid")
	private String order_id;
	
	@Column(length=125)
	private String user_id;   //用户id
	
	@Column(length=125)
	private String menu_id;
	
	
	@Column(length=125)
	private String store_id;  //店铺id
	
	@Column(length=125)
	private String seat;   //座位号
	
	
	@Column(length=125)
	private String remarks;   //备注
	
	@Column(length=125)
	private String food_id;  //食物id
	
	@Column
	private int count;  //数量
	
	@Column
	private int money;   

	@Column(columnDefinition="TIMESTAMP")
	private Date cTime;
	@Column
	private int status;   //0:       1:订单完成 未评价       2：订单完成  已经评价

	
	public String getOrder_id() {
		return order_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public String getStore_id() {
		return store_id;
	}

	public int getMoney() {
		return money;
	}

	public int getStatus() {
		return status;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getSeat() {
		return seat;
	}

	public String getRemarks() {
		return remarks;
	}

	public Date getcTime() {
		return cTime;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public void setcTime(Date cTime) {
		this.cTime = cTime;
	}

	public String getFood_id() {
		return food_id;
	}

	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
}
