package com.ms.business.wx.wxUser.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="wx_user")
public class User {
	@Id
	@GeneratedValue(generator="userGenerator")
	@GenericGenerator(name="userGenerator",strategy="uuid")
	private String user_id;		//用户id
	@Column(length=125)
	private String phone;	//登陆用户名	
	@Column(length=125)
	private String password; 	//password
	@Column()
	private int  money; 	//金额
 	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}


}
