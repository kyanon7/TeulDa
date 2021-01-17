package com.teulda.service.user;

import java.util.List;

import com.teulda.common.Search;
import com.teulda.service.domain.User;



public interface UserDao {
	
	// INSERT
	public void addUser(User user) throws Exception ;//가입
	
	public void checkEmail(String email) throws Exception ;//이메일인증
	
	public void checkPhone(String phone) throws Exception ;//핸드폰인증
	
	public User getUser(String NickName) throws Exception ;//유저정보 조회

	public List<User> getUserList(Search search) throws Exception ;//유저목록 조회

	public void updateUser(User user) throws Exception ;//유저정보 수정
	
	public void updateUserStatus(String status) throws Exception ;//유저상태 수정
	
	public void deleteUser(User user) throws Exception ;//유저탈퇴(삭제)
	
	public void reportUser(User user) throws Exception ;//신고
	
	public List<User> getUserBlackList(Search search) throws Exception ;//블랙리스트목록조회
	
	public List<User> getReportList(Search search) throws Exception ;//신고목록조회
	
	public void deleteReport(User user) throws Exception ;//신고내역삭제
	
	//public void changeStatus(User user) throws Exception ;///
	
}



//public boolean checkIdDuplication(String email) throws Exception;

//public boolean checkNicknameDuplication(String nickName) throws Exception;

//public boolean checkPhoneDuplication(String phone) throws Exception;