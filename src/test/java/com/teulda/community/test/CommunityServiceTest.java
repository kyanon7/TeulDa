package com.teulda.community.test;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.service.community.CommunityDao;
import com.teulda.service.community.CommunityService;
import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.Subscribe;

import junit.framework.Assert;

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
	
	@Autowired
	@Qualifier("communityDaoImpl")
	private CommunityDao communityDao;
	
	int subscribeNo = 10000;
    Timestamp dateTime = Timestamp.valueOf(LocalDateTime.now().withNano(0));
	
	//스크랩 등록
	//@Test
	public void testAddScrap() throws Exception{
		
		Diary diary = diaryService.getDiary(10017); // 스크랩할 기록 가져오기
		System.out.println("스크랩한 diary : "+diary); // 가져온 기록 확인
		diary.setScrapNickname("king정인");

		communityService.addScrap(diary); // 가져온 기록 스크랩에 등록

		System.out.println("Scrap 끝!!"); // test 종료
	}
	
	//스크랩한 기록 조회
	//@Test
	public void testGetScrap() throws Exception{
		
		Diary diary = diaryService.getDiary(10017);
		System.out.println(diary);
	}
	
	// 구독 추가
	//@Test
	public void testAddSubscribe() throws Exception{
		
		Subscribe subscribe = new Subscribe();
		subscribe.setSubscribeDate(dateTime);
		
		String list[] = {"king성영", "king주원", "king정인", "king채경", "king제현"};
		List<String> userList = Arrays.asList(list);
//		List<String> userList = new ArrayList<String>(Arrays.asList(list));
		
		for(String each : userList) {
			for(String other : userList) {
				if(!each.equals(other)) {
					subscribe.setSubNickname(each);
					subscribe.setSubTargetNickname(other);
					communityService.addSubscribe(subscribe);
				}
			}
		}
	}
	
	// 구독 목록
	//@Test
	public void testGetSubscribeList() throws Exception{

		String subscribeNick = "king성영";
		List<Subscribe> list = communityService.getSubscribeList(subscribeNick);
		
		for(Subscribe each : list) {
			System.out.println(each);
		}
	}
	
	// 구독 취소
	//@Test
	public void testDeleteSubscribe() throws Exception{
		
		Subscribe subscribe = new Subscribe();
		subscribe.setSubNickname("king성영");
		subscribe.setSubTargetNickname("king주원");
		
		System.out.println(subscribe);
		communityService.deleteSubscribe(subscribe);
	}
	
	// 구독 여부 확인
	//@Test
	public void testCheckSubscribe() throws Exception{
		
		Subscribe subscribe = new Subscribe();
		subscribe.setSubNickname("king성영");
		subscribe.setSubTargetNickname("king주원");
		
		System.out.println(communityDao.checkSubscribe(subscribe));
		
	}
}
