package com.teulda.service.diary.impl;

import java.sql.Timestamp;
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
//		List <Photo> photoList = diary.getPhotoList();
//		
//		for (int i = 0; i < photoList.size(); i++) {
//			Photo photo = photoList.get(i);
//			photo.setNickname(diary.getNickname()); // 닉네임으로 최신 기록번호 찾기 위해 넣어줌 
//			photo.setDiaryPhotoType('s'); // 기념품 사진 
//			if (photo.getDescription() == null) { // 설명이 없으면 
//				photo.setDiaryPhotoType('d'); // 기록 사진
//			} 
//			diaryDao.addPhoto(photo); // 사진 파일명이 DB에 저장됨 
//		}
		
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
				
		diary.setBookmarkCount(diaryDao.getBookmarkCount(diaryNo)); // 북마크 횟수 
		diary.setHashTagList(diaryDao.getHashTagList(diaryNo)); // 해시태그 리스트
		diary.setPhotoList(diaryDao.getPhotoList(diaryNo)); // 사진 리스트 
		return diary;
	}
	
	@Override
	// 기록 그룹 목록 보기를 위한 비즈니스 수행 
	public List<Group> getDiaryGroupList(String nickname) throws Exception {
		return diaryDao.getDiaryGroupList(nickname);
	}

	@Override
	// 내 기록 목록 보기(내 기록 목록, 내 기록 지도, 휴지통)를 위한 비즈니스 수행 
	public Map<String, Object> getMyDiaryList(Search search, String nickname, char isDelete) throws Exception {
		
		Map<String, Object> map = new HashMap <String, Object>();
		
		List <Diary> diaryList = diaryDao.getMyDiaryList(search, nickname, isDelete);
		
		map.put("diaryList", diaryList);
		map.put("totalCount", new Integer(diaryDao.getMyDiaryCount(search, nickname, isDelete)));
		
		return map;
	}
	
	@Override
	// 통합검색에서 기록 목록 보기를 위한 비즈니스 수행
	public Map<String, Object> getDiaryList(Search search) throws Exception {
		
		Map<String, Object> map = new HashMap <String, Object>();
		
		List <Diary> diaryList = diaryDao.getDiaryList(search);
		
		map.put("diaryList", diaryList);
		map.put("diaryTotalCount", new Integer(diaryDao.getDiaryCount(search)));
		
		return map;
	}

	@Override
	// 기록 수정을 위한 비즈니스 수행 (+ 해시태그 새로 생성, 사진 새로 추가) 
	public void updateDiary(Diary diary) throws Exception {
		
		diaryDao.updateDiary(diary); // 기록 수정 

		// 새로 생성한 해시태그 등록
		List <HashTag> hashTagList = diary.getHashTagList();
		
		for (int i = 0; i < hashTagList.size(); i++) {
			HashTag hashTag = hashTagList.get(i); 
			hashTag.setDiaryNo(diary.getDiaryNo()); // 기록번호가 정해져 있으니 넣어줌 
			diaryDao.addHashTag(hashTagList.get(i)); // 해시태그가 DB에 저장됨 
		}
		
		// 새로 첨부한 사진 등록 (기념품 사진일듯) 
		List<Photo> photoList = diary.getPhotoList();

		for (int i = 0; i < photoList.size(); i++) {
			Photo photo = photoList.get(i);
			photo.setDiaryNo(diary.getDiaryNo()); // 기록번호가 정해져 있으니 넣어줌 
			photo.setDiaryPhotoType('s'); // 기념품 사진
			if (photo.getDescription() == null) { // 설명이 없으면
				photo.setDiaryPhotoType('d'); // 기록 사진
			}
			diaryDao.addPhoto(photo); // 사진 파일명이 DB에 저장됨
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
	// 기록 조회수 증가를 위한 비즈니스 수행 
	public void updateDiaryViewCount(int diaryNo) throws Exception {
		diaryDao.updateDiaryViewCount(diaryNo);
	}
	
//	@Override
//	// 스크랩 추가 할 시 스크랩 추가 횟수 증가를 위한 비즈니스 수행
//	public void updateDiaryScrapCount(int diaryNo) throws Exception {
//		diaryDao.updateDiaryScrapCount(diaryNo);
//	}
//	
//	@Override
//	public void updateUserScrapCount(String originNickname) throws Exception {
//		diaryDao.updateUserScrapCount(originNickname);
//	}

	@Override
	// 기록 영구삭제를 위한 비즈니스 수행 
	public void deleteDiary(int diaryNo) throws Exception {
		diaryDao.deleteHashTagUseDiaryNo(diaryNo);
		diaryDao.deletePhotoUseDiaryNo(diaryNo);
		diaryDao.deleteDiary(diaryNo);
	}
	
	// 해시태그 번호로 해시태그 삭제를 위한 비즈니스 수행 
	@Override
	public void deleteHashTag(int hashTagNo) throws Exception {
		diaryDao.deleteHashTag(hashTagNo);
	}
	
	// 사진 번호로 기록 사진 삭제를 위한 비즈니스 수행
	@Override
	public void deletePhoto(int photoNo) throws Exception {
		diaryDao.deletePhoto(photoNo);
	}
	
	// 그룹 삭제 (기록 그룹, 스크랩 그룹 삭제)를 위한 비즈니스 수행
	@Override
	public void deleteGroup(int groupNo) throws Exception {
		diaryDao.deleteGroup(groupNo);
	}

	@Override
	public void printDiary(Diary diary) throws Exception {
		// TODO Auto-generated method stub

	}
	
	@Override
	public List<Diary> getSubscriberDiaryList(List<String> subscriberList, Timestamp start) throws Exception{
		
		Map<String, Object> subscriberListInfo = new HashMap<String, Object>();
		subscriberListInfo.put("subscriberList", subscriberList);
		subscriberListInfo.put("start", start);
		
		return diaryDao.getSubscriberDiaryList(subscriberListInfo);
	}
	
	@Override
	public List<Diary> getSubscriberDiaryPeriodList(List<String> subscriberList, Timestamp start, Timestamp end) throws Exception {
		
		Map<String, Object> subscriberListInfo = new HashMap<String, Object>();
		subscriberListInfo.put("subscriberList", subscriberList);
		subscriberListInfo.put("start", start);
		subscriberListInfo.put("end", end);
		return diaryDao.getSubscriberDiaryList(subscriberListInfo);
	}

}
