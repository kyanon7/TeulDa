package com.teulda.subscribe.test;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.service.domain.Subscribe;
import com.teulda.service.subscribe.SubscribeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class SubscribeServiceTest {
	
	@Autowired
	@Qualifier("subscribeServiceImpl")
	private SubscribeService subscribeService;
	
	int subscribeNo = 10000;
    Timestamp dateTime = Timestamp.valueOf(LocalDateTime.now().withNano(0));
	
	
	// 구독 추가
	@Test
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
					subscribeService.addSubscribe(subscribe);
				}
			}
		}
	}
	
	// 구독 목록
	//@Test
	public void testGetSubscribeList() throws Exception{

		String subscribeNick = "king성영";
		List<Subscribe> list = subscribeService.getSubscribeList(subscribeNick);
		
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
}
