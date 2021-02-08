package com.teulda.service.diary;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.teulda.common.Group;
import com.teulda.common.Search;
import com.teulda.service.domain.Diary;

//기록관리 서비스 비즈니스 로직을 추상화한 interface
public interface DiaryService {

	// 기록 등록 - 완료
	public void addDiary(Diary diary) throws Exception;

	// 기록 그룹 등록 - 완료
	public void addDiaryGroup(Group group) throws Exception;
	
	// 방금 등록한 기록 번호 조회 
	public int getLatestDiaryNo(String nickname) throws Exception;

	// 기록 조회 - 완료
	public Diary getDiary(int diaryNo) throws Exception;
	
	// 기록 그룹 목록 리스트 보여줄때 그룹에 속한 기록이 몇개인지 알 때 쓰임 (0개면 그룹 삭제 가능, 1개이상이면 삭제 불가능) 
	public int getMyDiaryCountByGroup(int groupNo) throws Exception;
	
	// 기록 그룹 목록 리스트 (사용자가 어떤 그룹에 넣을지 선택할때 그룹 목록 리스트 필요할듯) - 완료
	public List<Group> getDiaryGroupList(String nickname) throws Exception;
	
	// 내 기록 목록 리스트 - 내 기록 지도에서 쓰임
	public Map<String, Object> getMyDiaryList(String nickname) throws Exception;
	
	// 내 기록 목록 리스트 - 특정 그룹에 속한 기록만 뽑아올때 쓰임 
	public Map<String, Object> getMyDiaryList(int groupNo) throws Exception;
	
	// 내 기록 목록 리스트 - 내 기록 목록, 휴지통에서 쓰임 - 완료
	public Map<String, Object> getMyDiaryList(Search search, String nickname, char isDelete) throws Exception;
	
	// 기록 목록 리스트 - 통합검색시 기록 목록 보여줄때 사용 
	public Map<String, Object> getDiaryList(Search search) throws Exception;
	
	// 기록 목록 리스트 - 통합검색시 해시태그에 관한 기록 목록 보여줄때 사용 
	public Map<String, Object> getDiaryListByHashTag(Search search) throws Exception;

	// 기록 수정 - 완료
	public void updateDiary(Diary diary) throws Exception;

	// 기록 상태 변경 - 복원하거나, 삭제해서 휴지통 안에 넣거나! - 완료 
	public void updateDiaryStatus(Diary diary) throws Exception;

	// 기록 그룹 변경 - 완료
	public void updateDiaryGroup(Diary diary) throws Exception;
	
	// 기록 조회수 증가 - getDiary 할 때 내가 쓴 글이 아니면 조회수 증가하게끔 Controller에서 구현해주기 - 완료
	public void updateDiaryViewCount(int diaryNo) throws Exception;
	
//	// 스크랩 추가 할 시 스크랩 추가 횟수 증가 (addScrap 할 때 이 메소드 같이 돌려주기) 
//	public void updateDiaryScrapCount(int diaryNo) throws Exception;
//	
//	// 스크랩 추가 할 시 회원 계정에서 스크랩 추가 횟수 증가 (addScrap 할 때 이 메소드 같이 돌려주기) 
//	public void updateUserScrapCount(String originNickname) throws Exception;

	// 기록 영구삭제 - 완료
	public void deleteDiary(int diaryNo) throws Exception;
	
	// 해시태그 삭제 (기록 수정시 사용) - ajax 이용 할 듯? RestController - 완료 
	public void deleteHashTag(int hashTagNo) throws Exception;
	
	// 기록 사진 (아마도 기념품 사진) 삭제 (기록 수정시 사용) - ajax 이용 할 듯? RestController - 완료 
	public void deletePhoto(int photoNo) throws Exception;
	
	// 그룹 삭제 (기록 그룹, 스크랩 그룹 삭제) 
	public void deleteGroup(int groupNo) throws Exception;

	// 기록을 책 형식으로 인쇄
	public void printDiary(Diary diary) throws Exception;

	// 구독자 기록 목록 조회
	public List<Diary> getSubscriberDiaryList(List<String> subscriberList, Timestamp start) throws Exception;
	public List<Diary> getSubscriberDiaryPeriodList(List<String> subscriberList, Timestamp start, Timestamp end) throws Exception;
}
