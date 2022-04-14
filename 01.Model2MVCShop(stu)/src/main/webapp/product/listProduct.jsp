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

<% String menu = request.getParameter("menu"); // �� �߻� 
	System.out.println(menu);%>

<html>
<head>

<title>��ǰ���� / ��ǰ�����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!--/////////// �޴��� ���� �ڹٽ�ũ��Ʈ ������ �ٸ��� ...///////// -->
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
					<td width="93%" class="ct_ttl01">��ǰ�����ȸ</td>
				<%} else if(menu.equals("manage")){%>
					<td width="93%" class="ct_ttl01">��ǰ����</td>
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
				<option value="0" selected>��ǰ��ȣ</option>
				<option value="1">��ǰ��</option>
		<%
				}else {
		%>
				<option value="0">��ǰ��</option>
				<option value="1" selected>��ǰ��ȣ</option>
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
				<option value="0">��ǰ��ȣ</option>
				<option value="1">��ǰ��</option>
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
						<a href="javascript:fncGetProductList();">�˻�</a>
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
		<td colspan="11" >��ü  <%= total%> �Ǽ�, ���� <%=currentPage %> ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>			
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
			<% if(menu.equals("search") && vo.getProTranCode().equals("�Ǹ���")){%>
				<a href="/getProduct.do?menu=search&prodNo=<%=vo.getProdNo() %>"><%= vo.getProdName() %> </a>
			<%} else if(menu.equals("search") && !vo.getProTranCode().equals("�Ǹ���")){%>
				<%= vo.getProdName() %>	
			<%} else if(menu.equals("manage")){%>
				<%= vo.getProdName() %> <a href="/updateProductView.do?menu=manage&prodNo=<%=vo.getProdNo() %>"> ����</a>
			<%}%>
		</td>
		<td></td>
		<td align="left"><%= vo.getPrice() %></td>
		<td></td>
		<td align="left"><%= vo.getRegDate() %></td>
		<td></td>
		<td align="left">
		 <%if(menu.equals("search") && !vo.getProTranCode().equals("�Ǹ���")) {%>
		 	������
		 <%} %>
		 
		 <%if(menu.equals("search") && vo.getProTranCode().equals("�Ǹ���")) {%>
		 	<%=vo.getProTranCode() %>
		 <%} %>
		 
		 <%if(menu.equals("manage")) {%>
			 <%=vo.getProTranCode() %>
		 <% if(vo.getProTranCode().equals("���ſϷ�") ){%>
		 	<!-- ����ϱ� Ŭ�� �� , �ش��ϴ� ��ǰ�� tranCode�� ����Ǿ�� �Ѵ�. (�Ǹ����� ��ǰ�� tranNo�� 0)  -->
		 	<a href="/updateTranCode.do?tranNo=<%=tranNo%>">  ����ϱ�</a>
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
				// ���� �޴��� search���
				// �޴��� manage���
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
<!--  ������ Navigator �� -->
</form>
</div>

</body>
</html>