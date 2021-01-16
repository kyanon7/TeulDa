package com.teulda.service.photo.impl;

import java.util.List;

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

	//사진등록 => 완료
	@Override
	public void addPhoto(Photo photo) throws Exception {
		sqlSession.insert("PhotoMapper.addPhoto",photo);
		
	}
	
	//사진조회 => 완료
	@Override
	public Photo getPhoto(int photoNo) throws Exception {
		
		return sqlSession.selectOne("PhotoMapper.getPhoto", photoNo);
	}

	//getList
	@Override
	public List<Photo> getPhotoList(Search search) throws Exception {
		
		return sqlSession.selectList("PhotoMapper.getPhotoList", search);
	}

	//앨범등록 => 완료
	@Override
	public void addGroup(Group group) throws Exception {
		sqlSession.insert("PhotoMapper.addGroup", group);
		
	}

	//사진조회 => 완료
	@Override
	public Group getGroup(int groupNo) throws Exception {
		
		return sqlSession.selectOne("PhotoMapper.getGroup", groupNo);
	}

	//getList
	@Override
	public List<Photo> getGroupList(Search search) throws Exception {
		
		return sqlSession.selectList("PhotoMapper.selectGroupList", search);
	}
	
	//앨범명 수정 => 완료
	@Override
	public void updateGroupName(Group group) throws Exception {
		sqlSession.update("PhotoMapper.updateGroupName", group);
		
	}

	//사진앨범 이동 => 완료
	@Override
	public void updateGroupNo(Photo photo) throws Exception {
		sqlSession.update("PhotoMapper.updateGroupNo", photo);
		
	}
	
	//사진삭제 플래그처리 => 완료
	@Override
	public void updatePhotoStatus(Photo photo) throws Exception {
		sqlSession.update("PhotoMapper.updatePhotoStatus", photo);
		
	}

	//앨범삭제 플래그처리 => 완료
	@Override
	public void updateGroupStatus(Group group) throws Exception {
		sqlSession.update("PhotoMapper.updateGroupStatus", group);
		
	}

	//앨범 삭제 시 앨범안에 있는 사진 플래그처리 => 완료
	@Override
	public void updateGroupPhotoStatus(Group group) throws Exception {
		sqlSession.update("PhotoMapper.updateGroupPhotoStatus", group);
		
	}
		
	//사진휴지통 영구삭제(사진) => 완료
	@Override
	public void deletePhoto(String nickname) throws Exception {
		sqlSession.delete("PhotoMapper.deletePhoto", nickname);
		
	}

	//사진휴지통 영구삭제(앨범&앨범 안에 있는 사진) => 완료
	@Override
	public void deleteGroup(String nickname) throws Exception {
		sqlSession.delete("PhotoMapper.deleteGroup", nickname);
		
	}
}
