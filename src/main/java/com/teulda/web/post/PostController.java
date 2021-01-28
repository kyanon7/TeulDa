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
import org.springframework.web.bind.annotation.RequestParam;

import com.teulda.common.Page;
import com.teulda.common.Search;
import com.teulda.service.domain.Post;
import com.teulda.service.domain.User;
import com.teulda.service.post.PostService;
import com.teulda.service.user.UserService;


	@Controller
	@RequestMapping("/post/*")
	public class PostController {

	@Autowired
	@Qualifier("postServiceImpl")
	private PostService postService;
	
	public PostController() {
		System.out.println(this.getClass());
	}
	
	
	@Value("#{commonProperties['pageUnit'] ?: 5}") // 못 불러온다면 5 주입 
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 3}") // 못 불러온다면 3 주입 
	int pageSize;

	
	@RequestMapping(value="addPost", method=RequestMethod.GET)
	public String addPost() throws Exception{
		
		System.out.println("/post/addPost : GET");
		
		return "forward:/post/addPost.jsp";
		
	}
	
	@RequestMapping(value="addPost", method=RequestMethod.POST)
	public String addPost(@ModelAttribute("post") Post post, Model model, HttpSession session) throws Exception{
		
		System.out.println("/post/addPost : POST");
		
		User user = (User) session.getAttribute("user");
		
		System.out.println("===========================");
		System.out.println("이건 User값입니다"+user);
		System.out.println("===========================");
		
		post.setNickname(user.getNickname());
		
		System.out.println(post);
		postService.addPost(post);

		model.addAttribute("post", post);
		
		return "forward:/post/getPost.jsp";
		
	}
	
	@RequestMapping(value="listPost")
	public String listPost(@ModelAttribute("search")Search search, @RequestParam char postCategory, Model model, HttpSession session) throws Exception{
		
		System.out.println("/post/listPost : GET / POST");
		
		//User user = (User) session.getAttribute("user");
		
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		//search.setSearchSorting("3");
		
		
		Map<String, Object> map = postService.getPostList(search, postCategory);

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("postCategory", postCategory);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/post/listPost.jsp";
	}
	
	@RequestMapping(value="getPost", method=RequestMethod.GET)
	public String getPost(@RequestParam("postNo")int postNo, Model model, HttpSession session) throws Exception{
		
		System.out.println("/post/getPost : GET");

//		User user = (User) session.getAttribute("user");
//		
//		System.out.println("===========================");
//		System.out.println("이건 User값입니다"+user);
//		System.out.println("===========================");
		
		Post post = postService.getPost(postNo);
		model.addAttribute("post", post);
		
		System.out.println(post);

		if(((User) session.getAttribute("user")).getNickname() != null && post.getNickname().equals(((User) session.getAttribute("user")).getNickname())) {
			return "forward:/post/getMyPost.jsp";
		}else {
			return "forward:/post/getPost.jsp";
		}
	}
	
	@RequestMapping(value="updatePost", method = RequestMethod.GET)
	public String updatePost(@RequestParam("postNo")int postNo, Model model) throws Exception{
		System.out.println("/post/updatePost : GET");
		
		Post post = postService.getPost(postNo);
		
		model.addAttribute("post", post);
		
		return "forward:/post/updatePost.jsp";	
	}
	
	@RequestMapping(value="updatePost", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("post")Post post, Model model) throws Exception{
		
		System.out.println("/post/updatePost : POST");
		
		postService.updatePost(post);
		
		Post newPost = postService.getPost(post.getPostNo());
		
		model.addAttribute("post", newPost);
		
		return "forward:/post/getMyPost.jsp"; 
	}
	
	@RequestMapping(value="listPostBynickname")
	public String listPostBynickname(@ModelAttribute("search")Search search, @RequestParam String nickname, @RequestParam char postCategory, Model model) throws Exception{
		
		System.out.println("/post/listPostBynickname : GET / POST");
		
		//User user = (User) session.getAttribute("user");
		
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		//search.setSearchSorting("3");
		
		
		Map<String, Object> map = postService.getPostListBynickname(search, nickname, postCategory);

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("nickname", nickname);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/post/listPostBynickname.jsp";
	}
}
