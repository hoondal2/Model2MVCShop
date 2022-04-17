package com.model2.mvc.view.product;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.product.vo.ProductVO;

public class AddProductAction extends Action {
	@Override
	public String execute(	HttpServletRequest request,
												HttpServletResponse response) throws Exception {
		////////////////////////// ���� ���ε� ///////////////////////////////////
		
		if(FileUpload.isMultipartContent(request)) {
			String temDir =
			"C:\\workspace\\01.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles\\";
			//String temDir2 = "/uploadFiles/";
			
			DiskFileUpload fileUpload = new DiskFileUpload();
			fileUpload.setRepositoryPath(temDir);
			//setSize Threshold�� ũ�⸦ ����� �Ǹ� ������ ��ġ�� �ӽ÷� �����Ѵ�.
			fileUpload.setSizeMax(1024*1024*10);
			// �ִ� 1�ް����� ���ε� ���� (1024*1024*10) <= 100MB
			fileUpload.setSizeThreshold(1024*100); // �ѹ��� 100k ������ �޸𸮿� ����
			
			if(request.getContentLength()<fileUpload.getSizeMax()) {
				ProductVO productVO = new ProductVO();
				
				StringTokenizer token = null;
				
				//parseRequest()�� FileItem�� �����ϰ� �ִ� ListŸ���� �����Ѵ�.
				List fileItemList = fileUpload.parseRequest(request);
				int Size = fileItemList.size(); //html page���� ���� ������ ������ ���Ѵ�.
				for(int i=0; i<Size; i++) {
					FileItem fileItem = (FileItem)fileItemList.get(i);
					// isFormField()�� ���ؼ� ������������ �Ķ�������� �����Ѵ�. �Ķ���Ͷ�� true
					if(fileItem.isFormField()) {
						if(fileItem.getFieldName().equals("manuDate")) {
							token=new StringTokenizer(fileItem.getString("euc-kr"),"-");
							String manuDate = token.nextToken()+token.nextToken()+token.nextToken();
							productVO.setManuDate(manuDate);
						}
						else if(fileItem.getFieldName().equals("prodName"))
							productVO.setProdName(fileItem.getString("euc-kr"));
						else if(fileItem.getFieldName().equals("prodDetail"))
							productVO.setProdDetail(fileItem.getString("euc-kr"));
						else if(fileItem.getFieldName().equals("price"))
							productVO.setPrice(Integer.parseInt(fileItem.getString("euc-kr")));
						}else { // ���������̸�...
							
							if(fileItem.getSize()>0) { // ������ �����ϴ� if
								int idx = fileItem.getName().lastIndexOf("\\");
								//getName()�� ��θ� �� �������� ������ lastIndexOf�� �߶󳽴�
								if(idx==-1) {
									idx=fileItem.getName().lastIndexOf("/");
								}
								String fileName = fileItem.getName().substring(idx+1);
								productVO.setFileName(fileName);
								try {
									File uploadedFile = new File(temDir, fileName);
									fileItem.write(uploadedFile);		
								}catch(IOException e) {
									System.out.println(e);
								}
							}else {
								productVO.setFileName("../../images/empty.GIF");
							}
						}// else
					} //for
				
				ProductServiceImpl service = new ProductServiceImpl();
				service.addProduct(productVO);
				
				request.setAttribute("productVO", productVO);
			} else {
				// ���ε��ϴ� ������ setSizeMax���� ū ���
				int overSize = (request.getContentLength()/1000000);
				System.out.println("<script>alert('������ ũ��� 1MB���� �Դϴ�. �ø��� ���� �뷮�� " +overSize+ "MB�Դϴ�');");
				System.out.println("history.back();</script>");
			}
		}else {
			System.out.println("���ڵ� Ÿ���� multipart/form-data�� �ƴմϴ�..");
		}
		return "forward:/product/getProduct.jsp?menu=manage";
		
		//////////////////////////////////////////////////////////////////////
		
//		ProductVO productVO=new ProductVO();
//		productVO.setProdName(request.getParameter("prodName"));
//		productVO.setProdDetail(request.getParameter("prodDetail"));
//		productVO.setManuDate(request.getParameter("manuDate"));
//		productVO.setPrice(Integer.parseInt(request.getParameter("price")));
//		productVO.setFileName(request.getParameter("fileName"));
//		
//		System.out.println(productVO);
//		
//		//prodNo���� �ʿ� -> sql�����ؼ� �����;� �Ѵ�...
//		String prodName=request.getParameter("prodName"); //prodNo�� ���� ��??
////		System.out.println(prodName);
//		ProductService service=new ProductServiceImpl();
////		ProductVO vo=service.getProduct(prodName);
////		
////		request.setAttribute("vo", vo);
//		
//		service.addProduct(productVO);
//		service.getProduct(prodName);
//		prodName = productVO.getProdName();
//		
//		return "forward:/getProduct.do?prodName="+prodName;
	}	
}
