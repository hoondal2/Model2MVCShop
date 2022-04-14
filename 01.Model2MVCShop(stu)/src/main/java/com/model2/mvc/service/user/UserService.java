package com.model2.mvc.service.user;

import java.util.HashMap;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.service.user.vo.UserVO;


public interface UserService {
	
	public void addUser(UserVO userVO) throws Exception; // ���� ���
	
	public UserVO loginUser(UserVO userVO) throws Exception; // �α��� ó��
	
	public UserVO getUser(String userId) throws Exception; // �������� ��ȸ
	
	public HashMap<String, Object> getUserList(SearchVO searchVO) throws Exception; //������� ��ȸ
	
	public void updateUser(UserVO userVO) throws Exception; // ȸ�� ���� ����
	
	public boolean checkDuplication(String userId) throws Exception; // ȸ�����Խ� �ߺ�üũ
	
}