package com.teulda.diary.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;
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
		diary.setStartDate("2021-01-15");
		diary.setEndDate("2021-01-17");
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
		
//		Diary diary2 = diaryService.getDiary(10001);
//		Assert.assertEquals("제주도에 왔어요!", diary2.getTitle());
	}
	
	//@Test
	public void testAddDiaryGroup() throws Exception {
		
		Group group = new Group();
		group.setGroupName("겨울여행");
		group.setNickname("king주원");
		
		diaryService.addDiaryGroup(group);
	}
	
	//@Test
	public void testGetDiary() throws Exception {
		Diary diary2 = diaryService.getDiary(10081);
		Assert.assertEquals("제주도에 왔어요!", diary2.getTitle());
	}
	
	//@Test
	public void testUpdateDiary() throws Exception {
		Diary diary = new Diary();
		diary.setDiaryNo(10082);
		diary.setTitle("변경한 제목!");
		diary.setLocation("광안대교 앞에서"); // Google Map 주소 받아옴
		diary.setLatitude(60.684153857); // Google Map 위도 좌표 
		diary.setLongitude(130.875156); // Google Map 경도 좌표  
		diary.setStartDate("21-01-17");
		diary.setEndDate("21-01-18");
		diary.setContent("요트를 탔다네요"); // 내용 
		diary.setThumbnail("yoyo.jpg");
		diary.setCurrency("원화");
		diary.setIsPublic('f'); // 비공개 
		
		// 기존 해시태그 삭제
		diaryService.deleteHashTag(10023);
		
		// 기존 사진 삭제 (기념품 사진일듯)
		diaryService.deletePhoto(10007);
		
		// ========= 해시태그 추가 등록 =============
		HashTag hashTag1 = new HashTag();
		hashTag1.setHashTagName("겨울바다");
		
		HashTag hashTag2 = new HashTag();
		hashTag2.setHashTagName("제주도바다");
		
		List<HashTag> hashTagList = new ArrayList<HashTag>();
		hashTagList.add(hashTag1);
		hashTagList.add(hashTag2);
		
		diary.setHashTagList(hashTagList);
		// ===============================
		
		// ============= 사진 추가 등록 =============
		Photo photo1 = new Photo();
		photo1.setPhotoName("test1.jpg");
		photo1.setDescription("눈온다!");
		
		Photo photo2 = new Photo();
		photo2.setPhotoName("test2.jpg");
		
		List<Photo> photoList = new ArrayList<Photo>();
		photoList.add(photo1);
		photoList.add(photo2);
		
		diary.setPhotoList(photoList);
		// ===============================
	
		System.out.println(diary);
		diaryService.updateDiary(diary);
		
		Diary diary2 = diaryService.getDiary(10055);
		Assert.assertEquals("변경한 제목!", diary2.getTitle());
	}
	
	//@Test 
	// 다이어리 복원 & 다이어리 삭제 (휴지통 이동) 
	public void testUpdateDiaryStatus() throws Exception {
		
		Diary diary = diaryService.getDiary(10057); // 다이어리 가져옴
		diaryService.updateDiaryStatus(diary);
		
		Diary diary2 = diaryService.getDiary(10055);
		System.out.println(diary2);
	}
	
	//@Test 
	public void testUpdateDiaryGroup() throws Exception {
		
		Diary diary = diaryService.getDiary(10055); // 다이어리 가져옴
		diary.setGroupNo(10040);
		diaryService.updateDiaryGroup(diary);
		
		Diary diary2 = diaryService.getDiary(10055);
		System.out.println(diary2);
	}
	
	//@Test 
	public void testDeleteDiary() throws Exception {
		
		diaryService.deleteDiary(10054);
	}
	
	//@Test 
	public void testGetDiaryGroupList() throws Exception {
		List<Group> diaryGroupList = diaryService.getDiaryGroupList("king주원");
		System.out.println(diaryGroupList);
	}
	
	//@Test
	public void testUpdateDiaryViewCount() throws Exception {
		
		diaryService.updateDiaryViewCount(10056);
	}
	
	//@Test 
	public void testGetMyDiaryList() throws Exception {
		
		Search search = new Search();
		search.setPageSize(5);
		search.setCurrentPage(2);
		
		// 삭제되지 않은 기록 
		Map <String, Object> map = diaryService.getMyDiaryList(search, "king주원", 'f');
		System.out.println(map);
	}
	
	//@Test 
	public void testGetMyDiaryListForMap() throws Exception {
		
		// 삭제되지 않은 기록 
		Map <String, Object> map = diaryService.getMyDiaryList("king주원");
		System.out.println(map);
	}
	
	//@Test
	public void testGetDiaryList() throws Exception {
		
		Search search = new Search();
		search.setPageSize(5);
		search.setCurrentPage(1);
		
		search.setSearchKeyword("채경");
		search.setSearchCondition("3");
		search.setSearchSorting("2");
		
		// 통합검색에서 검색조건에 맞춰서 기록 불러올때 
		Map <String, Object> map = diaryService.getDiaryList(search);
		System.out.println(map);
		
	}
	
	//@Test
	public void testUpdateDiaryScrapCount() throws Exception {
		
//		diaryService.updateDiaryScrapCount(10056);
//		diaryService.updateDiaryScrapCount(10057);
		
	}
	
	//@Test
	public void testUpdateUserScrapCount() throws Exception {
		
//		diaryService.updateUserScrapCount("king영진");
	}
	
	//@Test
	public void testDeleteGroup() throws Exception {
		diaryService.deleteGroup(10060);
	}
}
