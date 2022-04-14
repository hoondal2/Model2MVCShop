<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>

<title>열어본 상품 보기</title>

</head>
<body>
	당신이 열어본 상품을 알고 있다
<br>
<br>
<%! String history = ""; %>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	System.out.println(history);
	
	// 이 페이지 내에서는 쿠키가 계속해서 저장되어야 한다.
	// 새로 만들어진 쿠키일때만 새로운 배열에, 그렇지 않으면 추가
	// 바로 이전 쿠키와 같은 
	Cookie[] cookies = request.getCookies();// 쿠키 배열 생성 -> 여기서 중복 저장되는거 아닌가 ...
		
	System.out.println(cookies.length);
	if (cookies!=null && cookies.length > 0) { // 쿠키가 존재한다면 -> ex) 10000
		for (int i = 1; i < cookies.length; i++) { // 쿠키의 갯수만큼 반복 -> ex) 1
			Cookie cookie = cookies[i]; // 쿠키에 10000 저장
			response.addCookie(cookie);
			if ("history".equals(cookie.getName())) { // 쿠키 이름이 history라면
				history += cookie.getValue() +","; 
				System.out.println(history); // String인 history에 해당 쿠키의 value값 저장 -> 10000
			}
			// 할 일을 다한 쿠키 삭제하기...
				if(cookie.getName().equals("history")){
					cookie.setMaxAge(0);
				}
			}
		}
			if (!"".equals(history)) {
				System.out.println(history);
				String[] h = history.split(","); // 문자열 배열 h에 his
				for (int i = 0; i < h.length; i++) {
					if (!h[i].equals("null")) { // h[i]에 값이 들어있다면
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