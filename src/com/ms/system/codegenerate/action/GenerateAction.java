package com.ms.system.codegenerate.action;

import com.ms.system.codegenerate.bean.TemplateBean;
import com.ms.system.codegenerate.service.CodeGenerateService;
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
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: dong.chaogenerateAction
 * @create: 2019-03-21 21:25
 * @description: 代码生成策略
 **/

@Namespace("/generateAction")
@ParentPackage("json-default")
@Controller
public class GenerateAction extends SuperAction {

    @Autowired
    private CodeGenerateService codeGenerateService;

    private Map<Object, Object> dataMap =  new HashMap<Object, Object>();

    public Map<Object, Object> getDataMap() {
        return dataMap;
    }

    private String menu_url = "/generateAction/toGenerateList";

    @Action(value="toGenerateList",results={@Result(name="generateList",location=ROUTE+"system/generateAction/toGenerateAction.jsp",type="dispatcher"),
            @Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher")})
    public String toUserList(){
        //权限菜单
        if(RoleUtil.hasMenu(menu_url)){
            return "generateList";  //;
        }else{
            return "noRole"; // ;
        }
    }


    /** 
    * @Description: 生成代码
    * @Param: [] 
    * @return: java.lang.String 
    * @Author: dong.chao
    * @Date: 2019/3/22 
    */ 
    @Action(value="generateCode",results={@Result(name="json",type="json")})
    public String generateCode() throws IOException {

        try {
            String srcCodePath = request.getParameter("srcCodePath");
            srcCodePath = srcCodePath.replaceAll("\\\\","\\\\\\\\");
            String jspCodePath = request.getParameter("jspCodePath");
            jspCodePath = jspCodePath.replaceAll("\\\\","\\\\\\\\");
            String theme = request.getParameter("theme");
            String entityName = request.getParameter("entityName");
            String type = request.getParameter("type");

            String  columArrayStr   =  request.getParameter("columArrays");
            String  dbColumArrayStr  =  request.getParameter("dbColumArrays");
            String  remarkStr   =  request.getParameter("remarks");

            List columArrays = Arrays.asList(columArrayStr.split(","));
            List dbColumArrays = Arrays.asList(dbColumArrayStr.split(","));
            List remarks = Arrays.asList(remarkStr.split(","));

            TemplateBean templateBean = new TemplateBean();
            templateBean.setCodePath(srcCodePath);
            templateBean.setJspPath(jspCodePath);
            templateBean.setTheme(theme);
            templateBean.setEntityName(entityName);
            templateBean.setColumns(columArrays);
            templateBean.setDbColumns(dbColumArrays);
            templateBean.setRemarks(remarks);
            templateBean.setType(type);
            templateBean.setPackageName(entityName.toLowerCase());

            codeGenerateService.generateCode(templateBean);
            dataMap.put("status","success");

        }catch (Exception e){
            dataMap.put("fail","fail");
        }
        return "json";
    }


}
