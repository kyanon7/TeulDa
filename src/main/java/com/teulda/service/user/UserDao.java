package com.teulda.service.user;

import java.util.List;

import com.teulda.common.Search;
import com.teulda.service.domain.User;



public interface UserDao {
	
	// INSERT
	public void addUser(User user) throws Exception ;
	
	public void checkEmail(String email) throws Exception ;
	
	public void checkPhone(String phone) throws Exception ;
	
	public User getUser(String NickName) throws Exception ;

	public List<User> getUserList(Search search) throws Exception ;

	public void updateUser(User user) throws Exception ;
	
	public void updateUserStatus(String status) throws Exception ;
	
	public void deleteUser(User user) throws Exception ;
	
	public void reportUser(User user) throws Exception ;
	
	public List<User> getUserBlackList(Search search) throws Exception ;
	
	public List<User> getReportList(Search search) throws Exception ;
	
	public void deleteReport(User user) throws Exception ;
	
	public int getTotalCount(Search search) throws Exception ;
	
	public void changeStatus(User user) throws Exception ;
	
}



//public boolean checkIdDuplication(String email) throws Exception;

//public boolean checkNicknameDuplication(String nickName) throws Exception;

//public boolean checkPhoneDuplication(String phone) throws Exception;