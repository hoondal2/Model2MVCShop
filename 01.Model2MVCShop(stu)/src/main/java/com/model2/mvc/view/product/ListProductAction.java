package com.model2.mvc.view.product;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.impl.UserServiceImpl;
import com.model2.mvc.service.user.vo.UserVO;

public class ListProductAction extends Action{

		@Override
		public String execute(	HttpServletRequest request,
													HttpServletResponse response) throws Exception {
			// proTranCode ���� �ݿ�
			
			SearchVO searchVO=new SearchVO();
			
			int page=1; // ����Ʈ �������� = 1
			if(request.getParameter("page") != null)
				page=Integer.parseInt(request.getParameter("page"));
			
			searchVO.setPage(page);
			searchVO.setSearchCondition(request.getParameter("searchCondition")); // ��ǰ��ȣ/��ǰ�̸� = 0/1
			searchVO.setSearchKeyword(request.getParameter("searchKeyword")); // �˻���
			
			String pageUnit=getServletContext().getInitParameter("pageSize"); // 3 (web.xml���� Ȯ�ΰ���)
			searchVO.setPageUnit(Integer.parseInt(pageUnit));
			
			ProductService service=new ProductServiceImpl();
			
			// ����Ʈ�� ������ ���� �ʿ� �־� �����Ѵ�.
			HashMap<String,Object> map=service.getProductList(searchVO);

			request.setAttribute("map", map);
			request.setAttribute("searchVO", searchVO);
			
			
			return "forward:/product/listProduct.jsp";
		}
	}