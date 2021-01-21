package com.teulda.web.subscribe;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.teulda.service.domain.Subscribe;
import com.teulda.service.domain.User;
import com.teulda.service.subscribe.SubscribeService;

@RestController
@RequestMapping("/subscribe/*")
public class SubscribeRestController {

	@Autowired
	@Qualifier("subscribeServiceImpl")
	private SubscribeService subscribeService;
	
	@Value("#{commonProperties['pageUnit']}")
//	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
//	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	Timestamp dateTime = Timestamp.valueOf(LocalDateTime.now().withNano(0));
	
	public SubscribeRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="rest/addSubscribe/{nickname}", method=RequestMethod.GET)
	public boolean addSubscribe(@PathVariable String nickname, HttpSession session) throws Exception{
		
		System.out.println("/subscribe/rest/addSubscribe : GET");
		
		Subscribe subscribe = new Subscribe();
		User user = (User) session.getAttribute("user");
		subscribe.setSubNickname(user.getNickname());
		subscribe.setSubTargetNickname(nickname);
		subscribe.setSubscribeDate(dateTime);
		
		return subscribeService.addSubscribe(subscribe);
	}
	
	@RequestMapping(value="rest/deleteSubscribe/{nickname}", method=RequestMethod.GET)
	public boolean deleteSubscribe(@PathVariable String nickname, HttpSession session) throws Exception{
		
		System.out.println("/subscribe/rest/addSubscribe : GET");
		
		Subscribe subscribe = new Subscribe();
		User user = (User) session.getAttribute("user");
		subscribe.setSubNickname(user.getNickname());
		subscribe.setSubTargetNickname(nickname);
		
		return subscribeService.deleteSubscribe(subscribe);
	}
	
	@RequestMapping(value="rest/checkSubscribe/", method=RequestMethod.GET)
	public boolean checkSubscribe(@ModelAttribute("user") User targetuser, HttpSession session) throws Exception{
		
		System.out.println("/subscribe/rest/checkSubscribe : GET");
		
		Subscribe subscribe = new Subscribe();
		User user = (User) session.getAttribute("user");
		subscribe.setSubNickname(user.getNickname());
		subscribe.setSubTargetNickname(targetuser.getNickname());
		
		return subscribeService.checkSubscribe(subscribe);
	}
}
