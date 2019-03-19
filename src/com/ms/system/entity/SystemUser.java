package com.ms.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="system_user")
public class SystemUser {
	@Id
	@GeneratedValue(generator="systemUserGenerator")
	@GenericGenerator(name="systemUserGenerator",strategy="uuid")
	private String user_id;		//用户id
	@Column(length=125)
	private String username;	//登陆用户名	
	
	@Column(length=125)
	private String password; 	//password
	
	@Column(length=125)
	private String name;		//姓名	
	
	@Column(length=125,columnDefinition="Integer  default 0")
	private String rights;		//权限
	
	@Column(length=125)
	private String last_login;	//最后一次登陆时间
	
	@Column(length=125)
	private String ip;			//ipַ
	
	@Column(length=125)
	private String tenant_id;	//tenant_id
	
	

 	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRights() {
		return rights;
	}
	public void setRights(String rights) {
		this.rights = rights;
	}
	public String getLast_login() {
		return last_login;
	}
	public void setLast_login(String last_login) {
		this.last_login = last_login;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getTenant_id() {
		return tenant_id;
	}
	public void setTenant_id(String tenant_id) {
		this.tenant_id = tenant_id;
	}
	
	
}
