package com.model2.mvc.view.purchase;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.product.vo.ProductVO;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.purchase.vo.PurchaseVO;
import com.model2.mvc.service.user.vo.UserVO;

public class AddPurchaseAction extends Action {
	
	public String execute(	HttpServletRequest request,
							HttpServletResponse response) throws Exception {
		
	// �ٸ� ��� -> getParameter�� prodNo�����ͼ� getProduct �ϱ�, ���⼭ vo����
	
	// ���ǿ��� user ��ü ��������
	HttpSession session = request.getSession();
	UserVO user = (UserVO)session.getAttribute("user");
	
	// param���� product��ü ��������
	ProductService pdService=new ProductServiceImpl();
	ProductVO productVO =pdService.getProduct(Integer.parseInt(request.getParameter("prodNo")));
	
	// PurchaseVO�� �����ϱ�
	PurchaseVO purchaseVO = new PurchaseVO();
	purchaseVO.setPaymentOption(request.getParameter("paymentOption"));
	purchaseVO.setReceiverName(request.getParameter("receiverName"));
	purchaseVO.setReceiverPhone(request.getParameter("receiverPhone"));
	purchaseVO.setDivyAddr(request.getParameter("receiverAddr"));
	purchaseVO.setDivyRequest(request.getParameter("receiverRequest"));
	purchaseVO.setDivyDate(request.getParameter("receiverDate"));
	purchaseVO.setPurchaseProd(productVO);
	purchaseVO.setBuyer(user);
	purchaseVO.setTranCode("aaa");
	
	// tranCode ���� => UpdateTranCodeAction���� ����
	//purchaseVO.setTranCode(request.getParameter("tranCode")); // �ʱⰪ = "aaa" -> �Ǹ���
	//System.out.println(request.getParameter("tranCode"));
	// "aaa" -> proTranCode�� "������" �ݿ� 
	
	PurchaseService pcService=new PurchaseServiceImpl();
	pcService.addPurchase(purchaseVO); // void
	
	//purchaseVO = pcService.getPurchase(tranNo);
	//request.setAttribute("purchaseVO", purchaseVO);
	request.setAttribute("purchase", purchaseVO);
	
	// UpdateTranCodeAction�� �̵�, proTranCode ����
		return "forward:/purchase/addPurchase.jsp";
	}	
}

