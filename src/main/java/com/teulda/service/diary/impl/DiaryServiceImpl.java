package com.teulda.service.diary.impl;

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
import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.HashTag;

@Service("diaryServiceImpl")
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	@Qualifier("diaryDaoImpl")
	private DiaryDao diaryDao;
	
	// setter injection 
	public void setDiaryDao(DiaryDao diaryDao) {
		this.diaryDao = diaryDao;
	}
	
	public DiaryServiceImpl() { // 생성자
		System.out.println(this.getClass()); // 디버깅 위함
	}
	
	@Override
	// 기록 등록을 위한 비즈니스 수행 (+ 기록에 포함된 해시태그 등록, 사진 등록) 
	public void addDiary(Diary diary) throws Exception {
		
		diaryDao.addDiary(diary); // diary DB 생성 
		
		// 해시태그 등록
		List <HashTag> hashTagList = diary.getHashTagList();
		
		for (int i = 0; i < hashTagList.size(); i++) {
			HashTag hashTag = hashTagList.get(i);
			hashTag.setNickname(diary.getNickname()); // 닉네임으로 최신 기록번호 찾기 위해 넣어줌 
			diaryDao.addHashTag(hashTag); // 해시태그가 DB에 저장됨 
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
			diaryDao.addPhoto(photo); // 사진 파일명이 DB에 저장됨 
		}
		
	}

	@Override
	// 기록 그룹 등록을 위한 비즈니스 수행
	public void addDiaryGroup(Group group) throws Exception {
		diaryDao.addDiaryGroup(group);
	}

	@Override
	// 기록 조회(+ 해시태그 조회, 사진 조회)를 위한 비즈니스 수행
	public Diary getDiary(int diaryNo) throws Exception {
		Diary diary = diaryDao.getDiary(diaryNo); 
		diary.setHashTagList(diaryDao.getHashTagList(diaryNo));
		diary.setPhotoList(diaryDao.getPhotoList(diaryNo));
		return diary;
	}

	@Override
	// 내 기록 목록 보기를 위한 비즈니스 수행
	public Map<String, Object> getDiaryList(Search search, String nickname) throws Exception {
		
		Map<String, Object> map = new HashMap <String, Object>();
		
		List <Diary> diaryList = diaryDao.getDiaryList(search, nickname);
		
		// 해시태그도 넣어줘야 함! 코드 완성된거 아님 
		map.put("list", diaryList);
		map.put("totalCount", new Integer(diaryDao.getDiaryCount(nickname)));
		
		return map;
	}

	@Override
	// 기록 수정을 위한 비즈니스 수행 (+ 해시태그 새로 생성, 사진 추가) 
	public void updateDiary(Diary diary) throws Exception {
		
		diaryDao.updateDiary(diary); // 기록 수정 

		// 새로 생성한 해시태그 등록
		List <HashTag> hashTagList = diary.getHashTagList();
		
		for (int i = 0; i < hashTagList.size(); i++) {
			HashTag hashTag = hashTagList.get(i); 
			hashTag.setDiaryNo(diary.getDiaryNo()); // 기록번호가 정해져 있으니 넣어줌 
			diaryDao.addHashTag(hashTagList.get(i)); // 해시태그가 DB에 저장됨 
		}
	}

	@Override
	// 기록 상태 변경을 위한 비즈니스 수행
	public void updateDiaryStatus(Diary diary) throws Exception {
		diaryDao.updateDiaryStatus(diary);
	}

	@Override
	// 기록 그룹 변경을 위한 비즈니스 수행
	public void updateDiaryGroup(Diary diary) throws Exception {
		diaryDao.updateDiaryGroup(diary);
	}

	@Override
	// 기록 영구삭제를 위한 비즈니스 수행 
	public void deleteDiary(int diaryNo) throws Exception {
		diaryDao.deleteDiary(diaryNo);
	}

	@Override
	public void printDiary(Diary diary) throws Exception {
		// TODO Auto-generated method stub

	}

}
