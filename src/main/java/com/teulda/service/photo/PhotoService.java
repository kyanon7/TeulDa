package com.teulda.service.photo;

import java.util.Map;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;

public interface PhotoService {

	//사진등록(다중파일업로드 해야됨, 사진이 db에 한줄로 들어가는게 아니라 파싱해서 따로 들어가야 함) => 완료
	public void addPhoto(Photo photo) throws Exception;
	
	//사진조회(nickname으로 구분, group_type = 1(사진그룹)) => 완료
	public Photo getPhoto(int photoNo) throws Exception;
	
	//사진조회 list => 완료
	public Map<String, Object> getPhotoList(Group group) throws Exception;
	
	//그룹생성(group_type = 1) => 완료
	public void addGroup(Group group) throws Exception;
	
	//그룹조회 => 완료
	public Group getGroup(int groupNo) throws Exception;
	
	//그룹조회 list => 완료
	public Map<String, Object> getGroupList(Group group) throws Exception;
	
	//앨범이름 변경 => 완료
	public void updateGroupName(Group group) throws Exception;
	
	//사진앨범 이동(사진을 수정해야 함) => 완료
	public void updateGroupNo(Photo photo) throws Exception;
	
	//사진삭제 플래그처리(삭제, 복구) => 완료
	public void updatePhotoStatus(Photo photo) throws Exception;
	
	//앨범삭제 플래그처리(삭제, 복구) => 완료
	public void updateGroupStatus(Group group) throws Exception;
	
	//앨범사진삭제 플래그처리(삭제, 복구) => 완료
	public void updateGroupPhotoStatus(Group group) throws Exception;
	
	//휴지통비우기(사진, 영구삭제) => 완료
	public void deletePhoto(String nickname) throws Exception;
	
	//휴지통비우기(앨범 영구삭제) => 완료
	public void deleteGroup(String nickname) throws Exception;
	
	
}
