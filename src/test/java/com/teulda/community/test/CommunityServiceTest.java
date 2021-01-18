package com.teulda.community.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.service.community.CommunityService;
import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Diary;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class CommunityServiceTest {
	
	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	//스크랩 등록
	@Test
	public void testAddScrap() throws Exception{
		
		Diary diary = diaryService.getDiary(10017); // 스크랩할 기록 가져오기
		System.out.println("스크랩한 diary : "+diary); // 가져온 기록 확인
		diary.setScrapNickname("king정인");

		communityService.addScrap(diary); // 가져온 기록 스크랩에 등록

		System.out.println("Scrap 끝!!"); // test 종료
	}
}
