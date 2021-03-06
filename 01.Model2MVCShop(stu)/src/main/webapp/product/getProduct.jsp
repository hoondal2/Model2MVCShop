
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=euc-kr"%>

<%@ page import="com.model2.mvc.service.user.vo.*"%>
<%@ page import="com.model2.mvc.service.product.vo.*"%>
<%@ page import="java.util.*"%>

<%
	session = request.getSession();
	UserVO user = (UserVO)session.getAttribute("user");
	
	if(user!=null){
		System.out.println("사용자는 누구? " +user.getRole());
	}

	ProductVO vo = (ProductVO)request.getAttribute("vo");
%>

<%--
	Cookie[] cookies = request.getCookies();
	
	if(menu.equals("search")){
		Cookie cookie = new Cookie("history",URLEncoder.encode(Integer.toString(vo.getProdNo())));
		cookie.setMaxAge(60*60);
		response.addCookie(cookie); // 보낼때 주는 쿠키 
		//Cookie[] cookies = request.getCookies(); // 쿠키 배열 받아오기	
		//List<Cookie> cookies2 = new ArrayList<Cookie>(); // 리스트 만들기
		//리스트에 쿠키 추가
		//cookies2.add(cookie);
		System.out.println("쿠키 저장완료"); // 하나의 쿠키는 하나의 값만 저장한다...
		//}
	}
--%>

<%
	// 고친 부분
	String prvHistory = "";
	   
	   for (Cookie c:request.getCookies()){
	      if (c.getName().equals("history")){
	         prvHistory=URLDecoder.decode(c.getValue(), "utf-8");
	         System.out.println("getProduct: " + prvHistory);         
	      }
	   }
	   // Cookie는 Request, Response를 가지고 불러오기 또는 전달이 이루어진다.
	   // 현재 Project에서 사용되는 Cookie의 구조는 Key "history", value: prodNo이면서 각 ProdNo은 , 로 구분 되어있음.
	   int prodNo= vo.getProdNo();
	   System.out.println("getProduct: "+ prvHistory);
	   System.out.println("getProduct: "+ prodNo+","+prvHistory);
	   Cookie cookie = new Cookie("history", URLEncoder.encode(prodNo+","+prvHistory, "utf-8"));   // 쿠키 생성
	   cookie.setMaxAge(60*60);   // 현재 Cookie의 유지기간
	   response.addCookie(cookie);
%>

<% String menu = request.getParameter("menu");
	System.out.println(menu);
%>


<html>
<head>
<title>상품상세조회 / 상품수정</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

</head>

<body bgcolor="#ffffff" text="#000000">

	<table width="100%" height="37" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
				width="15" height="37"></td>
			<td background="/images/ct_ttl_img02.gif" width="100%"
				style="padding-left: 10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">상품상세조회</td>
						<td width="20%" align="right">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
				width="12" height="37"></td>
		</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 13px;">
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">상품번호 <img
				src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="105"><%=vo.getProdNo() %></td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<tr>
			<td width="104" class="ct_write">상품명 <img
				src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><%=vo.getProdName() %></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">상품이미지</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><%=vo.getFileName() %></td>

		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">상품상세정보</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><%=vo.getProdDetail() %></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">제조일자</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="26"><%=vo.getManuDate() %></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<tr>
			<td width="104" class="ct_write">가격</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><%=vo.getPrice()%></td>

		</tr>

		</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<tr>
			<td width="104" class="ct_write">등록일자</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><%=vo.getRegDate()%></td>

		</tr>

		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td width="53%"></td>
			<td align="right">
				
				<%	
					// 로그인 / 미로그인 구분 
					if(user!=null){
					/////////////메뉴==manage일때 수정버튼 생겨야한다 //////////////
							if(menu.equals("manage")){%>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							
							<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
								<a href="/updateProduct.do?prodNo=<%=vo.getProdNo()%>">수정</a>
							</td>
							<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</td>
							<td width="30"></td>
							
							<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"style="padding-top: 3px;">
								<a href="/listProduct.do?menu=manage">목록</a> 
							</td>
							<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23">
							</td>
							
							</tr>
						</table>
							<%}else{ %>
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="17" height="23">
										<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
									</td>
									<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
										<a href="/addPurchaseView.do?prodNo=<%=vo.getProdNo()%>">구매</a>
									</td>
									<td width="14" height="23">
										<img src="/images/ct_btnbg03.gif" width="14" height="23">
									</td>
									<td width="30"></td>
									<td width="17" height="23">
										<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
									</td>
									<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
										<a href="javascript:history.go(-1)">이전</a>
									</td>
									<td width="14" height="23">
										<img src="/images/ct_btnbg03.gif" width="14" height="23">
									</td>
								</tr>
							</table>
							<%}%>
			<!-- //////////////////////// 미로그인시 이전버튼만 생성 /////////////////////////// -->
							<%}else{%>
							<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
								</td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
								<a href="javascript:history.go(-1)">이전</a>
								</td>
								<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23">
								</td>
							</tr>
							</table>
							<%} %>
</body>
</html>