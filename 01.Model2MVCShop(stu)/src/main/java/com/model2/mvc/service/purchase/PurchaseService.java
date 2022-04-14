package com.model2.mvc.service.purchase;

import java.util.HashMap;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.service.purchase.vo.PurchaseVO;

public interface PurchaseService {
	
	public void addPurchase(PurchaseVO purchaseVO) throws Exception; // ���� ���
	
	public PurchaseVO getPurchase(int tranNo) throws Exception; // �������� ����ȸ
	
	public HashMap<String, Object> getPurchaseList(SearchVO searchVO, String tranCode) throws Exception; // ���� ��� ����
	
	public HashMap<String, Object> getSaleList(SearchVO searchVO) throws Exception; // �Ǹ� ��� ����
	
	public PurchaseVO updatePurchase(PurchaseVO purchaseVO) throws Exception; // ���� ���� ����
	
	public void updateTranCode(PurchaseVO purchaseVO) throws Exception; // ���� ���� ����

}
