package com.teulda.diary.test;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Diary;

/*
 *	FileName :  DiaryServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */

@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data 를 다양하게 Wiring 하자...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })

public class DiaryServiceTest {
	
	// ==> @RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;
	
	@Test
	public void testAddDiary() throws Exception {
		
		Diary diary = new Diary();
		diary.setTitle("제주도에 왔어요!");
		diary.setLocation("제주도 돌하르방 앞에서");
		diary.setLatitude(59.684153857);
		diary.setLongitude(128.875156);
		diary.setNickname("king주원");
		diary.setStartDate("21-01-15");
		diary.setEndDate("21-01-16");
		diary.setContent("한라봉 천혜향 레드향을 먹었다네요");
		diary.setThumbnail("hanrabong.jpg");
		diary.setGroupNo(10025);
		diary.setCurrency("달러");
		diary.setIsPublic('t');
		
		System.out.println("실행?");
		System.out.println(diary);
		diaryService.addDiary(diary);
		System.out.println("실행?2");
		
//		diaryService.getDiary(10006);
//		Assert.assertEquals("제목", diary.getTitle());
	}

}
