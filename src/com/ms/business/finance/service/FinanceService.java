package com.ms.business.finance.service;

import com.ms.system.hibernate.base.SystemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: dong.chao
 * @create: 2019-03-22 20:48
 * @description: 财务统计业务类
 **/
@Service
public class FinanceService {

    @Autowired
    private SystemRepository systemRepository;
    
    /** 
    * @Description: 根据日期查总消费额
    * @Param: [stratDate, endDate] 
    * @return: void 
    * @Author: dong.chao
    * @Date: 2019/3/23 
    */ 
    public List<Object> queryStatisticalData(String stratDate, String endDate){
        StringBuilder sql = new StringBuilder("SELECT SUM(o.money) AS totalSum,s.store_name FROM business_order o ")
                .append("LEFT JOIN business_store s ON o.store_id = s.store_id  WHERE  o.cTime > '")
                .append(stratDate)
                .append("' and o.cTime < '").append(endDate)
                .append("' GROUP BY o.store_id");
        // AND s.status=1   是否显示出已经删除了的店铺
        System.out.println(sql.toString());
        List<Object> datas = systemRepository.queryBySql(sql.toString());
        return datas;
    }
    
    
    /** 
    * @Description: 根据一段时间统计出每一天的消费额
    * @Param: [stratDate, endDate] 
    * @return: java.util.List<java.lang.Object> 
    * @Author: dong.chao
    * @Date: 2019/3/23 
    */ 
    public List<Object> queryDayDatasById(String stratDate, String endDate,String userId){
        StringBuilder sql = new StringBuilder(" SELECT SUM(o.`money`), DATE_FORMAT(o.cTime, '%Y-%m-%d') triggerDay FROM business_order o")
                .append(" WHERE o.store_id = '")
                .append(userId)
                .append("' and o.cTime>'")
                .append(stratDate)
                .append("' AND o.cTime<'")
                .append(endDate)
                .append("' GROUP BY triggerDay");
        System.out.println(sql.toString());
        List<Object> datas = systemRepository.queryBySql(sql.toString());
        return datas;
    }
}
