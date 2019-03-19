package com.ms.business.staff.action;

import com.ms.business.staff.entity.Staff;
import com.ms.business.staff.service.StaffService;
import com.ms.business.store.entity.Store;
import com.ms.business.store.entity.StoreAdminType;
import com.ms.system.entity.SystemUser;
import com.ms.system.hibernate.page.PageModel;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.RoleUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.List;

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

    @Autowired
    private StaffService staffService;

    //员工类
    private PageModel<Staff> page= new PageModel<>();

    public PageModel<Staff> getPage() {
        return page;
    }

    public void setPage(PageModel<Staff> page) {
        this.page = page;
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


    //页面返回数据
    @Action(value="findStoreListByPage",results={@Result(name="json",type="json")})
    public String findUsetListByPage() throws IOException {
        String pageSize = request.getParameter("pageSize");
        String pageNumber =request.getParameter("pageNumber");
        String searchText =request.getParameter("searchText");
        page.setPageSize(Integer.parseInt(pageSize));
        page.setPageNumber(Integer.parseInt(pageNumber));

        staffService.getStaffListByPage(page,searchText);

        return "json";
    }
}
