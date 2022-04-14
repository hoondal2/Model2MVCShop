package com.model2.mvc.framework;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.common.util.HttpUtil;


public class ActionServlet extends HttpServlet {
	
	private RequestMapping mapper;

	@Override
	public void init() throws ServletException {
		super.init();
		String resources=getServletConfig().getInitParameter("resources");
		mapper=RequestMapping.getInstance(resources); //properties�� ������� mapper�� ����.
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
													throws ServletException, IOException {
		
		String url = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = url.substring(contextPath.length());
		System.out.println(path); // '/xx.do'
		
		try{
			Action action = mapper.getAction(path); //������ ���� path�̿�
			System.out.println(action);
			action.setServletContext(getServletContext()); // xxxAction ����, action = xxxAction Ŭ����
			
			String resultPage=action.execute(request, response); // ȭ�� ��ȯ ex)loginAction���� id,pwd�� vo�� ������, "redirect:/index.jsp"
			String result=resultPage.substring(resultPage.indexOf(":")+1); // "/index.jsp"
			System.out.println(result);
			
			if(resultPage.startsWith("forward:"))
				HttpUtil.forward(request, response, result); // getRequsetDispatcher�� �ʿ��� result(path)
			else
				HttpUtil.redirect(response, result);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
}