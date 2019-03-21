package com.ms.${template.type}.${template.packageName}.service;

import com.ms.${template.type}.${template.packageName}.entity.${template.entityName};
import com.ms.system.hibernate.base.SystemRepository;
import com.ms.system.hibernate.page.PageModel;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ${template.packageName}Service {

    @Autowired
    private SystemRepository systemRepository;



    public PageModel<${template.packageName}> getStaffListByPage(PageModel<${template.packageName}> page, String searchText){
        StringBuilder hql = new StringBuilder(" from ${template.packageName} as s");
        if(StringUtils.isNotBlank(searchText)){
            sql.append("where s.${template.columns[1]} like '%").append(searchText).append("%' ");
        }
        page = systemRepository.queryByPage(hql.toString(),page);
        return page;
    }

    public void delete${template.packageName}ByIds(String[] _arrays) {
        if(_arrays.length>0){
            String sql="delete from ${template.type}_${template.packageName} where ${template.columns[0]} in";
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
