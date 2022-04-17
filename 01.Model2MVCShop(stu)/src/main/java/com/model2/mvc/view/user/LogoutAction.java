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
		HttpSession session=request.getSession(); // ���� �ҷ��ͼ�
		session.invalidate(); // ��� ����

		Cookie cookie = new Cookie("history", ""); // ������ ��Ű�� ���� �̸��� ��Ű ���� (���� �̸��̸� ���ι��� ��Ű�� ����)
		cookie.setMaxAge(0);    // ��ȿ�Ⱓ�� 0���� ���� (����)
		response.addCookie(cookie);  // ���信 ��Ű �߰�
		
		return "redirect:/index.jsp";
	}
}