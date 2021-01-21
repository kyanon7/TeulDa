package com.teulda.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teulda.common.Search;
import com.teulda.service.domain.Report;
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
	}//유저추가 완

	@Override
	public void checkEmail(String email) throws Exception {
		userDao.checkEmail(email);
	}
	
	@Override
	public boolean checkEmailDuplication(String email) throws Exception {
		boolean result=true;
			User user=userDao.getUser(email);
			if(user != null) {
				result=false;
			}
			return result;
	}

	@Override
	public boolean checkPhoneDuplication(String phone) throws Exception {
		boolean result=true;
			User user=userDao.getUser(phone);
			if(user != null) {
				result=false;
			}
			return result;
	}

	@Override
	public boolean checkNicknameDuplication(String nickname) throws Exception {
		boolean result=true;
		User user=userDao.getUser(nickname);
		if(user != null) {
			result=false;
		}
		return result;
	}

	
	/*
	 * @Override public User login(User user) throws Exception { User
	 * dbUser=userDao.getUser(user.getEmail());
	 * 
	 * if(! dbUser.getPassword().equals(user.getPassword())){ throw new
	 * Exception("로그인에 실패했습니다."); }
	 * 
	 * return dbUser; }
	 */


	@Override
	public User getUser(String email) throws Exception {

		return userDao.getUser(email);
	}

	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
		
	}

	//@Override
	public void updateUserStatus(User status) throws Exception {
		userDao.updateUser(status);
		
	}

	@Override
	public void updateUserStatus(String status) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(String nickname) throws Exception {
		userDao.deleteUser(nickname);
		
	}

	@Override
	public Map<String, Object> getUserBlackList(Search search) throws Exception {

		return null;
	}

	@Override
	public Map<String, Object> getReportList(Search search) throws Exception {

		return null;
	}

	@Override
	public void checkPhone(String phone) throws Exception {
		
	}//휴대폰 인증

	@Override
	public Map<String, Object> getUserList(Search search) throws Exception {
			
    	List<User> list= userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}//유저 리스트화, 유저 토탈 저장

	/*@Override
	public User logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();	
		session.invalidate();
		
		return null;
	}*/

	@Override
	public void addReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getReport(int reportNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReport(int reportNo) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public User login(String email) throws Exception {
		// TODO Auto-generated method stub
		return null;
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


	
	

	

}
