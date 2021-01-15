package com.teulda.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teulda.common.Search;
import com.teulda.service.domain.User;
import com.teulda.service.user.UserDao;
import com.teulda.service.user.UserService;


@Service("UserServiceImpl")
public class UserServiceImpl implements UserService {
	
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;

	@Override
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	//@Override
	public void checkEmail(String email) throws Exception {
		
		
	}

	//@Override
	public void checkPhone(String phone) throws Exception {
		
		
	}

	//@Override
	public boolean checkEmailDuplication(String email) throws Exception {
	
		return false;
	}

	//@Override
	public boolean checkPhoneDuplication(String phone) throws Exception {
		
		return false;
	}

	//@Override
	public boolean checkNicknameDuplication(String nickName) throws Exception {
		
		return false;
	}

	//@Override
	public User login(User user) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	//@Override
	public User logout(User user) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUser(String nickName) throws Exception {
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

	//@Override
	public void updateUserStatus(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	//@Override
	public boolean checkDuplication(String userId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void updateUserStatus(String status) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void reportUser(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> getUserBlackList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getReportList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteReport(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	//@Override
	//public void updateUserStatus(String status) throws Exception {
		// TODO Auto-generated method stub
		
	//}

	//@Override
	//public void deleteUser(User user) throws Exception {
		// TODO Auto-generated method stub
		
	//}

	//@Override
	//public void reportUser(User user) throws Exception {
		// TODO Auto-generated method stub
		
	//}

	//@Override
	//public Map<String, Object> getUserBlackList(Search search) throws Exception {
		// TODO Auto-generated method stub
		//return null;
	//}

	//@Override
	//public Map<String, Object> getReportList(Search search) throws Exception {
		// TODO Auto-generated method stub
		//return null;
	//}

	//@Override
	//public void deleteReport(User user) throws Exception {
		// TODO Auto-generated method stub
		
	//}

	

}
