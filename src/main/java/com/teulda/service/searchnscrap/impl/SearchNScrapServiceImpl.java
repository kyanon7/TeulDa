package com.teulda.service.searchnscrap.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.HashTag;
import com.teulda.service.photo.PhotoDao;
import com.teulda.service.searchnscrap.SearchNScrapDao;
import com.teulda.service.searchnscrap.SearchNScrapService;

@Service("searchNScrapServiceImpl")
public class SearchNScrapServiceImpl implements SearchNScrapService {

	@Autowired
	@Qualifier("searchNScrapDaoImpl")
	SearchNScrapDao searchNScrapDao;
	
	public void setPhotoDao(PhotoDao photoDao) {
		System.out.println(getClass()+" : setSearchNScrapDao call");
	}
	
	public SearchNScrapServiceImpl() {
		System.out.println(getClass()+" : default Constructor call");
	}

	
	//스크랩 등록
		@Override
		public void addScrap(Diary diary) throws Exception {
			
			searchNScrapDao.addScrap(diary);
			
			// 해시태그 등록
					List <HashTag> hashTagList = diary.getHashTagList();
					
					for (int i = 0; i < hashTagList.size(); i++) {
						HashTag hashTag = hashTagList.get(i);
						hashTag.setNickname(diary.getScrapNickname()); // 닉네임으로 최신 기록번호 찾기 위해 넣어줌 
						hashTag.setDiaryNo(1);
						searchNScrapDao.addHashTag(hashTag); // 해시태그가 DB에 저장됨 
					}
					
					/*
					for (HashTag hashTag : hashTagList) {
						hashTag.setNickname(diary.getNickname());
						diaryDao.addHashTag(hashTag);
					}
					*/
					
					// 사진 이름 등록
					List <Photo> photoList = diary.getPhotoList();
					
					for (int i = 0; i < photoList.size(); i++) {
						Photo photo = photoList.get(i);
						photo.setNickname(diary.getScrapNickname()); // 닉네임으로 최신 기록번호 찾기 위해 넣어줌 
						photo.setDiaryPhotoType('s'); // 기념품 사진 
						if (photo.getDescription() == null) { // 설명이 없으면 
							photo.setDiaryPhotoType('d'); // 기록 사진
						} 
						photo.setDiaryNo(1);
						searchNScrapDao.addPhoto(photo); // 사진 파일명이 DB에 저장됨 
					}
		}
		
		//스크랩 그룹 등록
		@Override
		public void addScrapGroup(Group group) throws Exception {
			searchNScrapDao.addScrapGroup(group);
		}
		
		//스크랩 그룹 조회
		@Override
		public Map<String, Object> getGroupList(Group group) throws Exception {
			
			List<Group> groupList = searchNScrapDao.getGroupList(group);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("groupList", groupList);
			
			return map;
		}

}
