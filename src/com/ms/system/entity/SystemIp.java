package com.ms.system.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="system_manage")
public class SystemIp {
	@Id
	@GeneratedValue(generator="systemMenuGenerator")
	@GenericGenerator(name="systemMenuGenerator",strategy="uuid")
	private int id;
	
	@Column(length=125)
	private String ip;
	
	@Column(length=125)
	private String systemName;

	public int getId() {
		return id;
	}

	public String getIp() {
		return ip;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
	
	
	
}
