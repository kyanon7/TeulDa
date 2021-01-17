package com.teulda.diary.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.HashTag;

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
	
	//@Test
	public void testAddDiary() throws Exception {
		
		Diary diary = new Diary();
		diary.setTitle("제주도에 왔어요!");
		diary.setLocation("제주도 돌하르방 앞에서"); // Google Map 주소 받아옴
		diary.setLatitude(59.684153857); // Google Map 위도 좌표 
		diary.setLongitude(128.875156); // Google Map 경도 좌표 
		diary.setNickname("king주원"); // 구현시 닉네임은 세션 사용해서 뽑아옴  
		diary.setStartDate("21-01-15");
		diary.setEndDate("21-01-17");
		diary.setContent("한라봉 천혜향 레드향을 먹었다네요"); // 내용 
		diary.setThumbnail("hanrabong.jpg");
		diary.setCurrency("달러");
		diary.setIsPublic('t'); // 공개 
		
		// ========= 해시태그 =============
		HashTag hashTag1 = new HashTag();
		hashTag1.setHashTagName("겨울여행");
		
		HashTag hashTag2 = new HashTag();
		hashTag2.setHashTagName("제주도여행");
		
		List<HashTag> hashTagList = new ArrayList<HashTag>();
		hashTagList.add(hashTag1);
		hashTagList.add(hashTag2);
		
		diary.setHashTagList(hashTagList);
		// ===============================
		
		// ============= 사진 =============
		Photo photo1 = new Photo();
		photo1.setPhotoName("a.jpg");
		photo1.setDescription("눈온다!");
		
		Photo photo2 = new Photo();
		photo2.setPhotoName("b.jpg");
		
		List<Photo> photoList = new ArrayList<Photo>();
		photoList.add(photo1);
		photoList.add(photo2);
		
		diary.setPhotoList(photoList);
		// ===============================
	
		System.out.println(diary);
		diaryService.addDiary(diary);
		
		Diary diary2 = diaryService.getDiary(10042);
		Assert.assertEquals("제주도에 왔어요!", diary2.getTitle());
	}
	
	//@Test
	public void testAddDiaryGroup() throws Exception {
		
		Group group = new Group();
		group.setGroupName("겨울여행");
		group.setNickname("king주원");
		
		diaryService.addDiaryGroup(group);
	}
	
	@Test
	public void testGetDiary() throws Exception {
		Diary diary2 = diaryService.getDiary(10042);
		Assert.assertEquals("제주도에 왔어요!", diary2.getTitle());
	}

}
