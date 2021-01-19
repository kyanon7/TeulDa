package com.teulda.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teulda.common.Photo;
import com.teulda.common.Search;
import com.teulda.service.community.CommunityDao;
import com.teulda.service.community.CommunityService;
import com.teulda.service.domain.Bookmark;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.HashTag;
import com.teulda.service.domain.Subscribe;

	@Service("communityServiceImpl")
	public class CommunityServiceImpl implements CommunityService {

		//setter 인젝션	
		@Autowired
		@Qualifier("communityDaoImpl")
		private CommunityDao communityDao;
		
		public void setCommunityDao(CommunityDao communityDao){
			this.communityDao = communityDao;
		}
		
		//디버깅을 위한
		public CommunityServiceImpl() {  
			System.out.println(this.getClass()+" : default Constructor call");
		}
	
	
	@Override
	public void addBookmark(Bookmark bookmark) throws Exception {
		
//		communityDao.addBookmark(bookmark);
		
	}

	@Override
	public void deleteBookmark(int bookmark) throws Exception {
		
//		communityDao.deleteBookmark(bookmark);
		
	}

	@Override
	public Map<String, Object> getBookmarkList(Search search) throws Exception {
//		List<Bookmark> list = communityDao.getBookmarkList(search);
//		int totalCount = communityDao.getTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("totalCount", totalCount);
//		
//		return map;
		return null;
	}

	//스크랩 등록
	@Override
	public void addScrap(Diary diary) throws Exception {
		
		communityDao.addScrap(diary);
		
		// 해시태그 등록
				List <HashTag> hashTagList = diary.getHashTagList();
				
				for (int i = 0; i < hashTagList.size(); i++) {
					HashTag hashTag = hashTagList.get(i);
					hashTag.setNickname(diary.getNickname()); // 닉네임으로 최신 기록번호 찾기 위해 넣어줌 
					communityDao.addHashTag(hashTag); // 해시태그가 DB에 저장됨 
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
					photo.setNickname(diary.getNickname()); // 닉네임으로 최신 기록번호 찾기 위해 넣어줌 
					photo.setDiaryPhotoType('s'); // 기념품 사진 
					if (photo.getDescription() == null) { // 설명이 없으면 
						photo.setDiaryPhotoType('d'); // 기록 사진
					} 
					communityDao.addPhoto(photo); // 사진 파일명이 DB에 저장됨 
				}

		
	}

	@Override
	public boolean addSubscribe(Subscribe subscribe) throws Exception {
		if(communityDao.checkSubscribe(subscribe) == 0) {
			communityDao.addSubscribe(subscribe);
			return true;
		}
		return false;
	}

	@Override
	public List<Subscribe> getSubscribeList(String subNickname) throws Exception {
		return communityDao.getSubscribeList(subNickname);
	}

	@Override
	public void deleteSubscribe(Subscribe subscribe) throws Exception {
		communityDao.deleteSubscribe(subscribe);
		
	}

}
