package com.ms.system.superAction;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ms.system.util.MatcherUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ms.system.hibernate.base.SystemRepository;
import com.ms.system.service.impl.IPService;
import com.ms.system.util.Const;
import com.ms.system.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;


public class SuperAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{
	
	@Autowired
	protected SystemRepository systemRepository;
	
	@Autowired
	protected IPService ipService;

	protected final String ROUTE ="/WEB-INF/jsp/";  //jsp访问路径 
	
	protected HttpServletRequest request;
	
	protected HttpServletResponse response;
	
	protected static ObjectMapper mapper = new ObjectMapper();
	protected static JsonFactory factory = mapper.getJsonFactory();
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
	
	

	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response;
	}
	
	//获取读取图片域名
	protected String getServerImgPath(String imgId,String day,String fileType) throws IOException {
		String serverPath=request.getScheme()+"://"+ipService.getSystemIp()+"/"+Const.READPATHIMG+day+"/"+imgId+fileType;
		return serverPath;
	}
	
	//更改图片路径
	protected String editServerImgPath(String imgServerPath,String fileType) throws IOException {
		return imgServerPath.substring(0,imgServerPath.indexOf("."))+fileType;
	}
	
	protected String getUploadImagePath(String imgId,String day) throws IOException {
		String path = getServerPath()+Const.READPATHIMG+day+"/"+imgId;
		return path.replaceAll("\\\\", "/");
	}
	
	protected String getServerPath() throws IOException {
		String realPath = request.getSession().getServletContext().getRealPath("/");
		realPath = MatcherUtils.getMatcher("[\\s\\S]{1,}\\webapps\\\\",realPath);
		return realPath;
	}
	
	
	protected String getSaveImgPath(String imgId,String day) throws IOException {
		String path = Const.READPATHIMG+day+"\\"+imgId;
		return path.replaceAll("\\\\", "/");
	}
	
	/**将json字符串输出**/
	protected void writeJSON(String json) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json);
	}
	
	/**将对象转成json输出**/
	protected void writeJSON(Object obj) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		JsonGenerator responseJsonGenerator = factory.createJsonGenerator(response.getOutputStream(), JsonEncoding.UTF8);
		responseJsonGenerator.writeObject(obj);
	}
	
	
	



	

}
