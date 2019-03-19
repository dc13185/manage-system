package com.ms.system.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletResponse;
import javax.servlet.ServletResponseWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ms.system.util.Const;

/** 
 * 类名称：SecCodeAction
 * 类描述： 
 * 作者单位： 
 * 联系方式：
 * @version
 */

@Namespace("/secCodeAction")
@ParentPackage("struts-default")
public class SecCodeAction implements ServletResponseAware {


	private HttpServletResponse response;
	

	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response =response;
	}
	

	@Action(value="code")
	public void generate(){
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		String code = drawImg(output);
		
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		session.setAttribute(Const.SESSION_SECURITY_CODE, code);
		
		try {
			ServletOutputStream out = response.getOutputStream();
			output.writeTo(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private String drawImg(ByteArrayOutputStream output){
		String code = "";
		for(int i=0; i<4; i++){
			code += randomChar();
		}
		int width = 70;
		int height = 25;
		BufferedImage bi = new BufferedImage(width,height,BufferedImage.TYPE_3BYTE_BGR);
		Font font = new Font("Times New Roman",Font.PLAIN,20);
		Graphics2D g = bi.createGraphics();
		g.setFont(font);
		Color color = new Color(66,2,82);
		g.setColor(color);
		g.setBackground(new Color(226,226,240));
		g.clearRect(0, 0, width, height);
		FontRenderContext context = g.getFontRenderContext();
		Rectangle2D bounds = font.getStringBounds(code, context);
		double x = (width - bounds.getWidth()) / 2;
		double y = (height - bounds.getHeight()) / 2;
		double ascent = bounds.getY();
		double baseY = y - ascent;
		g.drawString(code, (int)x, (int)baseY);
		g.dispose();
		try {
			ImageIO.write(bi, "jpg", output);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return code;
	}
	
	private char randomChar(){
		Random r = new Random();
		String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
		return s.charAt(r.nextInt(s.length()));
	}


}
