package com.teulda.service.diary;

import java.util.Map;

import com.teulda.common.Group;
import com.teulda.common.Search;
import com.teulda.service.domain.Diary;

//기록관리 서비스 비즈니스 로직을 추상화한 interface
public interface DiaryService {

	// 기록 등록
	public void addDiary(Diary diary) throws Exception;

	// 기록 그룹 등록
	public void addDiaryGroup(Group group) throws Exception;

	// 기록 조회
	public Diary getDiary(int diaryNo) throws Exception;

	// 기록 목록 리스트
	public Map<String, Object> getDiaryList(Search search, String nickname) throws Exception;

	// 기록 수정
	public void updateDiary(Diary diary) throws Exception;

	// 기록 상태 변경 - 복원하거나, 삭제해서 휴지통 안에 넣거나!
	public void updateDiaryStatus(Diary diary) throws Exception;

	// 기록 그룹 변경
	public void updateDiaryGroup(Diary diary) throws Exception;

	// 기록 영구삭제
	public void deleteDiary(int diaryNo) throws Exception;

	// 기록을 책 형식으로 인쇄
	public void printDiary(Diary diary) throws Exception;

}
