package com.teulda.service.photo;

import java.util.Map;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;

public interface PhotoService {

	//사진등록(다중파일업로드 해야됨, 사진이 db에 한줄로 들어가는게 아니라 파싱해서 따로 들어가야 함)
	public void addPhoto(Photo photo) throws Exception;
	
	//사진조회(nickname으로 구분, group_type = 1(사진그룹))
	public Photo getPhoto(String nickname) throws Exception;
	
	//사진조회 list
	public Map<String, Object> getPhotoList(Search search) throws Exception;
	
	//그룹생성(group_type = 1)
	public void addGroup(Group group) throws Exception;
	
	//그룹조회
	public Group getGroup(String nickname) throws Exception;
	
	//그룹조회 list
	public Map<String, Object> getGroupList(Search search) throws Exception;
	
	//앨범이름변경
	public void updateGroupName(Group group) throws Exception;
	
	//사진 앨범이동
	public void updateGroupNo(Group group) throws Exception;
	
	//사진 삭제 플래그처리(삭제, 복구)
	public void updatePhotoStatus(Photo photo) throws Exception;
	
	//앨범 삭제 플래그처리(삭제, 복구)
	public void updateGroupStatus(Group group) throws Exception;
	
	//휴지통비우기(사진, 앨범 영구삭제)
	public void deletePhoto(String nicknaem) throws Exception;
	
	
}
