
package com.ms.system.hibernate.page;

import java.io.Serializable;
import java.util.List;

/**
 * 存放分页数据的模�?
 */
public class PageModel<T> implements Serializable{

	/** 当前页号 */
	private int pageNumber = 1;
	/** 每页显示的记录条数 */
	private int pageSize = 10;
	/** 总记录数 */
	private long total=-1;
	/** 存放分页数据的集合 */
	private List<T> rows;

	/** 总页数根据pageSize和recordCount计算得出 */
	private int pageCount;

	public PageModel() {
	}

	public PageModel(int pageNumber, int pageSize) {
		this.pageNumber = pageNumber;
		this.pageSize = pageSize;
	}

	

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}



	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public int getPageCount() {
		if (this.getTotal() <= 0) {
			return 0;
		} else {
			pageCount = (int) ((total + pageSize - 1) / pageSize);
			return pageCount;
		}
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	
}