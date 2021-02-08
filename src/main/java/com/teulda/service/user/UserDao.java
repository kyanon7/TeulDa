package com.teulda.service.user;

import java.util.List;
import java.util.Map;

import com.teulda.common.Search;
import com.teulda.service.domain.Report;
import com.teulda.service.domain.User;



public interface UserDao {
	
	// INSERT
	public void addUser(User user) throws Exception ;//가입 완
	
	public void checkEmail(String email) throws Exception ;//이메일인증
	
	public void checkPhone(String phone) throws Exception ;//핸드폰인증
	
	public User getUser(String email) throws Exception ;//유저정보 조회 완

	public List<User> getUserList(Search search) throws Exception ;//유저목록 조회 완
	
	public List<User> getUserListPublic(Search search) throws Exception ;//유저목록 조회 완
	
	public List<User> getUserListTotal(Search search) throws Exception;//유저리스트 조회

	public void updateUser(User user) throws Exception ;//유저정보 수정 완
	
	public void updateReportCount(int reportCount) throws Exception;//유저 신고횟수 업데이트
	
	public void updateUserStatus(User status) throws Exception ;//유저상태 수정 완
	
	public void updateUserStatusAuto(User status) throws Exception ;//유저상태 자동수정 
	
	public void deleteUser(String nickname) throws Exception ;//유저탈퇴(삭제) 완
	
	public List<User> getUserBlackList(Search search) throws Exception ;//블랙리스트목록조회
	
	public List<Report> getReportList(Search search) throws Exception ;//신고목록조회
	
	public int getTotalCount(Search search) throws Exception;//관리자용
	
	public int getUserCount(Search search) throws Exception;//회원용
	
	public int getBlackCount(Search search) throws Exception;//회원용

	public void addReport(Report report) throws Exception;//신고하기 완
	
	public void deleteReport(int reportNo) throws Exception;//신고내역삭제(관리자만) 완
	
	public Report getReport(int reportNo) throws Exception;//신고내역조회 완

	
	



	
	
}



//public boolean checkIdDuplication(String email) throws Exception;

//public boolean checkNicknameDuplication(String nickname) throws Exception;

//public boolean checkPhoneDuplication(String phone) throws Exception;