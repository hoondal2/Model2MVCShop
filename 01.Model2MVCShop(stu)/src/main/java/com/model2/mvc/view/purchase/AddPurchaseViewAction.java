package com.model2.mvc.view.purchase;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.product.vo.ProductVO;

public class AddPurchaseViewAction extends Action {
	
	public String execute(	HttpServletRequest request,
							HttpServletResponse response) throws Exception {
	
	//prodNo���� �ʿ� -> sql�����ؼ� �����;� �Ѵ�
	System.out.println("addPurchaseViewAction���� ���� prodNo�� �� : " +Integer.parseInt(request.getParameter("prodNo")));
	int prodNo=Integer.parseInt(request.getParameter("prodNo")); //prodNo�� ���� ��?? Ȯ��
	
	ProductService service=new ProductServiceImpl();
	
	ProductVO vo = service.getProduct(prodNo);
	request.setAttribute("vo", vo);
	prodNo = vo.getProdNo();
	System.out.println("addPurchaseViewAction���� �ٲ� prodNo�� �� : " +Integer.parseInt(request.getParameter("prodNo")));

	return "forward:/purchase/addPurchaseView.jsp";
	
	}	
}
