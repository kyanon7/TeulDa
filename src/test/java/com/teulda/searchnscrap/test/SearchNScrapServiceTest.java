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
	
	//@Test
	public void testGetGroupList() throws Exception{
			
		Group group = new Group();
		group.setNickname("king정인");
		
		System.out.println("Junit Test : "+group);
		
		Map<String, Object> map = searchNScrapService.getGroupList(group);
		
		List<Object> list = (List<Object>)map.get("groupList");
		System.out.println("groupList : "+list);
		
	}
}
