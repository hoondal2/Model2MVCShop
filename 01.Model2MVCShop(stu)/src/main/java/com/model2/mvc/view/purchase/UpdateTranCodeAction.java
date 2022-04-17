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

public class UpdateTranCodeAction extends Action {
	
	@Override
	public String execute(	HttpServletRequest request,
												HttpServletResponse response) throws Exception {
	// Ʈ���ڵ� ������Ʈ �ϴ°�
	// ����ϱ� / ���ǵ��� �� ������ tranCode ��ȭ, dao�޼��� ���� proTranCode ����
	// tranCode�� null�̶��? -> aaa�� ���� �� dao���� vo�� ����
	// tranCode�� null�� �ƴϰ� aaa���? -> bbb�� ������ dao���� vo�� ����
		// dao ���� ������ ...........
		PurchaseService pcService=new PurchaseServiceImpl();
		PurchaseVO purchaseVO =  pcService.getPurchase(Integer.parseInt(request.getParameter("tranNo")));
		System.out.println("purchaseVO ���� : " +purchaseVO);
		
		if(purchaseVO.getTranCode()!=null) { // �� ����
			if("aaa".equals( (purchaseVO.getTranCode()) )){
				purchaseVO.setTranCode("bbb"); // �����
			}else if("bbb".equals( (purchaseVO.getTranCode()) )) {
				purchaseVO.setTranCode("ccc"); // ��ۿϷ�
			}
		}else {	purchaseVO.setTranCode("aaa"); } // ���ſϷ�
		
		System.out.println(" �ٲ� tranCode��????????????????? "+purchaseVO.getTranCode());
		
		//DAO�� tranCode������Ʈ
		pcService.updateTranCode(purchaseVO);
		
		// ������ ��ǰ�� proTranCode�� ����Ǿ�� �Ѵ�. -> dao���� ����
		//ProductVO productVO = (ProductVO)request.getAttribute("productVO");
		//productVO.setProTranCode("�Ǹ���");
		
		request.setAttribute("purchase", purchaseVO);
		if("manage".equals(request.getParameter("menu"))) {
			return "forward:/listProduct.do?menu=manage";
		}
		return "forward:/listPurchase.do";
	}
}
