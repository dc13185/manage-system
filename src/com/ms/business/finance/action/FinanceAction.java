package com.ms.business.finance.action;

import com.ms.business.finance.service.FinanceService;
import com.ms.business.store.entity.Store;
import com.ms.system.entity.SystemUser;
import com.ms.system.hibernate.base.SystemRepository;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.Const;
import com.ms.system.util.DateUtil;
import com.ms.system.util.RoleUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: dong.chao
 * @create: 2019-03-22 20:46
 * @description: 财务与金额统计
 **/


@Namespace("/financeAction")
@ParentPackage("json-default")
@Controller
public class FinanceAction extends SuperAction {

    @Autowired
    private FinanceService financeService;
    @Autowired
    private SystemRepository systemRepository;

    private Map<Object, Object> dataMap = new HashMap<Object, Object>();

    public Map<Object, Object> getDataMap() { return dataMap; }

    private String menu_url = "/financeAction/toFinanceList";

    @Action(value="toFinanceList",results={@Result(name="financeList",location=ROUTE+"business/financeAction/financeList.jsp",type="dispatcher"),
            @Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher")})
    public String toFinanceList(){
        if(RoleUtil.hasMenu(menu_url)){
            return "financeList";
        }
        return "noRole";
    }

    /** 
    * @Description: 根据日期统计所有店铺销售额 
    * @Param: [] 
    * @return: java.lang.String 
    * @Author: dong.chao
    * @Date: 2019/3/23 
    */ 
    @Action(value="statisticalData",results={@Result(name="json",type="json")})
    public String statisticalData(){
        Session session = SecurityUtils.getSubject().getSession();
        SystemUser user = (SystemUser) session.getAttribute(Const.SESSION_USER);
        String dataRange = request.getParameter("dataRange");
        String startDate;
        String endDate;
        if(StringUtils.isNotBlank(dataRange)){
            startDate = dataRange.substring(0,10);
            endDate = dataRange.substring(12);
        }else{
            startDate = DateUtil.getMonth();
            endDate = DateUtil.getAfterMonthDate(1);
        }
        List<Object> totalSum;
        if(StringUtils.isBlank(user.getTenant_id())){
            totalSum = financeService.queryStatisticalData(startDate,endDate);
            dataMap.put("totalSum",totalSum);
        }else{
            totalSum = financeService.queryDayDatasById(startDate,endDate,user.getTenant_id());
            dataMap.put("totalSum",totalSum);
        }
        return "json";
    }





}
