package com.model2.mvc.view.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;


public class LogoutAction extends Action {

	@Override
	public String execute(	HttpServletRequest request,
												HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(); // 세션 불러와서
		session.invalidate(); // 즉시 종료

		Cookie cookie = new Cookie("history", ""); // 변경할 쿠키와 같은 이름의 쿠키 생성 (같은 이름이면 새로받은 쿠키로 갱신)
		cookie.setMaxAge(0);    // 유효기간을 0으로 설정 (삭제)
		response.addCookie(cookie);  // 응답에 쿠키 추가
		
		return "redirect:/index.jsp";
	}
}