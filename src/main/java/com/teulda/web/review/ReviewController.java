package com.teulda.web.review;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.teulda.common.Page;
import com.teulda.common.Search;
import com.teulda.service.domain.Review;
import com.teulda.service.domain.User;
import com.teulda.service.review.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;
	
	public ReviewController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
//	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
//	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="addReview", method=RequestMethod.GET)
	public String addReview() throws Exception{
		
		System.out.println("/review/addReview : GET");
		
		return "redirect:/review/addReview.jsp";
	}
	
	@RequestMapping(value="addReview", method=RequestMethod.POST)
	public String addReview(@ModelAttribute("review") Review review, HttpSession session) throws Exception{
		
		System.out.println("/review/addReview : POST");
		
		if(session == null) {
			throw new Exception();
			
		}else if(session.getAttribute("user") != null && session.getAttribute("user") instanceof User){
			User user = (User) session.getAttribute("user");
			review.setNickname(user.getNickname());
			reviewService.addReview(review);
		}
		
		return "redirect:/review/listReview";
	}
	
	@RequestMapping(value="getReview", method=RequestMethod.GET)
	public String getReview(@RequestParam int reviewNo, Model model) throws Exception{
		
		System.out.println("/review/getReview : GET");
		
		Review review = reviewService.getReview(reviewNo);
		
		model.addAttribute("review", review);
		
		return "forward:/review/getReview.jsp";
	}
	
	@RequestMapping(value="listReview")
	public String listReview(HttpSession session, Model model, @ModelAttribute("search") Search search) throws Exception{
		
		System.out.println("/review/listReview : GET / POST");
		
		User user = (User) session.getAttribute("user");
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setSearchSorting("0");
		search.setSearchCondition("3");
		search.setSearchKeyword(user.getNickname());
		
		Map<String, Object> map = reviewService.getReviewList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/review/listReview.jsp";
	}
	
	@RequestMapping(value="updateReview", method=RequestMethod.GET)
	public String updateReview(@RequestParam int reviewNo, Model model, HttpSession session) throws Exception{
		
		System.out.println("/review/updateReview : GET");
		
		if(session == null) {
			throw new Exception();
			
		}else if(session.getAttribute("user") != null && session.getAttribute("user") instanceof User){
			User user = (User) session.getAttribute("user");
			Review review = reviewService.getReview(reviewNo);
			String writer = review.getNickname();
			
			if(writer.equals(user.getNickname())) {
				model.addAttribute("review", review);
			}else {
				throw new Exception();
			}
		}
		
		return "forward:/review/updateReview.jsp";
	}
	
	@RequestMapping(value="updateReview", method=RequestMethod.POST)
	public String updateReview(@ModelAttribute("review") Review review) throws Exception{
		
		System.out.println("/review/updateReview : POST");
		
		reviewService.updateReview(review);
		
		return "redirect:/review/getReview?reviewNo="+review.getReviewNo();
	}
	
	@RequestMapping(value="listTotalReview")
	public String listTotalReview(Search search, Model model) throws Exception{
		
		System.out.println("/review/listTotalReview");
		
		if (search.getSearchSorting() == null || search.getSearchSorting().equals(null)) {
			search.setSearchSorting("0");
		}
		
		model.addAttribute("search", search);
		
		return "forward:/search/listTotalReview.jsp";
	}
	
}
