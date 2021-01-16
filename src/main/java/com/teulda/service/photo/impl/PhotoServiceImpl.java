package com.teulda.service.photo.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;
import com.teulda.service.photo.PhotoDao;
import com.teulda.service.photo.PhotoService;


@Service("photoServiceImpl")
public class PhotoServiceImpl implements PhotoService {

	@Autowired
	@Qualifier("photoDaoImpl")
	PhotoDao photoDao;
	
	public void setPhotoDao(PhotoDao photoDao) {
		System.out.println(getClass()+" : setPhotoDao call");
	}
	
	public PhotoServiceImpl() {
		System.out.println(getClass()+" : default Constructor call");
	}

	
	
	//사진등록 => 완료
	@Override
	public void addPhoto(Photo photo) throws Exception {
		photoDao.addPhoto(photo);
		
	}
	
	//사진조회 => 완료
	@Override
	public Photo getPhoto(int photoNo) throws Exception {
		return photoDao.getPhoto(photoNo);
	}

	//사진조회 list
	@Override
	public Map<String, Object> getPhotoList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	//그룹생성 => 완료
	@Override
	public void addGroup(Group group) throws Exception {
		photoDao.addGroup(group);
		
	}

	//그룹조회 => 완료
	@Override
	public Group getGroup(int groupNo) throws Exception {
		return photoDao.getGroup(groupNo);
	}

	//그룹조회 list
	@Override
	public Map<String, Object> getGroupList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	//사진이름 변경 => 완료
	@Override
	public void updateGroupName(Group group) throws Exception {
		photoDao.updateGroupName(group);
		
	}

	//사진앨범 이동(사진을 수정해야 함) => 완료
	@Override
	public void updateGroupNo(Photo photo) throws Exception {
		photoDao.updateGroupNo(photo);
		
	}

	//사진 삭제 플래그처리 => 완료
	@Override
	public void updatePhotoStatus(Photo photo) throws Exception {
		photoDao.updatePhotoStatus(photo);
		
	}

	//앨범 삭제 플래그처리 => 완료
	@Override
	public void updateGroupStatus(Group group) throws Exception {
		photoDao.updateGroupStatus(group);
		
	}

	//앨범사진삭제 플래그처리 => 완료
	@Override
	public void updateGroupPhotoStatus(Group group) throws Exception {
		photoDao.updateGroupPhotoStatus(group);
		
	}
	
	//사진 영구삭제 => 완료
	@Override
	public void deletePhoto(String nickname) throws Exception {
		photoDao.deletePhoto(nickname);
		
	}

	//앨범 영구삭제 => 완료
	@Override
	public void deleteGroup(String nickname) throws Exception {
		photoDao.deleteGroup(nickname);
		
	}
	
}
