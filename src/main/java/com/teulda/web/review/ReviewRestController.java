package com.teulda.web.review;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.teulda.service.domain.User;
import com.teulda.service.review.ReviewService;

@RestController
@RequestMapping("/review/*")
public class ReviewRestController {

	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;
	
	public ReviewRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
//	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
//	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="rest/deleteReview/{reviewNo}", method=RequestMethod.GET)
	public boolean deleteReview(@PathVariable int reviewNo, HttpSession session) throws Exception{
		
		System.out.println("/review/rest/deleteReview : GET");
		
		if(session == null) {
			throw new Exception();
			
		}else if(session.getAttribute("user") != null && session.getAttribute("user") instanceof User){
			User user = (User) session.getAttribute("user");
			
			if(user.getNickname().equals(reviewService.getReview(reviewNo).getNickname())){
				reviewService.deleteReview(reviewNo);
				return true;
			}
		}
		
		return false;
	}
}
