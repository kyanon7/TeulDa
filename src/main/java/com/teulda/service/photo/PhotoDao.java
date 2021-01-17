package com.teulda.service.photo;

import java.util.List;
import java.util.Map;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;

public interface PhotoDao {

	//사진등록 => 완료
	public void addPhoto(Photo photo) throws Exception;
	
	//사진조회 => 완료
	public Photo getPhoto(int photoNo) throws Exception;
	
	//사진조회list => 완료
	public List<Photo> getPhotoList(Group group) throws Exception;
	
	//photoTotalCount => 완료
	public int getPhotoTotalCount(Group group) throws Exception;
	
	//앨범등록 => 완료
	public void addGroup(Group group) throws Exception;
	
	//앨범조회 => 완료
	public Group getGroup(int groupNo) throws Exception;
	
	//앨범조회list => 완료
	public List<Group> getGroupList(Group group) throws Exception;
	
	//groupTotalCount => 완료
	public int getGroupTotalCount(Group group) throws Exception;
	
	//앨범이름 변경 => 완료
	public void updateGroupName(Group group) throws Exception;
	
	//사진앨범 이동(사진을 수정해야 함) => 완료
	public void updateGroupNo(Photo photo) throws Exception;
	
	//사진삭제 플래그처리 => 완료
	public void updatePhotoStatus(Photo photo) throws Exception;
	
	//앨범삭제 플래그처리 => 완료
	public void updateGroupStatus(Group group) throws Exception;
	
	//앨범사진삭제 플래그처리 => 완료
	public void updateGroupPhotoStatus(Group group) throws Exception;
	
	//사진휴지통 => 완료
	public void deletePhoto(String nickname) throws Exception;
	
	//사진휴지통 => 완료
	public void deleteGroup(String nickname) throws Exception;
}
