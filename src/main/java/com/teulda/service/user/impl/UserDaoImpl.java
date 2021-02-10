package com.teulda.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teulda.common.Search;
import com.teulda.service.domain.Report;
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
	
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}


	@Override
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);	
	}


	@Override
	public void checkPhone(String phone) throws Exception {
		
	}

	@Override
	public User getUser(String email) throws Exception {
		return (User) sqlSession.selectOne("UserMapper.getUser" , email);
	}
	
	@Override
	public User getUserNick(String nickname) throws Exception {
		return (User) sqlSession.selectOne("UserMapper.getUserNick" , nickname);
	}
	
	@Override
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
		
	}
	
	@Override
	public void updateReportCount(int reportCount) throws Exception {
		sqlSession.update("UserMapper.updateReportCount", reportCount);
		
	}

	@Override
	public void updateUserStatus(User status) throws Exception {
		sqlSession.update("UserMapper.updateUserStatus", status);
		
	}
	
	@Override
	public void updateUserStatusAuto(User status) throws Exception {
		sqlSession.update("UserMapper.updateUserStatusAuto", status);
		
	}

	@Override
	public void deleteUser(String nickname) throws Exception {
		sqlSession.delete("UserMapper.deleteUser", nickname);	
	}
	
	@Override
	public List<User> getUserList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserList", search);
	}
	
	@Override
	public List<User> getUserListPublic(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserListPublic", search);
	}

	@Override
	public List<User> getUserListTotal(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserListTotal", search);
	}
	
	@Override
	public List<User> getUserBlackList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserBlackList", search);
	}

	@Override
	public List<Report> getReportList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getReportList", search);
	}

	@Override
	public int getTotalCount(Search search) {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}//관리자용
	
	public int getUserCount(Search search) {
		return sqlSession.selectOne("UserMapper.getUserCount", search);
	}//회원용
	
	public int getBlackCount(Search search) {
		return sqlSession.selectOne("UserMapper.getBlackCount", search);
	}//회원용

	@Override
	public void addReport(Report report) throws Exception {
		sqlSession.insert("UserMapper.addReport", report);
		
	}
	
	@Override
	public Report getReport(int reportNo) throws Exception {
		return (Report) sqlSession.selectOne("UserMapper.getReport" , reportNo);
	}
	

	public void deleteReport(int reportNo) throws Exception {
		sqlSession.delete("UserMapper.deleteReport", reportNo);	
		
	}




	

	


}
