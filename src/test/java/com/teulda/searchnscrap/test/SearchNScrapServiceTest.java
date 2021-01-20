package com.teulda.searchnscrap.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.common.Group;
import com.teulda.common.Search;
import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Diary;
import com.teulda.service.searchnscrap.SearchNScrapDao;
import com.teulda.service.searchnscrap.SearchNScrapService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class SearchNScrapServiceTest {

	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;
	
	@Autowired
	@Qualifier("searchNScrapServiceImpl")
	private SearchNScrapService searchNScrapService;
	
	@Autowired
	@Qualifier("searchNScrapDaoImpl")
	private SearchNScrapDao searchNScrapDao;
	
	//스크랩 등록
	//@Test
	public void testAddScrap() throws Exception{
		
		Diary diary = diaryService.getDiary(10044); // 스크랩할 기록 가져오기
		System.out.println("스크랩한 diary : "+diary); // 가져온 기록 확인
		diary.setScrapNickname("king정인");
		
		searchNScrapService.addScrap(diary); // 가져온 기록 스크랩에 등록

		System.out.println("Scrap 끝!!"); // test 종료
	}
	
	//스크랩 그룹 등록
	//@Test
	public void testAddScrapGroup() throws Exception{
		
		Group group = new Group();
		group.setGroupName("testGroupName");
		group.setNickname("king정인");
		
		searchNScrapService.addScrapGroup(group);
	}
	
	//스크랩한 기록 조회
	//@Test
	public void testGetScrap() throws Exception{
		
		Diary diary = diaryService.getDiary(10044);
		System.out.println(diary);
	}
	
	//스크랩 그룹 조회
	//@Test
	public void testGetDiaryGroupList() throws Exception {
		List<Group> diaryGroupList = diaryService.getDiaryGroupList("king정인");
		System.out.println(diaryGroupList);
	}
	
	//스크랩 리스트 조회
	//@Test
	public void testGetScrapList() throws Exception{
		
		Search search = new Search();
		search.setPageSize(5);
		search.setCurrentPage(2);
		
		Map<String, Object> map = searchNScrapService.getScrapList(search, "king정인", 'f');
		System.out.println(map);
	}
	
	//스크랩 수정
	//@Test
	public void testUpdateScrap() throws Exception{
		
		Diary diary = diaryService.getDiary(10045);
		
		diary.setTitle("제주도에 갔데!!");
		diary.setLocation("제주앞바~다");
		
		System.out.println(diary);
		
		diaryService.updateDiary(diary);
		
	}

	//스크랩 삭제 플래그처리
	//@Test
	public void testUpdateScrapStatus() throws Exception{
		Diary diary = diaryService.getDiary(10045);
		diaryService.updateDiaryStatus(diary);
	}
	
	//스크랩 그룹변경
	//@Test
	public void testUpdateScrapGroup() throws Exception{
		Diary diary = diaryService.getDiary(10045); // 다이어리 가져옴
		diary.setGroupNo(10019);
		diaryService.updateDiaryGroup(diary);
		
		Diary diary2 = diaryService.getDiary(10045);
		System.out.println(diary2);
	}
	
	//스크랩 삭제
	//@Test
	public void testDeleteScrap() throws Exception{
		diaryService.deleteDiary(10045);
	}

	//해시태그 삭제
	//@Test
	public void testDeleteHashTag() throws Exception{
		diaryService.deleteHashTag(10000);
	}
	
	//사진삭제
	//@Test
	public void testDeletePhoto() throws Exception{
		diaryService.deletePhoto(10000);
	}
	
	//스크랩그룹 삭제
	//@Test
//	public void testDeleteGroup() throws Exception{
//		diaryService.deleteGroup(10000);
//	}
}
