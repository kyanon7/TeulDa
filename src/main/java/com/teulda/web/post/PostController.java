package com.teulda.web.post;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teulda.common.Page;
import com.teulda.common.Search;
import com.teulda.service.domain.Post;
import com.teulda.service.domain.User;
import com.teulda.service.post.PostService;

	@Controller
	@RequestMapping("/post/*")
	public class PostController {

	@Autowired
	@Qualifier("postServiceImpl")
	private PostService postService;
	
	public PostController() {
		System.out.println(this.getClass());
	}
	
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize; 

	
	@RequestMapping(value="addPost", method=RequestMethod.GET)
	public String addPost() throws Exception{
		
		System.out.println("/post/addPost : GET");
		
		return "forward:/post/addPost.jsp";
		
	}
	
	@RequestMapping(value="addPost", method=RequestMethod.POST)
	public String addPost(Post post) throws Exception{
		
		System.out.println("/post/addPost : POST");
		
		postService.addPost(post);
		
		System.out.println(post);
		
		return "forward:/post/addPost.jsp";
		
	}
	
	@RequestMapping(value="listPost")
	public String listPost(Search search, char postCategory, Model model, HttpSession session) throws Exception{
		
		System.out.println("/post/listPost : GET / POST");
		
		User user = (User) session.getAttribute("user");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setSearchSorting("3");
		
		
		Map<String, Object> map = postService.getPostList(search, '1');
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/post/listPost.jsp";
	}
}
