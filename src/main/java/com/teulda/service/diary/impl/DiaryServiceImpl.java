package com.teulda.service.diary.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teulda.common.Group;
import com.teulda.common.Search;
import com.teulda.service.diary.DiaryDao;
import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Diary;

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
	// 기록 등록을 위한 비즈니스 수행
	public void addDiary(Diary diary) throws Exception {
		diaryDao.addDiary(diary);
	}

	@Override
	// 기록 그룹 등록을 위한 비즈니스 수행
	public void addDiaryGroup(Group group) throws Exception {
		diaryDao.addDiaryGroup(group);
	}

	@Override
	// 기록 조회를 위한 비즈니스 수행
	public Diary getDiary(int diaryNo) throws Exception {
		return diaryDao.getDiary(diaryNo); // 해시태그는 어떡하지? 
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
	// 기록 수정을 위한 비즈니스 수행 
	public void updateDiary(Diary diary) throws Exception {
		diaryDao.updateDiary(diary);
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
