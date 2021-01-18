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


@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public UserServiceImpl() { // console
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	//@Override
	public void checkEmail(String email) throws Exception {
		userDao.checkEmail(email);
	}

	
	//@Override
	public User login(User user) throws Exception {
		User dbUser=userDao.getUser(user.getEmail());

		if(! dbUser.getPassword().equals(user.getPassword())){
			throw new Exception("로그인에 실패했습니다.");
		}
		
		return dbUser;
	}

	//@Override
	public User logout(User user) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUser(String nickName) throws Exception {

		return userDao.getUser(nickName);
	}

	@Override
	public Map<String, Object> getUserList(Search search, String nickName) throws Exception {
		 	
		Map<String, Object> map = new HashMap <String, Object>();
		List <User> userList = userDao.getUserList(search, nickName);
		
		map.put("list", userList);
		return map;
	}

	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
		
	}

	//@Override
	public void updateUserStatus(User status) throws Exception {
		userDao.updateUser(status);
		
	}

	//@Override
	public boolean checkDuplication(String userEmail) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void updateUserStatus(String status) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(String nickName) throws Exception {
		userDao.deleteUser(nickName);
		
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

	@Override
	public void checkPhone(String phone) throws Exception {
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

	//@Override
	//public void updateUserStatus(String status) throws Exception {
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
