package com.ms.business.stock.action;

import com.ms.business.stock.entity.Stock;
import com.ms.system.entity.SystemUser;
import com.ms.system.superAction.SuperAction;
import com.ms.system.util.Const;
import com.ms.system.util.RoleUtil;
import com.ms.business.stock.service.StockService;
import com.ms.system.hibernate.page.PageModel;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Namespace("/stockAction")
@ParentPackage("json-default")
@Controller
public class StockAction extends SuperAction{


	 private String menu_url = "/stockAction/toStockList";

	 @Autowired
	 private StockService stockService;

    private PageModel<Stock> page= new PageModel<>();


	private Map<Object, Object> dataMap = new HashMap<Object, Object>();

	public PageModel<Stock> getPage() { return page; }

	public Map<Object, Object> getDataMap() { return dataMap; }


	@Action(value="toStockList",results={@Result(name="stockList",location=ROUTE+"business/stockAction/stockList.jsp",type="dispatcher"),
			@Result(name="noRole",location=ROUTE+"noRole.jsp",type="dispatcher")})
	 public String toStockList(){
		 if(RoleUtil.hasMenu(menu_url)){
			 return "stockList";
		 }else{
			 return "noRole";
		 }

	 }



	//页面返回数据
	@Action(value="findStockListByPage",results={@Result(name="json",type="json")})
	public String findStaffListByPage(){
		String pageSize = request.getParameter("pageSize");
		String pageNumber =request.getParameter("pageNumber");
		String searchText =request.getParameter("searchText");
		page.setPageSize(Integer.parseInt(pageSize));
		page.setPageNumber(Integer.parseInt(pageNumber));
		page = stockService.getStockListByPage(page,searchText);
		return "json";
	}


	//根据id查询
	 @Action(value="findStockById",results={@Result(name="json",type="json")})
	 public String findStockById(){
		String  StockId = request.getParameter("StockId");
		Stock stock = systemRepository.get(Stock.class, StockId);
		dataMap.put("stock", stock);
		return "json";
	 }






	//新增
	@Action(value="addStock",results={@Result(name="json",type="json")})
	public String addStock(){
		Session session = SecurityUtils.getSubject().getSession();
		SystemUser user = (SystemUser) session.getAttribute(Const.SESSION_USER);
		String StockName =request.getParameter("StockName");
		String StockNumber =request.getParameter("StockNumber");
		Stock stock = new  Stock();
		stock.setStockName(StockName);
		stock.setStockNumber(Double.parseDouble(StockNumber));
		stock.setStordId(user.getTenant_id());
		systemRepository.save(stock);
		dataMap.put("status", "success");
		return "json";
	}


	 //删除
	 @Action(value="deleteStockByIds",results={@Result(name="json",type="json")})
	 public String deleteStockByIds(){
		 String  idcard = request.getParameter("idcard");
		 String [] _arrays = idcard.split(",");
		 stockService.deleteStockByIds(_arrays);
		 dataMap.put("status", "success");
		 return "json";
	 }

	//修改库存
	@Action(value="editStock",results={@Result(name="json",type="json")})
	public String editStock(){
		String StockId =request.getParameter("StockId");
		double pullStockNumber = Double.parseDouble(request.getParameter("pullStockNumber"));
		Stock stock = systemRepository.get(Stock.class, StockId);
		stock.setStockNumber(stock.getStockNumber()+pullStockNumber);
		stock.setStockId(StockId);
		systemRepository.update(stock);
		dataMap.put("status", "success");
		return "json";
	}
}
