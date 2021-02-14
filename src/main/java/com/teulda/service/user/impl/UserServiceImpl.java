package com.teulda.service.user.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teulda.common.Group;
import com.teulda.common.Search;
import com.teulda.service.domain.Report;
import com.teulda.service.domain.Review;
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
	public void addGroup1(Group group) throws Exception {
		userDao.addGroup1(group);
		
	}

	@Override
	public void addGroup2(Group group) throws Exception {
		userDao.addGroup2(group);
		
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

	


	@Override
	public User getUser(String email) throws Exception {
		User user = userDao.getUser(email);
		
		return user;
	}
	
	@Override
	public User getUserNick(String nickname) throws Exception {
		User user = userDao.getUserNick(nickname);
		
		return user;
	}

	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
		
	}
	
	@Override
	public void updateReportCount(int reportCount) throws Exception {
		userDao.updateReportCount(reportCount);
		
	}
	
	@Override
	public void updateUserStatus(User status) throws Exception {
		userDao.updateUserStatus(status);
		
	}
	
	@Override
	public void updateUserStatusAuto(User status) throws Exception {
		userDao.updateUserStatusAuto(status);
		
	}

	@Override
	public void deleteUser(String nickname) throws Exception {
		userDao.deleteUser(nickname);
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
	
	@Override
	public Map<String, Object> getUserListPublic(Search search) throws Exception {

		List<User> list= userDao.getUserListPublic(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	@Override
	public Map<String, Object> getUserListTotal(Search search) throws Exception {

		List<User> list= userDao.getUserListTotal(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	@Override
	public Map<String, Object> getUserBlackList(Search search) throws Exception {

		List<User> list= userDao.getUserBlackList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Map<String, Object> getReportList(Search search) throws Exception {

		List<Report> list= userDao.getReportList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	/*@Override
	public User logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();	
		session.invalidate();
		
		return null;
	}*/

	@Override
	public void addReport(Report report) throws Exception {
		userDao.addReport(report);
		
	}

	
	 @Override
	 public Report getReport(int reportNo) throws Exception { 
		 return userDao.getReport(reportNo);
	 }
	 
	 @Override public void deleteReport(int reportNo) throws Exception  {
		 userDao.deleteReport(reportNo);
	 }
	 

	@Override
	public User login(String email) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	 @Override
	    public String uploadFile(User user, String path, MultipartHttpServletRequest request) throws Exception{
			
			MultipartFile imageFile = request.getFile("imageFile");
			String fileName = "";
			String identify = UUID.randomUUID().toString();
			String userPath = request.getSession().getServletContext().getRealPath(path);
			//String userPath = "/Users/82105/git/TeulDa/WebContent/resources/images/profilePhoto";
			
			if(!imageFile.isEmpty() && !imageFile.getOriginalFilename().equals("")) {
				File file = new File(userPath);
				if(file.exists() == false) {
					file.mkdirs();
				}
				
					String pathName = imageFile.getOriginalFilename();
					fileName = identify+"_"+pathName;
					imageFile.transferTo(new File(userPath, fileName));
					
				}
				user.setProfilePhoto(fileName);
			
			return fileName;
		}




	//@Override
	//public void updateUserStatus(String status) throws Exception {
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
