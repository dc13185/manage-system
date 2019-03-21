package com.ms.business.staff.action;

import com.ms.business.staff.entity.Staff;
import com.ms.business.staff.service.StaffService;
import com.ms.system.hibernate.page.PageModel;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.*;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: manag_system
 * @description: 员工管理
 * @author: dong.chao
 * @create: 2019-03-19 13:59
 **/

@Namespace("/staffAction")
@ParentPackage("json-default")
@Controller
public class StaffAction extends SuperAction {
    //链接
    private String menu_url ="/staffAction/toStaffList";

    private Map<Object, Object> dataMap = new HashMap<Object, Object>();

    private PageModel<Staff> page= new PageModel<>();
    @Autowired
    private StaffService staffService;

    //员工类
    public PageModel<Staff> getPage() {
        return page;
    }

    public Map<Object, Object> getDataMap() {
        return dataMap;
    }

    @Action(value="toStaffList",results={@Result(name="staffList",location=ROUTE+"business/staffAction/staffList.jsp",type="dispatcher"),
            @Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher")})
    public String toUserList(){
        //权限菜单
        if(RoleUtil.hasMenu(menu_url)){
            return "staffList";
        }else{
            return "noRole";
        }
    }

    //删除员工
    @Action(value="deleteStaffByIds",results={@Result(name="json",type="json")})
    public String deleteStaffByIds() throws IOException{
        String  idcard   =  request.getParameter("idcard");
        String [] _arrays =idcard.split(",");
         staffService.deleteStaffByIds(_arrays);
        dataMap.put("status", "success");
        return "json";
    }


    //页面返回数据
    @Action(value="findStaffListByPage",results={@Result(name="json",type="json")})
    public String findStaffListByPage(){
        String pageSize = request.getParameter("pageSize");
        String pageNumber =request.getParameter("pageNumber");String searchText =request.getParameter("searchText");
        page.setPageSize(Integer.parseInt(pageSize));
        page.setPageNumber(Integer.parseInt(pageNumber));
        page = staffService.getStaffListByPage(page,searchText);
        return "json";
    }
    //添加员工
    @Action(value="addStaff",results={@Result(name="json",type="json")})
    public String addStaff() throws IOException{
        Staff newStaff = new  Staff();
        String staffName =request.getParameter("staffName");
        String staffPosition = request.getParameter("staffPosition");
        String staffAddress = request.getParameter("staffAddress");
        String phone = request.getParameter("phone");
        newStaff.setStaffName(staffName);
        newStaff.setPhone(phone);
        newStaff.setStaffPosition(staffPosition);
        newStaff.setStaffAddress(staffAddress);
        newStaff.setCreateDate(new Date());
        systemRepository.save(newStaff);
        dataMap.put("status", "success");
        return "json";
    }



    //修改
    @Action(value="editStaffInfo",results={@Result(name="json",type="json")})
    public String editStaffInfo() throws IOException{
        int  staffId   =  Integer.parseInt(request.getParameter("staffId"));
        String staffName =request.getParameter("staffName");
        String staffPosition =request.getParameter("staffPosition");
        String staffAddress = request.getParameter("staffAddress");
        String phone =request.getParameter("phone");
        Staff newStaff = systemRepository.get(Staff.class, staffId);
        newStaff.setStaffName(staffName);
        newStaff.setStaffAddress(staffAddress);
        newStaff.setStaffPosition(staffPosition);
        newStaff.setPhone(phone);
        systemRepository.update(newStaff);
        dataMap.put("status", "success");
        return "json";
    }
}
