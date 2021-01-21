package com.teulda.web.subscribe;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.teulda.service.domain.Subscribe;
import com.teulda.service.domain.User;
import com.teulda.service.subscribe.SubscribeService;

@Controller
@RequestMapping("/subscribe/*")
public class SubscribeController {

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
	
	public SubscribeController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="getSubscribeList", method=RequestMethod.GET)
	public String getSubscribeList(@RequestParam("nickname") String nickname, Model model) throws Exception {
		
		System.out.println("/subscribe/getSubscribeList : GET");
		
		System.out.println(nickname);
		List<Subscribe> subscribeList = subscribeService.getSubscribeList(nickname);
		
		model.addAttribute("subscribeList", subscribeList);
		
		return "forward:/subscribe/listSubscribe.jsp";
	}
	
	@RequestMapping(value="getSubscribeList", method=RequestMethod.POST)
	public String getSubscribeList(HttpSession session, Model model) throws Exception {
		
		System.out.println("/subscribe/getSubscribeList : POST");
		
		User user = (User) session.getAttribute("user");
		List<Subscribe> subscribeList = subscribeService.getSubscribeList(user.getNickname());
		
		model.addAttribute("subscribeList", subscribeList);
		
		return "forward:/subscribe/listSubscribe.jsp";
	}
	
//	@RequestMapping(value="addSubscribe", method=RequestMethod.GET)
//	public String addSubscribe(@RequestParam("nickname") String targetNickname, HttpSession session) throws Exception{
//		
//		System.out.println("/subscribe/addSubscribe : GET");
//		
//		User user = (User) session.getAttribute("user");
//		Subscribe subscribe = new Subscribe();
//		subscribe.setSubNickname(user.getNickName());
//		subscribe.setSubTargetNickname(targetNickname);
//		subscribe.setSubscribeDate(dateTime);
//		
//		subscribeService.addSubscribe(subscribe);
//		
//		return null;
//	}
	
//	@RequestMapping(value="deleteSubscribe", method=RequestMethod.GET)
//	public String deleteSubscribe(@RequestParam("nickname") String targetNickname, HttpSession session) throws Exception{
//		
//		System.out.println("/subscribe/deleteSubscribe : GET");
//		
//		User user = (User) session.getAttribute("user");
//		Subscribe subscribe = new Subscribe();
//		subscribe.setSubNickname(user.getNickName());
//		subscribe.setSubTargetNickname(targetNickname);
//		
//		subscribeService.deleteSubscribe(subscribe);
//		
//		return null;
//	}
}
