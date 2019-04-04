package com.ms.business.staff.service;

import com.ms.business.staff.entity.Staff;
import com.ms.business.store.entity.Store;
import com.ms.system.hibernate.base.SystemRepository;
import com.ms.system.hibernate.page.PageModel;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: manag_system
 * @description:
 * @author: dong.chao
 * @create: 2019-03-19 14:00
 **/
@Service
public class StaffService {

    @Autowired
    private SystemRepository systemRepository;

    /** 
    * @Description: 返回员工集合 
    * @Param: [page, searchText] 
    * @return: void 
    * @Author: dong.chao
    * @Date: 2019/3/19 
    */ 
    public PageModel<Staff> getStaffListByPage(PageModel<Staff> page, String searchText,String storeId){
        StringBuilder sql = new StringBuilder(" from Staff as bs where 1=1");
        if(StringUtils.isNotBlank(searchText)){
            sql.append(" and  bs.staffName like '%").append(searchText).append("%' ");
        }
        if(StringUtils.isNotBlank(storeId)){
            sql.append(" and  bs.storeId = '").append(storeId).append("'");
        }
        page = systemRepository.queryByPage(sql.toString(),page);
        return page;
    }

    public void deleteStaffByIds(String[] _arrays) {
        if(_arrays.length>0){
            String sql="delete from business_staff where staff_id in";
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
