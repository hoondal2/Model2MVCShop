package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.product.vo.ProductVO;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.purchase.vo.PurchaseVO;

public class UpdateTranCodeByProdAction extends Action {
	
	public String execute(	HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// tranCode�� ���õ� purchase��ü�� �޾ƿͼ� proTranCode ����
		// getProduct�� product��ü �������� �̶� ���ڰ����� purchaseVO�� prodNo�� �������� prodNo�� �ش�
//		PurchaseVO purchaseVO = (PurchaseVO)request.getAttribute("purchase");
//		System.out.println(purchaseVO);
//		ProductService pdService=new ProductServiceImpl();
//		//int prodNo = (purchaseVO.getPurchaseProd().getProdNo());
//		
//		ProductVO productVO = pdService.getProduct(prodNo);
//		
//		if("aaa".equals(purchaseVO.getTranCode())) {
//			productVO.setProTranCode("���ſϷ�");
//		}else if("bbb".equals(purchaseVO.getTranCode())) {
//			productVO.setProTranCode("�����");
//		}else if("ccc".equals(purchaseVO.getTranCode())) {
//			productVO.setProTranCode("��ۿϷ�");
//		}
		
		return "forward:/listProduct.do?menu=manage";
	}
}
