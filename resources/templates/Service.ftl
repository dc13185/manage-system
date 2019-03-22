package com.ms.${template.type}.${template.packageName}.service;

import com.ms.${template.type}.${template.packageName}.entity.${template.entityName};
import com.ms.system.hibernate.base.SystemRepository;
import com.ms.system.hibernate.page.PageModel;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ${template.entityName}Service {

    @Autowired
    private SystemRepository systemRepository;



    public PageModel<${template.entityName}> get${template.entityName}ListByPage(PageModel<${template.entityName}> page, String searchText){
        StringBuilder hql = new StringBuilder(" from ${template.entityName} as s");
        if(StringUtils.isNotBlank(searchText)){
            hql.append("where s.${template.columns[1]} like '%").append(searchText).append("%' ");
        }
        page = systemRepository.queryByPage(hql.toString(),page);
        return page;
    }

    public void delete${template.entityName}ByIds(String[] _arrays) {
        if(_arrays.length>0){
            String sql="delete from ${template.type}_${template.packageName} where ${template.dbColumns[0]} in";
            for (int i = 0; i < _arrays.length; i++) {
                if(i==0){
                    sql+="('"+_arrays[i]+"'";
                }else{
                    sql+=",'"+_arrays[i]+"'";
                }
            }
            sql+=")";
             systemRepository.updateBySql(sql);
        }
    }

}
