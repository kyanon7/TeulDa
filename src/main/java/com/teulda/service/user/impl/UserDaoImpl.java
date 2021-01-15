package com.teulda.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teulda.common.Search;
import com.teulda.service.domain.User;
import com.teulda.service.user.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void checkEmail(String email) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void checkPhone(String phone) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User getUser(String NickName) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getUserList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		
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
	public List<User> getUserBlackList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getReportList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteReport(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	


}
