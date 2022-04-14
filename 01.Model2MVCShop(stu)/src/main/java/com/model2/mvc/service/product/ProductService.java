package com.model2.mvc.service.product;

import java.util.HashMap;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.service.product.vo.ProductVO;


public interface ProductService {
	
	public ProductVO addProduct(ProductVO productVO) throws Exception; // 상품 등록
		
	public ProductVO getProduct(int prodNo) throws Exception; // 상품정보 번호로 조회
	
	public ProductVO getProduct(String ProdName) throws Exception; // 상품정보 이름으로 조회
	
	public HashMap<String, Object> getProductList(SearchVO searchVO) throws Exception; //상품목록 조회
	
	public ProductVO updateProduct(ProductVO productVO) throws Exception; // 상품 정보 수정
		
}