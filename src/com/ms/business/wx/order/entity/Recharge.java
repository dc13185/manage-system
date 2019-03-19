package com.ms.business.wx.order.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="business_recharge")
public class Recharge {
	@Id
	@GeneratedValue(generator="RechargeGenerator")
	@GenericGenerator(name="RechargeGenerator",strategy="uuid")
	private String recharge_id;
	
	@Column
	private int recharge_money;
	
	@Column
	private String user_id;
	
	
	@Column(columnDefinition="TIMESTAMP")
	private Date recharge_data;


	public String getRecharge_id() {
		return recharge_id;
	}


	public int getRecharge_money() {
		return recharge_money;
	}


	public String getUser_id() {
		return user_id;
	}


	public Date getRecharge_data() {
		return recharge_data;
	}


	public void setRecharge_id(String recharge_id) {
		this.recharge_id = recharge_id;
	}


	public void setRecharge_money(int recharge_money) {
		this.recharge_money = recharge_money;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public void setRecharge_data(Date recharge_data) {
		this.recharge_data = recharge_data;
	}


	
	
	
	
}
