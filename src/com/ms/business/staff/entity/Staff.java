package com.ms.business.staff.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * @program: manag_system
 * @description: 员工实体
 * @author: dong.chao
 * @create: 2019-03-19 14:00
 **/
@Entity
@Table(name="business_staff")
public class Staff {

    @Id
    @GeneratedValue(generator="staffGenerator")
    @GenericGenerator(name="staffGenerator",strategy="native")
    @Column(length=125,name = "staff_id")
    private int staffId;

    @Column(length=125,name = "store_name")
    private String staffName;

    @Column(length=125,name = "staff_position")
    private String staffPosition;  //员工职位

    @Column(length=125,name = "staffAddress")
    private String staffAddress;   //家庭地址

    @Column(length=125,name = "phone")
    private String phone;       //电话号码

    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;   //创建时间



    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffPosition() {
        return staffPosition;
    }

    public void setStaffPosition(String staffPosition) {
        this.staffPosition = staffPosition;
    }

    public String getStaffAddress() {
        return staffAddress;
    }

    public void setStaffAddress(String staffAddress) {
        this.staffAddress = staffAddress;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }
}
