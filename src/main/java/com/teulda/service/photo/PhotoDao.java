package com.teulda.service.photo;

import java.util.Map;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;

public interface PhotoDao {

	//사진등록
	public void addPhoto(Photo photo) throws Exception;
	
	//사진조회
	public Photo getPhoto(String nickname) throws Exception;
	
	//사진조회list
	public Map<String, Object> getPhotoList(Search search) throws Exception;
	
	//앨범등록
	public void addGroup(Group group) throws Exception;
	
	//앨범조회
	public Group getGroup(String nickname) throws Exception;
	
	//앨범조회list
	public Map<String, Object> getGroupList(Search search) throws Exception;
	
	//사진삭제 플래그처리
	public void updatePhotoStatus(Photo photo) throws Exception;
	
	//앨범삭제 플래그처리
	public void updateGroupStatus(Group group) throws Exception;
	
	//사진휴지통
	public void deletePhoto(String nickname) throws Exception;
}
