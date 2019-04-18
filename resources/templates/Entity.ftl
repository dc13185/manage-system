package com.ms.${template.type}.${template.packageName}.entity;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="${template.type}_${template.packageName}")
public class ${template.entityName} {

    @Id
    @GeneratedValue(generator="${template.packageName}Generator")
    @GenericGenerator(name="${template.packageName}Generator",strategy="uuid")
    @Column(length=125,name = "${template.dbColumns[0]}")
    private String  ${template.columns[0]};

    <#list template.columns as column>
        <#if column_index != 0>
    // ${template.remarks[column_index]} 字段
    @Column(length=125,name = "${template.dbColumns[column_index]}")
    private String ${column};
        </#if>
    </#list>




    <#list template.columns as column>
    public String get${column?cap_first}() {
        return ${column};
    }

    public void set${column?cap_first}(String ${column}) {
        this.${column} = ${column};
    }

    </#list>


}
