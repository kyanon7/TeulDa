package com.teulda.subscribe.test;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.common.Search;
import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.Subscribe;
import com.teulda.service.domain.User;
import com.teulda.service.subscribe.SubscribeService;
import com.teulda.service.user.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class SubscribeServiceTest {
	
	@Autowired
	@Qualifier("subscribeServiceImpl")
	private SubscribeService subscribeService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;
	
	int subscribeNo = 10000;
    Timestamp dateTime = Timestamp.valueOf(LocalDateTime.now().withNano(0));
    
	LocalDateTime localDateTime = LocalDateTime.now().withNano(0);
	Timestamp currentdateTime = Timestamp.valueOf(localDateTime);
	Timestamp dateTimeWeekBefore = Timestamp.valueOf(localDateTime.minusWeeks(1));
	Timestamp dateTimeMonthBefore = Timestamp.valueOf(localDateTime.minusMonths(1));
	
    //@Test
    public void testGetUserList() throws Exception{
    	
		 Search search = new Search();
		 search.setCurrentPage(1);
		 search.setPageSize(10);
		 Map<String, Object> map = userService.getUserList(search); 
		 List<Object> list= (List<Object>)map.get("list");
		 
		 Integer totalCount = (Integer)map.get("totalCount");
		 
		 System.out.println(list);//확인
		 System.out.println(totalCount);//확인
		 
	}
	
	// 구독 추가
	//@Test
	public void testAddSubscribe() throws Exception{
		
		Subscribe subscribe = new Subscribe();
		subscribe.setSubscribeDate(dateTime);
		
		String list[] = {"king성영", "king주원", "king정인", "king채경", "king제현", "testUser0", "testUser1", "testUser2", "testUser3", "testUser4", "testUser5", "testUser7", "testUser8", "testUser9"};
		List<String> userList = Arrays.asList(list);
//		List<String> userList = new ArrayList<String>(Arrays.asList(list));
		
		for(String each : userList) {
			for(String other : userList) {
				if(!each.equals(other)) {
					subscribe.setSubNickname(each);
					subscribe.setSubTargetNickname(other);
					subscribeService.addSubscribe(subscribe);
				}
			}
		}
	}
	
	// 구독 목록
	//@Test
	public void testGetSubscribeList() throws Exception{

		String subscribeNick = "king성영";
		List<Subscribe> list = subscribeService.getSubscribeInfoList(subscribeNick);
		
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
		subscribeService.deleteSubscribe(subscribe);
	}
	
	// 구독 여부 확인
	//@Test
	public void testCheckSubscribe() throws Exception{
		
		Subscribe subscribe = new Subscribe();
		subscribe.setSubNickname("king성영");
		subscribe.setSubTargetNickname("king주원");
		
		System.out.println(subscribeService.checkSubscribe(subscribe));
		
	}
	
	@Test
	public void testgetSubscribeDiaryList() throws Exception{
		
		String subscribeNick = "king주원";
		
		List<String> subscriberList = subscribeService.getSubscriberList(subscribeNick);
		
		List<Diary> diaryListWeekBefore = diaryService.getSubscriberDiaryPeriodList(subscriberList, dateTimeWeekBefore, currentdateTime);
		List<Diary> diaryListMonthBefore = diaryService.getSubscriberDiaryPeriodList(subscriberList, dateTimeMonthBefore, dateTimeWeekBefore);
		List<Diary> diaryListBefore = diaryService.getSubscriberDiaryList(subscriberList, dateTimeMonthBefore);
		
		System.out.println(diaryListWeekBefore);
		System.out.println(diaryListMonthBefore);
		System.out.println(diaryListBefore);
		
	}
}
