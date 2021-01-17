package com.teulda.service.user;

import java.util.Map;

import com.teulda.common.Search;
import com.teulda.service.domain.User;

public interface UserService {
	
	public void addUser(User user) throws Exception;//유저추가
	
	public void checkEmail(String email) throws Exception ;//이메일 인증
	
	public void checkPhone(String phone) throws Exception ;//휴대폰 인증

	public boolean checkEmailDuplication(String email) throws Exception;//이메일 중복체크
	
	public boolean checkPhoneDuplication(String phone) throws Exception;//전화번호 중복체크
	
	public boolean checkNicknameDuplication(String nickName) throws Exception;//닉네임 중복체크
	
	public User login(User user) throws Exception;//로그인
	
	public User logout(User user) throws Exception;//로그아웃
	
	public User getUser(String nickName) throws Exception;//유저정보 조회
	
	public Map<String, Object> getUserList(Search search, String nickName) throws Exception;//유저리스트 조회
	
	public void updateUser(User user) throws Exception;//유저정보 업데이트
	
	public void updateUserStatus(String status) throws Exception ;//유저상태 업데이트  질문
	
	public void deleteUser(String nickName) throws Exception ;
	
	public void reportUser(User user) throws Exception ;
	
	public Map<String , Object> getUserBlackList(Search search) throws Exception ;
	
	public Map<String , Object> getReportList(Search search) throws Exception ;
	
	public void deleteReport(User user) throws Exception ;

}
