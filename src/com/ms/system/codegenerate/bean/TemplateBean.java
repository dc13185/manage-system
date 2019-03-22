package com.ms.system.codegenerate.bean;

import java.util.List;

/**
 * @author: dong.chao
 * @create: 2019-03-20 15:51
 * @description: 模板实体对象
 **/
public class TemplateBean {

    private String theme;
    //代码输出地址
    private String codePath;
    //jsp输出地址
    private String jspPath;
    //包名称   如com.ms.system.menu.action 中 menu 为包名称
    private String packageName;
    //类型 只有:business 和 system 两种类型
    private String type;
    //entity名称
    private String entityName;
    //字段集合
    private List<String> columns;
    //sql字段集合
    private List<String> dbColumns;
    //
    private List<String> remarks;

    public String getCodePath() {
        return codePath;
    }

    public void setCodePath(String codePath) {
        this.codePath = codePath;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public List<String> getColumns() {
        return columns;
    }

    public void setColumns(List<String> columns) {
        this.columns = columns;
    }

    public List<String> getDbColumns() {
        return dbColumns;
    }

    public void setDbColumns(List<String> dbColumns) {
        this.dbColumns = dbColumns;
    }

    public List<String> getRemarks() {
        return remarks;
    }

    public void setRemarks(List<String> remarks) {
        this.remarks = remarks;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getJspPath() {
        return jspPath;
    }

    public void setJspPath(String jspPath) {
        this.jspPath = jspPath;
    }
}
