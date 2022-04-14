package com.model2.mvc.service.product.vo;

import java.sql.Date;

public class ProductVO {
	
	private String fileName; //��ǰ �̹������� �̸�
	private String manuDate; //��ǰ ���� ����
	private int price; // ��ǰ ����
	private String prodDetail; // ��ǰ �� ����
	private String prodName; //��ǰ��
	private int prodNo; //��ǰ ��ȣ
	private Date regDate; //��ǰ ��� ����
	private String proTranCode="�Ǹ���"; // ���� ���Ż��� �ڵ� ??
	
	public ProductVO(){
	}
	
	public String getProTranCode() {
		return proTranCode;
	}
	public void setProTranCode(String proTranCode) {
		this.proTranCode = proTranCode;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getManuDate() {
		return manuDate;
	}
	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProdDetail() {
		return prodDetail;
	}
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public java.util.Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date date) {
		this.regDate =  date;
	}

	// Override
	public String toString() {
		return "ProductVO : [fileName]" + fileName
				+ "[manuDate]" + manuDate+ "[price]" + price + "[prodDetail]" + prodDetail
				+ "[prodName]" + prodName + "[prodNo]" + prodNo;
	}	
}