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
			// proTranCode 변경 반영
			
			SearchVO searchVO=new SearchVO();
			
			int page=1; // 디폴트 페이지값 = 1
			if(request.getParameter("page") != null)
				page=Integer.parseInt(request.getParameter("page"));
			
			searchVO.setPage(page);
			searchVO.setSearchCondition(request.getParameter("searchCondition")); // 상품번호/상품이름 = 0/1
			searchVO.setSearchKeyword(request.getParameter("searchKeyword")); // 검색어
			
			String pageUnit=getServletContext().getInitParameter("pageSize"); // 3 (web.xml에서 확인가능)
			searchVO.setPageUnit(Integer.parseInt(pageUnit));
			
			ProductService service=new ProductServiceImpl();
			
			// 리스트를 가져올 때는 맵에 넣어 저장한다.
			HashMap<String,Object> map=service.getProductList(searchVO);

			request.setAttribute("map", map);
			request.setAttribute("searchVO", searchVO);
			
			
			return "forward:/product/listProduct.jsp";
		}
	}