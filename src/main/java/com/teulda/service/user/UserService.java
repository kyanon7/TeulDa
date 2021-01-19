package com.teulda.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teulda.common.Search;
import com.teulda.service.domain.Report;
import com.teulda.service.domain.User;

public interface UserService {
	
	public void addUser(User user) throws Exception;//유저추가 완
	
	public void checkEmail(String email) throws Exception ;//이메일 인증
	
	public void checkPhone(String phone) throws Exception ;//휴대폰 인증

	public boolean checkEmailDuplication(String email) throws Exception;//이메일 중복체크
	
	public boolean checkPhoneDuplication(String phone) throws Exception;//전화번호 중복체크
	
	public boolean checkNicknameDuplication(String nickName) throws Exception;//닉네임 중복체크
	
	public User login(User user) throws Exception;//로그인
	
	public User logout(HttpServletRequest request, HttpServletResponse response) throws Exception;//로그아웃
	
	public User getUser(String nickName) throws Exception;//유저정보 조회 완
	
	public Map<String, Object> getUserList(Search search) throws Exception;//유저리스트 조회
	
	public void updateUser(User user) throws Exception;//유저정보 업데이트 완
	
	public void updateUserStatus(String status) throws Exception ;//유저상태 업데이트  
	
	public void deleteUser(String nickName) throws Exception ;//유저삭제 완
	
	public void addReport(Report report) throws Exception;//유저신고 생성
	
	public void getReport(int reportNo) throws Exception;//신고내역 조회
	
	public void deleteReport(int reportNo) throws Exception;//신고내역 삭제
	
	public Map<String , Object> getUserBlackList(Search search) throws Exception ;//블랙리스트 리스트
	
	public Map<String , Object> getReportList(Search search) throws Exception ;///신고리스트 리스트
	
	public void deleteReport(User user) throws Exception ;//신고사유삭제



	

}
