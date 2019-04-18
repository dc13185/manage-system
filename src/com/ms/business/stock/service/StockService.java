package com.ms.business.stock.service;

import com.ms.business.stock.entity.Stock;
import com.ms.system.hibernate.base.SystemRepository;
import com.ms.system.hibernate.page.PageModel;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class StockService {

    @Autowired
    private SystemRepository systemRepository;



    public PageModel<Stock> getStockListByPage(PageModel<Stock> page, String searchText){
        StringBuilder hql = new StringBuilder(" from Stock as s");
        if(StringUtils.isNotBlank(searchText)){
            hql.append("where s.StockName like '%").append(searchText).append("%' ");
        }
        page = systemRepository.queryByPage(hql.toString(),page);
        return page;
    }

    public void deleteStockByIds(String[] _arrays) {
        if(_arrays.length>0){
            String sql="delete from business_stock where stock_id in";
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
