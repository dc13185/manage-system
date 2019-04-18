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

	/** 用户id */
	@Id
	@GeneratedValue(generator="userGenerator")
	@GenericGenerator(name="userGenerator",strategy="uuid")
	private String user_id;

	/** 电话号码 */
	@Column(length=125)
	private String phone;

	/** 密码 */
	@Column(length=125)
	private String password;

	/** 金额 */
	@Column()
	private int  money;

	/** 昵称 */
	@Column(length=125)
	private String nickName;

	/** 性别 男:0 女:1 */
	@Column
	private String sex;

	/** 学院 */
	private String department;

	/** 个人简介 */
	private String introduction;

	/** 头像(URL) */
	private String portrait;


 	
	
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getPortrait() {
		return portrait;
	}

	public void setPortrait(String portrait) {
		this.portrait = portrait;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
}
