package com.ms.system.codegenerate.service;

import com.ms.system.codegenerate.bean.TemplateBean;
import com.ms.system.util.FreeMarkerTemplateUtils;
import freemarker.template.Template;
import org.apache.commons.compress.utils.Lists;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: dong.chao
 * @create: 2019-03-20 16:50
 * @description: 生成代码逻辑
 **/

@Service
public class CodeGenerateService {

    private String pagePath;

    private File pageFile;


    private void generateActionFile(TemplateBean templateBean) throws Exception {
        pagePath = templateBean.getCodePath() +"\\"+templateBean.getType()+"\\"+templateBean.getPackageName()+ "\\action\\";
        pageFile = new File(pagePath);
        if (!pageFile.exists()) {
            pageFile.mkdirs();
        }
        String suffix = "Action.java";
        String path = pagePath + templateBean.getEntityName() + suffix;
        String templateName = "Action.ftl";
        File mapperFile = new File(path);
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("template",templateBean);
        generateFileByTemplate(templateName, mapperFile, dataMap);
    }

    private void generateEntityFile(TemplateBean templateBean) throws Exception {
        pagePath = templateBean.getCodePath() +"\\"+templateBean.getType()+"\\"+templateBean.getPackageName()+ "\\entity\\";
        pageFile = new File(pagePath);
        if (!pageFile.exists()) {
            pageFile.mkdirs();
        }
        String suffix = ".java";
        String path = pagePath + templateBean.getEntityName() + suffix;
        String templateName = "Entity.ftl";
        File mapperFile = new File(path);
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("template",templateBean);
        generateFileByTemplate(templateName, mapperFile, dataMap);
    }

    private void generateServiceile(TemplateBean templateBean) throws Exception {
        pagePath = templateBean.getCodePath() +"\\"+templateBean.getType()+"\\"+templateBean.getPackageName()+ "\\service\\";
        pageFile = new File(pagePath);
        if (!pageFile.exists()) {
            pageFile.mkdirs();
        }
        String suffix = "Service.java";
        String path = pagePath + templateBean.getEntityName() + suffix;
        String templateName = "Service.ftl";
        File mapperFile = new File(path);
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("template",templateBean);
        generateFileByTemplate(templateName, mapperFile, dataMap);
    }


    private void generateJsp(TemplateBean templateBean) throws Exception {
        pagePath = templateBean.getJspPath() +"\\"+templateBean.getType()+"\\"+templateBean.getPackageName()+ "Action\\";
        pageFile = new File(pagePath);
        if (!pageFile.exists()) {
            pageFile.mkdirs();
        }
        String suffix = "List.jsp";
        String path = pagePath + templateBean.getPackageName() + suffix;
        String templateName = "jsp.ftl";
        File mapperFile = new File(path);
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("template",templateBean);
        generateFileByTemplate(templateName, mapperFile, dataMap);
    }


    private void generateFileByTemplate(final String templateName, File file, Map<String, Object> dataMap) throws Exception {
        Template template = FreeMarkerTemplateUtils.getTemplate(templateName);
        FileOutputStream fos = new FileOutputStream(file);
        Writer out = new BufferedWriter(new OutputStreamWriter(fos, "utf-8"), 10240);
        template.process(dataMap, out);
    }

    public void generateCode(TemplateBean templateBean) throws Exception {
        this.generateActionFile(templateBean);
        this.generateEntityFile(templateBean);
        this.generateServiceile(templateBean);
        this.generateJsp(templateBean);
    }


    public static void main(String[] args) throws Exception {
        TemplateBean templateBean = new TemplateBean();
        templateBean.setCodePath("F:\\eclipse_repository\\ManagSystem\\src\\com\\ms");
        templateBean.setJspPath("F:\\eclipse_repository\\ManagSystem\\WebContent\\WEB-INF\\jsp");
        templateBean.setType("business");
        templateBean.setPackageName("test");
        templateBean.setEntityName("Test");
        templateBean.setTheme("测试");
        List<String> colums = Lists.newArrayList();
        colums.add("id");
        colums.add("name");
        colums.add("age");
        templateBean.setColumns(colums);
        List<String> dbColums = Lists.newArrayList();
        dbColums.add("db_id");
        dbColums.add("db_name");
        dbColums.add("db_age");
        templateBean.setDbColumns(dbColums);
        List<String> remarks = Lists.newArrayList();
        remarks.add("id");
        remarks.add("名字");
        remarks.add("年龄");
        templateBean.setRemarks(remarks);

        CodeGenerateService codeGenerateService = new CodeGenerateService();

    }


}
