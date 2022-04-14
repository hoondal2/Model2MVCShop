<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=euc-kr"%>

<%@ page import="com.model2.mvc.service.user.vo.*"%>
<%@ page import="com.model2.mvc.service.product.vo.*"%>
<%@ page import="java.util.*"%>

<%
	session = request.getSession();
	UserVO user = (UserVO)session.getAttribute("user");
	
	if(user!=null){
		System.out.println("����ڴ� ����? " +user.getRole());
	}

	ProductVO vo = (ProductVO)request.getAttribute("vo");
%>

<%--Cookie[] cookies = request.getCookies();
	
	if(menu.equals("search")){
		Cookie cookie = new Cookie("history",URLEncoder.encode(Integer.toString(vo.getProdNo())));
		cookie.setMaxAge(60*60);
		response.addCookie(cookie); // ������ �ִ� ��Ű 
		//Cookie[] cookies = request.getCookies(); // ��Ű �迭 �޾ƿ���	
		//List<Cookie> cookies2 = new ArrayList<Cookie>(); // ����Ʈ �����
		//����Ʈ�� ��Ű �߰�
		//cookies2.add(cookie);
		System.out.println("��Ű ����Ϸ�"); // �ϳ��� ��Ű�� �ϳ��� ���� �����Ѵ�...
		//}
	}
--%>

<%--
	// ��ģ �κ�
	String prvHistory = "";
	   
	   for (Cookie c:request.getCookies()){
	      if (c.getName().equals("history")){
	         prvHistory=c.getValue();
	         System.out.println("getProduct: "+ prvHistory);         
	      }
	   }
	   // Cookie�� Request, Response�� ������ �ҷ����� �Ǵ� ������ �̷������.
	   // ���� Project���� ���Ǵ� Cookie�� ������ Key "history", value: prodNo�̸鼭 �� ProdNo�� , �� ���� �Ǿ�����.
	   int prodNo= vo.getProdNo();
	   System.out.println("getProduct: "+ prvHistory);
	   System.out.println("getProduct: "+ prodNo+","+prvHistory);
	   Cookie cookie = new Cookie("history", prodNo+","+prvHistory);   // ��Ű ����
	   cookie.setMaxAge(60*60);   // ���� Cookie�� �����Ⱓ
	   response.addCookie(cookie);
	 --%>

<% String menu = request.getParameter("menu");
	System.out.println(menu);
%>


<html>
<head>
<title>��ǰ����ȸ / ��ǰ����</title>

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
						<td width="93%" class="ct_ttl01">��ǰ����ȸ</td>
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
			<td width="104" class="ct_write">��ǰ��ȣ <img
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
			<td width="104" class="ct_write">��ǰ�� <img
				src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><%=vo.getProdName() %></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">��ǰ�̹���</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><%=vo.getFileName() %></td>

		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">��ǰ������</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><%=vo.getProdDetail() %></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">��������</td>
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
			<td width="104" class="ct_write">����</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><%=vo.getPrice()%></td>

		</tr>

		</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<tr>
			<td width="104" class="ct_write">�������</td>
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
					// �α��� / �̷α��� ���� 
					if(user!=null){
					/////////////�޴�==manage�϶� ������ư ���ܾ��Ѵ� //////////////
							if(menu.equals("manage")){%>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							
							<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
								<a href="/updateProduct.do?prodNo=<%=vo.getProdNo()%>">����</a>
							</td>
							<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</td>
							<td width="30"></td>
							
							<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"style="padding-top: 3px;">
								<a href="/listProduct.do?menu=manage">���</a> 
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
										<a href="/addPurchaseView.do?prodNo=<%=vo.getProdNo()%>">����</a>
									</td>
									<td width="14" height="23">
										<img src="/images/ct_btnbg03.gif" width="14" height="23">
									</td>
									<td width="30"></td>
									<td width="17" height="23">
										<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
									</td>
									<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
										<a href="javascript:history.go(-1)">����</a>
									</td>
									<td width="14" height="23">
										<img src="/images/ct_btnbg03.gif" width="14" height="23">
									</td>
								</tr>
							</table>
							<%}%>
			<!-- //////////////////////// �̷α��ν� ������ư�� ���� /////////////////////////// -->
							<%}else{%>
							<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
								</td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
								<a href="javascript:history.go(-1)">����</a>
								</td>
								<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23">
								</td>
							</tr>
							</table>
							<%} %>
</body>
</html>