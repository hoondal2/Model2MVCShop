<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>

<title>��� ��ǰ ����</title>

</head>
<body>
	����� ��� ��ǰ�� �˰� �ִ�
<br>
<br>
<%! String history = ""; %>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	System.out.println(history);
	
	// �� ������ �������� ��Ű�� ����ؼ� ����Ǿ�� �Ѵ�.
	// ���� ������� ��Ű�϶��� ���ο� �迭��, �׷��� ������ �߰�
	// �ٷ� ���� ��Ű�� ���� 
	Cookie[] cookies = request.getCookies();// ��Ű �迭 ���� -> ���⼭ �ߺ� ����Ǵ°� �ƴѰ� ...
		
	System.out.println(cookies.length);
	if (cookies!=null && cookies.length > 0) { // ��Ű�� �����Ѵٸ� -> ex) 10000
		for (int i = 1; i < cookies.length; i++) { // ��Ű�� ������ŭ �ݺ� -> ex) 1
			Cookie cookie = cookies[i]; // ��Ű�� 10000 ����
			response.addCookie(cookie);
			if ("history".equals(cookie.getName())) { // ��Ű �̸��� history���
				history += cookie.getValue() +","; 
				System.out.println(history); // String�� history�� �ش� ��Ű�� value�� ���� -> 10000
			}
			// �� ���� ���� ��Ű �����ϱ�...
				if(cookie.getName().equals("history")){
					cookie.setMaxAge(0);
				}
			}
		}
			if (!"".equals(history)) {
				System.out.println(history);
				String[] h = history.split(","); // ���ڿ� �迭 h�� his
				for (int i = 0; i < h.length; i++) {
					if (!h[i].equals("null")) { // h[i]�� ���� ����ִٸ�
%>
<a href="/getProduct.do?prodNo=<%=h[i]%>&menu=search" target="rightFrame"><%=h[i]%></a>
<br>
<%
				}
			}
		}
	
	
		
%>

</body>
</html>