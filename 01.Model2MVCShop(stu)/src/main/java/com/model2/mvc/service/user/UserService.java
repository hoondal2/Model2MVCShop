package com.model2.mvc.service.user;

import java.util.HashMap;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.service.user.vo.UserVO;


public interface UserService {
	
	public void addUser(UserVO userVO) throws Exception; // 유저 등록
	
	public UserVO loginUser(UserVO userVO) throws Exception; // 로그인 처리
	
	public UserVO getUser(String userId) throws Exception; // 유저정보 조회
	
	public HashMap<String, Object> getUserList(SearchVO searchVO) throws Exception; //유저목록 조회
	
	public void updateUser(UserVO userVO) throws Exception; // 회원 정보 수정
	
	public boolean checkDuplication(String userId) throws Exception; // 회원가입시 중복체크
	
}