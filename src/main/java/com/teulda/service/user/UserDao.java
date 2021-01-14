package com.teulda.service.user;

import java.util.List;
import com.teulda.service.domain.User;


//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface UserDao {
	
	// INSERT
	public void addUser(User user) throws Exception ;

	// SELECT ONE
	public User getUser(String userId) throws Exception ;

	// SELECT LIST
	//public List<User> getUserList(Search search) throws Exception ;

	// UPDATE
	public void updateUser(User user) throws Exception ;
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	//public int getTotalCount(Search search) throws Exception ;
	
}
