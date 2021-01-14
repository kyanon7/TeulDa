package com.teulda.service.user;

import java.util.Map;

import com.teulda.common.Search;
import com.teulda.service.domain.User;

public interface UserService {
	
	public void addUser(User user) throws Exception;
	
	public boolean checkEmailDuplication(String email) throws Exception;
	
	public boolean checkPhoneDuplication(String phone) throws Exception;
	
	public boolean checkNicknameDuplication(String nickName) throws Exception;
	
	public User loginUser(User user) throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public Map<String, Object> getUserList(Search search) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public boolean checkDuplication(String userId) throws Exception;

}
