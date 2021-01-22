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

import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.Subscribe;
import com.teulda.service.domain.User;
import com.teulda.service.subscribe.SubscribeService;

@Controller
@RequestMapping("/subscribe/*")
public class SubscribeController {

	@Autowired
	@Qualifier("subscribeServiceImpl")
	private SubscribeService subscribeService;
	
	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;
	
	@Value("#{commonProperties['pageUnit']}")
//	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
//	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	LocalDateTime localDateTime = LocalDateTime.now().withNano(0);
	Timestamp currentdateTime = Timestamp.valueOf(localDateTime);
	Timestamp dateTimeWeekBefore = Timestamp.valueOf(localDateTime.minusWeeks(1));
	Timestamp dateTimeMonthBefore = Timestamp.valueOf(localDateTime.minusMonths(1));
	
	public SubscribeController(){
		System.out.println(this.getClass());
	}

	@RequestMapping(value="listSubscribe")
	public String getSubscribeList(HttpSession session, Model model) throws Exception {
		
		System.out.println("/subscribe/listSubscribe : GET / POST");
		
		User user = (User) session.getAttribute("user");
		List<Subscribe> subscribeList = subscribeService.getSubscribeInfoList(user.getNickname());
		
		List<String> subscriberList = subscribeService.getSubscriberList(user.getNickname());
		
		List<Diary> diaryListWeekBefore = diaryService.getSubscriberDiaryPeriodList(subscriberList, dateTimeWeekBefore, currentdateTime);
		List<Diary> diaryListMonthBefore = diaryService.getSubscriberDiaryPeriodList(subscriberList, dateTimeMonthBefore, dateTimeWeekBefore);
		List<Diary> diaryListBefore = diaryService.getSubscriberDiaryList(subscriberList, dateTimeMonthBefore);
		
		model.addAttribute("subscribeList", subscribeList);
		model.addAttribute("diaryListWeekBefore", diaryListWeekBefore);
		model.addAttribute("diaryListMonthBefore", diaryListMonthBefore);
		model.addAttribute("diaryListBefore", diaryListBefore);
		
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
