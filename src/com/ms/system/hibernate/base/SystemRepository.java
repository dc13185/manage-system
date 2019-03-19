package com.ms.system.hibernate.base;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ms.system.entity.Menu;
import com.ms.system.hibernate.page.PageModel;


@Repository
@Transactional
public class SystemRepository {
	@Autowired
	protected SessionFactory sessionFactory;

	/** 取得当前Session */
	protected Session getSession(){
		return this.sessionFactory.getCurrentSession();
	}
	
	
	/**
	 * 立刻获取数据对象
	 * @param clazz
	 * @param id
	 * @return
	 */
	public <T> T get(Class clazz,Serializable id) {
		return (T)getSession().get(clazz, id);
	}
	
	/**
	 * 延时加载
	 * @param clazz
	 * @param id
	 * @return
	 */
	public <T> T load(Class clazz,Serializable id) {
		return (T)getSession().load(clazz, id);
	}
	
	/**
	 * 查询Class表所有数�?
	 * @param clazz
	 * @return
	 */
	public <T> List<T> findAll(Class clazz) {
		StringBuffer buf=new StringBuffer();
		buf.append("select t from ");
		buf.append(clazz.getSimpleName()+" t ");
		Query query = getSession().createQuery(buf.toString());
		return  query.list();
	}
	
	/**
	 * 通过hql查询数据（集合）
	 * @param hql
	 * @return
	 */
	public <T> List<T> queryByHql(String hql) {
		return queryByHql(hql,new HashMap());
	}
	
	public <T> List<T> queryByHql(String hql,Map<?,?> map) {
		Query query = getSession().createQuery(hql);
		query.setProperties(map);
		return  query.list();
	}
	
	/**
	 * 通过hql查询数据(单个)
	 * @param hql
	 * @return
	 */
	public <T> T queryUniqueByHql(String hql) {
		return  queryUniqueByHql(hql,new HashMap());
	}

	public <T> T queryUniqueByHql(String hql,Map<?,?> map) {
		Query query = getSession().createQuery(hql);
		query.setProperties(map);
		return  (T)query.uniqueResult();
	}

	/**
	 * 通过hql查询类似select id as id,name as name from A
	 * 返回Map
	 */
	public List<Map> queryMapWithHql(String hql) {
		return queryMapWithSql(hql,new HashMap());
	}
	
