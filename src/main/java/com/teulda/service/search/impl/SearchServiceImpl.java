package com.teulda.service.search.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;
import com.teulda.service.diary.DiaryDao;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.HashTag;
import com.teulda.service.search.SearchDao;
import com.teulda.service.search.SearchService;

@Service("searchServiceImpl")
public class SearchServiceImpl implements SearchService {

	@Autowired
	@Qualifier("searchDaoImpl")
	SearchDao searchDao;

	@Autowired
	@Qualifier("diaryDaoImpl")
	DiaryDao diaryDao;

	public void setSearchDao(SearchDao searchDao) {
		System.out.println(getClass() + " : setSearchNScrapDao call");
	}

	public SearchServiceImpl() {
		System.out.println(getClass() + " : default Constructor call");
	}

	// 스크랩 등록
	@Override
	public void addScrap(Diary diary) throws Exception {

		searchDao.addScrap(diary);

		// 해시태그 등록
		List<HashTag> hashTagList = diary.getHashTagList();

		for (int i = 0; i < hashTagList.size(); i++) {
			HashTag hashTag = hashTagList.get(i);
			hashTag.setNickname(diary.getScrapNickname()); // 닉네임으로 최신 기록번호 찾기 위해 넣어줌
			hashTag.setDiaryNo(1);
			searchDao.addHashTag(hashTag); // 해시태그가 DB에 저장됨
		}

		/*
		 * for (HashTag hashTag : hashTagList) {
		 * hashTag.setNickname(diary.getNickname()); diaryDao.addHashTag(hashTag); }
		 */

		// 사진 이름 등록
		List<Photo> photoList = diary.getPhotoList();

		for (int i = 0; i < photoList.size(); i++) {
			Photo photo = photoList.get(i);
			photo.setNickname(diary.getScrapNickname()); // 닉네임으로 최신 기록번호 찾기 위해 넣어줌
			photo.setDiaryPhotoType('s'); // 기념품 사진
			if (photo.getDescription() == null) { // 설명이 없으면
				photo.setDiaryPhotoType('d'); // 기록 사진
			}
			photo.setDiaryNo(1);
			searchDao.addPhoto(photo); // 사진 파일명이 DB에 저장됨
		}
		diaryDao.updateDiaryScrapCount(diary.getDiaryNo());
		diaryDao.updateUserScrapCount(diary.getNickname());
	}

	// 스크랩 그룹 등록
	@Override
	public void addScrapGroup(Group group) throws Exception {
		searchDao.addScrapGroup(group);
	}

	// 스크랩 그룹목록 조회
	@Override
	public List<Group> getScrapGroupList(String nickname) throws Exception {
		return searchDao.getScrapGroupList(nickname);
	}

	// 스크랩 기록목록 조회
	@Override
	public Map<String, Object> getScrapList(Search search, String nickname, char isDelete) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		List<Diary> diaryList = searchDao.getScrapList(search, nickname, isDelete);

		map.put("diaryList", diaryList);
		map.put("totalCount", new Integer(searchDao.getScrapCount(search, nickname, isDelete)));

		return map;
	}

	// 스크랩 그룹변경
	@Override
	public void updateScrapGroup(Diary diary) throws Exception {
		searchDao.updateScrapGroup(diary);
	}
}
