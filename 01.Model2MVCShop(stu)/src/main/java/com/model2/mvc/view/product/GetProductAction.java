package com.model2.mvc.view.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.product.vo.ProductVO;


public class GetProductAction extends Action {
	public String execute(	HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// prodName�� ���̸� getParameter("prodName")�ؾ���
		String prodName=request.getParameter("prodName");
		
		if("".equals(prodName) || prodName==null) { // null�� equals�޼��� ȣ�� �Ұ� !!!
			int prodNo=Integer.parseInt(request.getParameter("prodNo"));
			System.out.println(prodNo);
			ProductService service=new ProductServiceImpl();
			ProductVO vo=service.getProduct(prodNo);
			System.out.println(vo);
			request.setAttribute("vo", vo);
		}else{
			System.out.println(prodName);
			ProductService service=new ProductServiceImpl();
			ProductVO vo=service.getProduct(prodName);
			System.out.println(vo); //�ΰ����� ...
			request.setAttribute("vo", vo);
		}
		
		return "forward:/product/getProduct.jsp";
}
}
