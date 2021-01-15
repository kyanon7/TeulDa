package com.teulda.service.photo.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;
import com.teulda.service.photo.PhotoDao;

@Repository("photoDaoImpl")
public class PhotoDaoImpl implements PhotoDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println(getClass().getName()+" : setSqlSessino() call");
		this.sqlSession = sqlSession;
	}
	
	public PhotoDaoImpl() {
		System.out.println(getClass()+" : default Constructor call");
	}

	//insert
	@Override
	public void addPhoto(Photo photo) throws Exception {
		sqlSession.insert("PhotoMapper.addPhoto",photo);
		
	}
	
	//get
	@Override
	public Photo getPhoto(String nickname) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	//getList
	@Override
	public Map<String, Object> getPhotoList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	//insert
	@Override
	public void addGroup(Group group) throws Exception {
		sqlSession.insert("PhotoMapper.addGroup", group);
		
	}

	//get
	@Override
	public Group getGroup(String nickname) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	//getList
	@Override
	public Map<String, Object> getGroupList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	//update
	@Override
	public void updatePhotoStatus(Photo photo) throws Exception {
		sqlSession.update("PhotoMapper.updatePhoto", photo);
		
	}

	//update
	@Override
	public void updateGroupStatus(Group group) throws Exception {
		sqlSession.update("PhotoMapper.updateGroup", group);
		
	}

	//delete
	@Override
	public void deletePhoto(String nickname) throws Exception {
		sqlSession.delete("PhotoMapper.deletePhoto", nickname);
		
	}
	
}
