package com.teulda.service.diary;

import java.util.List;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.HashTag;

//==> 기록관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface DiaryDao {

	// INSERT
	public void addDiary(Diary diary) throws Exception;
	
	// INSERT
	public void addHashTag(HashTag hashTag) throws Exception;
	
	// INSERT
	public void addPhoto(Photo photo) throws Exception;

	// INSERT
	public void addDiaryGroup(Group group) throws Exception;

	// SELECT ONE
	public Diary getDiary(int diaryNo) throws Exception;
	
	// SELECT LIST
	public List<HashTag> getHashTagList(int diaryNo) throws Exception;
	
	// SELECT LIST
	public List<Photo> getPhotoList(int diaryNo) throws Exception;

	// SELECT LIST
	public List<Diary> getDiaryList(Search search, String nickname) throws Exception;

	// 게시판 Page 처리를 위한 전체 Row(totalCount) return
	public int getDiaryCount(String nickname) throws Exception;

	// UPDATE (기록 수정)
	public void updateDiary(Diary diary) throws Exception;

	// UPDATE (기록 상태 수정 - 삭제/복원)
	public void updateDiaryStatus(Diary diary) throws Exception;

	// UPDATE (기록 그룹 수정 - 그룹 옮김)
	public void updateDiaryGroup(Diary diary) throws Exception;

	// UPDATE (기록 조회수 증가)
	public void updateDiaryViewCount(int diaryNo) throws Exception;

	// DELETE
	public void deleteDiary(int diaryNo) throws Exception;

}
