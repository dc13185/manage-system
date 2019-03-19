package com.ms.system.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.GenericGenerator;



@Entity
@Table(name="system_menu")
public class Menu implements Serializable{
	/**
	 * ddddd
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(generator="systemMenuGenerator")
	@GenericGenerator(name="systemMenuGenerator",strategy="native")
	private int menu_id;
	@Column(length=125)
	private String menu_name; 
	@Column(length=125)
	private String menu_url; //链接
    
		
	@Column(length=125)
	private String menu_order; //序号
	@Column(length=125)
	private String menu_font; //图标
	
	@Transient
	private boolean hasMenu = false ; //是否拥有菜单权限
	
	@ManyToOne// 指定多对一关系          
	@JoinColumn(name="parent_id")                  
	private Menu parentMenu; 
	
	
	@OneToMany(fetch=FetchType.EAGER)                                 //指定一对多关系
	@Cascade(value={CascadeType.DELETE }) //设定级联关系
	@JoinColumn(name="parent_id")       //指定与本类主键所对应的外表的外键
	private List<Menu> sonMenu;
	
	

		


	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_url() {
		return menu_url;
	}

	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}

	public String getMenu_order() {
		return menu_order;
	}

	public void setMenu_order(String menu_order) {
		this.menu_order = menu_order;
	}

	public String getMenu_font() {
		return menu_font;
	}

	public void setMenu_font(String menu_font) {
		this.menu_font = menu_font;
	}


	public Menu getParentMenu() {
		return parentMenu;
	}


	public void setParentMenu(Menu parentMenu) {
		this.parentMenu = parentMenu;
	}

	
	public boolean isHasMenu() {
		return hasMenu;
	}

	public void setHasMenu(boolean hasMenu) {
		this.hasMenu = hasMenu;
	}

	public List<Menu> getSonMenu() {
		return sonMenu;
	}

	public void setSonMenu(List<Menu> sonMenu) {
		this.sonMenu = sonMenu;
	}

	
	
	
}
