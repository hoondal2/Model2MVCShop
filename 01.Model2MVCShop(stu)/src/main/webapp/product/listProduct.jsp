<%@ page contentType="text/html; charset=euc-kr" %>

<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.service.product.vo.*" %>
<%@ page import="com.model2.mvc.service.user.vo.*" %>
<%@ page import="com.model2.mvc.common.*" %>

<%
	HashMap<String,Object> map=(HashMap<String,Object>)request.getAttribute("map");
	SearchVO searchVO=(SearchVO)request.getAttribute("searchVO");
	
	int total=0;
	ArrayList<ProductVO> list=null;
	if(map != null){
		total=((Integer)map.get("count")).intValue();
		list=(ArrayList<ProductVO>)map.get("list");
	}
	
	
	int currentPage=searchVO.getPage();
	
	int totalPage=0;
	if(total > 0) {
		totalPage= total / searchVO.getPageUnit();
		if(total%searchVO.getPageUnit() >0)
			totalPage += 1;
	}
%>

<% String menu = request.getParameter("menu"); // 널 발생 
	System.out.println(menu);%>

<html>
<head>

<title>상품관리 / 상품목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!--/////////// 메뉴에 따라 자바스크립트 실행을 다르게 ...///////// -->
<%if(menu.equals("manage")){ %>
<script type="text/javascript">
function fncGetProductList(){
	document.detailForm.action='/listProduct.do?menu=manage';
	document.detailForm.submit();
}
</script>

<%}else if(menu.equals("search")){ %>
<script type="text/javascript">
function fncGetProductList(){
	document.detailForm.action='/listProduct.do?menu=search';
	document.detailForm.submit();
}
</script>
<%} %>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/listProduct.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <% if(menu.equals("search")){%>
					<td width="93%" class="ct_ttl01">상품목록조회</td>
				<%} else if(menu.equals("manage")){%>
					<td width="93%" class="ct_ttl01">상품관리</td>
				<%}%>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	<%
		if(searchVO.getSearchCondition() != null) {
	%>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
		<%
				if(searchVO.getSearchCondition().equals("0")){
		%>
				<option value="0" selected>상품번호</option>
				<option value="1">상품명</option>
		<%
				}else {
		%>
				<option value="0">상품명</option>
				<option value="1" selected>상품번호</option>
		<%
				}
		%>
			</select>
			<input 	type="text" name="searchKeyword"  value="<%=searchVO.getSearchKeyword() %>" 
							class="ct_input_g" style="width:200px; height:19px" >
		</td>
	<%
		}else{
	%>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0">상품번호</option>
				<option value="1">상품명</option>
			</select>
			<input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" >
		</td>
	<%
		}
	%>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductList();">검색</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >전체  <%= total%> 건수, 현재 <%=currentPage %> 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>			
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<% 	
		int tranNo=0;
		int no=list.size();
		
		for(int i=0; i<list.size(); i++) {
			ProductVO vo = (ProductVO)list.get(i);
			/////////////////////////////////////////
			if((Integer)map.get("tranNo")!=null){
				tranNo = (Integer)map.get("tranNo");
				System.out.println(tranNo);
			}
	%>
	<tr class="ct_list_pop">
		<td align="center"><%=no--%></td>
		<td></td>
		<td align="left">
			<% if(menu.equals("search") && vo.getProTranCode().equals("판매중")){%>
				<a href="/getProduct.do?menu=search&prodNo=<%=vo.getProdNo() %>"><%= vo.getProdName() %> </a>
			<%} else if(menu.equals("search") && !vo.getProTranCode().equals("판매중")){%>
				<%= vo.getProdName() %>	
			<%} else if(menu.equals("manage")){%>
				<%= vo.getProdName() %> <a href="/updateProductView.do?menu=manage&prodNo=<%=vo.getProdNo() %>"> 수정</a>
			<%}%>
		</td>
		<td></td>
		<td align="left"><%= vo.getPrice() %></td>
		<td></td>
		<td align="left"><%= vo.getRegDate() %></td>
		<td></td>
		<td align="left">
		 <%if(menu.equals("search") && !vo.getProTranCode().equals("판매중")) {%>
		 	재고없음
		 <%} %>
		 
		 <%if(menu.equals("search") && vo.getProTranCode().equals("판매중")) {%>
		 	<%=vo.getProTranCode() %>
		 <%} %>
		 
		 <%if(menu.equals("manage")) {%>
			 <%=vo.getProTranCode() %>
		 <% if(vo.getProTranCode().equals("구매완료") ){%>
		 	<!-- 배송하기 클릭 시 , 해당하는 상품의 tranCode가 변경되어야 한다. (판매중인 상품의 tranNo은 0)  -->
		 	<a href="/updateTranCode.do?tranNo=<%=tranNo%>">  배송하기</a>
		 <%}}%>
		
		</td>		
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<% } %> <!--  end of for -->
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<%
			for(int i=1;i<=totalPage;i++){
				// 만약 메뉴가 search라면
				// 메뉴가 manage라면
				if(menu.equals("search")){
		%>
			<a href="/listProduct.do?menu=search&page=<%=i%>"><%=i %></a>
		<%
				}else if(menu.equals("manage")){
		%>
			<a href="/listProduct.do?menu=manage&page=<%=i%>"><%=i %></a>
		<%		}
			}
		%>	
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->
</form>
</div>

</body>
</html>