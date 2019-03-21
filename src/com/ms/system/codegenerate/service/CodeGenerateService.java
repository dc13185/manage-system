package com.ms.system.codegenerate.service;

import com.ms.system.codegenerate.bean.TemplateBean;
import com.ms.system.util.FreeMarkerTemplateUtils;
import freemarker.template.Template;
import org.apache.commons.compress.utils.Lists;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: dong.chao
 * @create: 2019-03-20 16:50
 * @description: 生成代码逻辑
 **/
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



    public void generateFileByTemplate(final String templateName, File file, Map<String, Object> dataMap) throws Exception {
        Template template = FreeMarkerTemplateUtils.getTemplate(templateName);
        FileOutputStream fos = new FileOutputStream(file);
        Writer out = new BufferedWriter(new OutputStreamWriter(fos, "utf-8"), 10240);
        template.process(dataMap, out);
    }

    public static void main(String[] args) throws Exception {
        TemplateBean templateBean = new TemplateBean();
        templateBean.setCodePath("F:\\eclipse_repository\\ManagSystem\\src\\com\\ms");
        templateBean.setType("business");
        templateBean.setPackageName("test");
        templateBean.setEntityName("Test");
        List<String> colums = Lists.newArrayList();
        colums.add("name");
        colums.add("age");
        templateBean.setColumns(colums);
        List<String> dbColums = Lists.newArrayList();
        dbColums.add("db_name");
        dbColums.add("db_age");
        templateBean.setDbColumns(dbColums);

        CodeGenerateService codeGenerateService = new CodeGenerateService();
        codeGenerateService.generateActionFile(templateBean);
        codeGenerateService.generateEntityFile(templateBean);
    }


}
