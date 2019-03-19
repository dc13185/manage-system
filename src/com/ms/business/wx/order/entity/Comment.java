package com.ms.business.wx.order.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="business_comment")
public class Comment {
	@Id
	@GeneratedValue(generator="CommentGenerator")
	@GenericGenerator(name="CommentGenerator",strategy="uuid")
	private String comment_id;
	
	@Column(length=125)
	private String food_id;
	
	
	@Column(length=125)
	private String order_id;
	
	@Column(length=125)
	private String user_id;
	
	@Column(columnDefinition="TIMESTAMP")
	private Date comment_data;
	
/*	@Column(length=125)
	private String user_name;*/
	
	@Column(length=225)
	private String comment_main;

	public String getComment_id() {
		return comment_id;
	}

	public String getFood_id() {
		return food_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getComment_main() {
		return comment_main;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setComment_main(String comment_main) {
		this.comment_main = comment_main;
	}

	public Date getComment_data() {
		return comment_data;
	}

	public void setComment_data(Date comment_data) {
		this.comment_data = comment_data;
	}
	
	
	
	
	
}
