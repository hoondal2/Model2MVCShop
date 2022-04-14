package com.model2.mvc.service.product;

import java.util.HashMap;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.service.product.vo.ProductVO;


public interface ProductService {
	
	public ProductVO addProduct(ProductVO productVO) throws Exception; // ��ǰ ���
		
	public ProductVO getProduct(int prodNo) throws Exception; // ��ǰ���� ��ȣ�� ��ȸ
	
	public ProductVO getProduct(String ProdName) throws Exception; // ��ǰ���� �̸����� ��ȸ
	
	public HashMap<String, Object> getProductList(SearchVO searchVO) throws Exception; //��ǰ��� ��ȸ
	
	public ProductVO updateProduct(ProductVO productVO) throws Exception; // ��ǰ ���� ����
		
}