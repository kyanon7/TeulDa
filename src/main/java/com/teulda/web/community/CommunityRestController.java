package com.teulda.web.community;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.teulda.service.community.CommunityService;
import com.teulda.service.domain.Subscribe;
import com.teulda.service.domain.User;

@RestController
@RequestMapping("/community/*")
public class CommunityRestController {

	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Value("#{commonProperties['pageUnit']}")
//	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
//	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	Timestamp dateTime = Timestamp.valueOf(LocalDateTime.now().withNano(0));
	
	public CommunityRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="rest/addSubscribe/{nickname}", method=RequestMethod.GET)
	public boolean addSubscribe(@PathVariable String nickname, HttpSession session) throws Exception{
		
		System.out.println("/community/rest/addSubscribe : GET");
		
		Subscribe subscribe = new Subscribe();
		User user = (User) session.getAttribute("user");
		subscribe.setSubNickname(user.getNickName());
		subscribe.setSubTargetNickname(nickname);
		subscribe.setSubscribeDate(dateTime);
		
		return communityService.addSubscribe(subscribe);
	}
	
}
