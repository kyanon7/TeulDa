package com.teulda.service.user.impl;

import java.util.Map;

import com.teulda.common.Search;
import com.teulda.service.domain.User;
import com.teulda.service.user.UserService;

public class UserServiceImpl implements UserService {

	@Override
	public void addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean checkEmailDuplication(String email) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkPhoneDuplication(String phone) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkNicknameDuplication(String nickName) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User loginUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getUserList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean checkDuplication(String userId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