	public  List<Map> queryMapWithHql(String hql,Map<?,?> map) {
		Query query = getSession().createQuery(hql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		query.setProperties(map);
		return query.list();
	}
	
	/**
	 * 通过sql查询数据（集合）
	 * @param hql
	 * @return
	 */
	public <T> List<T> queryBySql(String sql) {
		return queryBySql(sql,new HashMap());
	}
	
	public <T> List<T> queryBySql(String sql,Map<?,?> map) {
		Query query = getSession().createSQLQuery(sql);
		query.setProperties(map);
		return  query.list();
	}
	
	/**
	 * 通过sql查询类似select id ,name  from t_a
	 * 返回Map
	 */
	public List<Map> queryMapWithSql(String sql) {
		return queryMapWithSql(sql,new HashMap());
	}
	
	public  List<Map> queryMapWithSql(String sql,Map<?,?> map) {
		Query query = getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		query.setProperties(map);
		return query.list();
	}
	
	/**
	 * 通过sql查询数据(单个)
	 * @param hql
	 * @return
	 */
	public <T> T queryUniqueBySql(String sql) {
		return  queryUniqueBySql(sql,new HashMap());
	}

	public <T> T queryUniqueBySql(String sql,Map<?,?> map) {
		Query query = getSession().createSQLQuery(sql);
		query.setProperties(map);
		return  (T)query.uniqueResult();
	}
	
	
	
	//----------------------------分页查询---------------------------------
	public <T> PageModel<T> queryByPage(String hql,PageModel<T> pageModel){
		return queryByPage(hql,new HashMap(), pageModel);
	}
	
	public <T> PageModel<T> queryByPage(String hql,Map<?,?> map,PageModel<T> pageModel){
		return queryByPage(hql, map, pageModel,false);
	}
	
	/**
	 * 
	 * @param hql
	 * @param map
	 * @param pageModel
	 * @param autoFix 当页数大于最大页数时，自动修正为�?后一�?
	 * @return
	 */
	public <T> PageModel<T> queryByPage(String hql,Map<?,?> map,PageModel<T> pageModel,boolean autoFix){
		return queryByPage(hql, map, pageModel, autoFix, false);
	}
	
	public <T> PageModel<T> queryByPage(String hql,Map<?,?> map,PageModel<T> pageModel,boolean autoFix,boolean isGroupBy){
		Query query;
		if(pageModel.getTotal()<0){
			StringBuffer buf=new StringBuffer();
			buf.append("select count(*)  ");
			buf.append(hql.substring(hql.indexOf("from")));
			query=getSession().createQuery(buf.toString());
			query.setProperties(map);
			
			int firstFrom=hql.indexOf("from");
			if(isGroupBy){
				pageModel.setTotal(query.list().size());
			}else{
				pageModel.setTotal((Long)query.uniqueResult());
			}
			
			
		}
		if(autoFix){//自动修正页数
			if(pageModel.getPageNumber()>pageModel.getPageCount()){
				pageModel.setPageNumber(pageModel.getPageCount());
			}
		}
		query=getSession().createQuery(hql);
		query.setProperties(map);
		query.setFirstResult((pageModel.getPageNumber()-1)*pageModel.getPageSize());
		query.setMaxResults(pageModel.getPageSize());
		pageModel.setRows(query.list());
		return pageModel;
	}
	//--------------------------------------------------------------------
	
	
	
	
	
	//----------------------------sql分页查询---------------------------------
	public <T> PageModel<T> querySqlByPage(String sql,PageModel<T> pageModel,int total){
		return querySqlByPage(sql,new HashMap(), pageModel,total);
	}
	
	public <T> PageModel<T> querySqlByPage(String sql,Map<?,?> map,PageModel<T> pageModel,int total){
		return querySqlByPage(sql, map, pageModel,false, total);
	}
	
	/**
	 * 
	 * @param hql
	 * @param map
	 * @param pageModel
	 * @param autoFix 当页数大于最大页数时，自动修正为�?后一�?
	 * @return
	 */
	public <T> PageModel<T> querySqlByPage(String sql,Map<?,?> map,PageModel<T> pageModel,boolean autoFix,int total){
		return querySqlByPage(sql, map, pageModel, autoFix, false,total);
	}
	
	public <T> PageModel<T> querySqlByPage(String sql,Map<?,?> map,PageModel<T> pageModel,boolean autoFix,boolean isGroupBy,int total){
		Query query;
		if(pageModel.getTotal()<0 && total<=0){
			StringBuffer buf=new StringBuffer();
			buf.append("select count(1)  ");
			if(isGroupBy){
				buf.append(" from ( ");
				buf.append(sql);
				buf.append(" ) ");
				query=getSession().createSQLQuery(buf.toString());
				query.setProperties(map);
				pageModel.setTotal(((BigInteger)query.uniqueResult()).longValue());
			}else{
				buf.append(sql.substring(sql.indexOf("from")));
				query=getSession().createSQLQuery(buf.toString());
				query.setProperties(map);
				pageModel.setTotal(((BigInteger)query.uniqueResult()).longValue());
			}
		}else if(total>0){
			pageModel.setTotal(total);
		}
		if(autoFix){//自动修正页数
			if(pageModel.getPageNumber()>pageModel.getPageCount()){
				pageModel.setPageNumber(pageModel.getPageCount());
			}
		}
		query=getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);;
		query.setProperties(map);
		query.setFirstResult((pageModel.getPageNumber()-1)*pageModel.getPageSize());
		query.setMaxResults(pageModel.getPageSize());
		pageModel.setRows(query.list());
		return pageModel;
	}
	//--------------------------------------------------------------------
	
	
	/**
	 * 保存
	 * @param entity
	 * @return
	 */
	public <T> T save(T entity){
		getSession().save(entity);
		return entity;
	}
	
	/**
	 * 保存
	 * @param entity
	 * @return
	 */
	public <T> T saveOrUpdate(T entity){
		getSession().saveOrUpdate(entity);
		getSession().flush();
		return entity;
	}
	
	/**
	 * 保存并熟刷新缓存
	 * @param entity
	 * @return
	 */
	public <T> T saveAndFlush(T entity){
		save(entity);
		getSession().flush();
		return entity;
	}
	
	
	/**
	 * 删除
	 * @param entity
	 * @return
	 */
	public <T> void delete(T entity) {
		getSession().delete(entity);
	}
	
	
	/**
	 * 删除根据Class和id删除
	 * @param entity
	 * @return
	 */
	public <T> void delete(Class clazz,Serializable id) {
		getSession().delete(getSession().load(clazz, id));
	}
	
	/**
	 * 更新数据
	 * @param entity
	 * @return
	 */
	public <T> T update(T entity) {
		getSession().update(entity);
		getSession().merge(entity);
		return entity;
	}
	
	public int updateByHql(String hql) {
		return updateByHql(hql,new HashMap());
	}
	
	public int updateByHql(String hql,Map<?,?> map) {
		Query query = getSession().createQuery(hql);
		query.setProperties(map);
		return query.executeUpdate();
	}
	
	
	public int updateBySql(String sql) {
		return updateBySql(sql,new HashMap());
	}
	
	public int updateBySql(String sql,Map<?,?> map) {
		Query query = getSession().createSQLQuery(sql);
		query.setProperties(map);
		return  query.executeUpdate();
	}


	
}
