package com.teulda.service.user;

import java.util.Map;

import com.teulda.common.Search;
import com.teulda.service.domain.User;

public interface UserService {
	
	public void addUser(User user) throws Exception;
	
	public void checkEmail(String email) throws Exception ;
	
	public void checkPhone(String phone) throws Exception ;
	
	public boolean checkIdDuplication(String email) throws Exception;

	public boolean checkEmailDuplication(String email) throws Exception;
	
	public boolean checkPhoneDuplication(String phone) throws Exception;
	
	public boolean checkNicknameDuplication(String nickName) throws Exception;
	
	public User login(User user) throws Exception;
	
	public User logout(User user) throws Exception;
	
	public User getUser(String nickName) throws Exception;
	
	public Map<String, Object> getUserList(Search search) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void updateUserStatus(User user) throws Exception;
	
	public boolean checkDuplication(String userId) throws Exception;
	
	public void updateUserStatus(String status) throws Exception ;
	
	public void deleteUser(User user) throws Exception ;
	
	public void reportUser(User user) throws Exception ;
	
	public Map<String , Object> getUserBlackList(Search search) throws Exception ;
	
	public Map<String , Object> getReportList(Search search) throws Exception ;
	
	public void deleteReport(User user) throws Exception ;

}
