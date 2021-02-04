package com.teulda.web.post;

import java.util.List;
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
import com.teulda.service.domain.Comment;
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
		
		Post newPost = 
				postService.getPost(postService.getNewPostNo(user.getNickname()));
		
		System.out.println("==/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=");
		System.out.println("이건 newPost입니다"+newPost);
		System.out.println("==/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=");
		
		
		model.addAttribute("post", newPost);

		return "forward:/post/getPost.jsp";
	}
	
	@RequestMapping(value="listPost",  method= {RequestMethod.GET, RequestMethod.POST})
	public String listPost(@ModelAttribute("search")Search search, @RequestParam char postCategory, Model model, HttpSession session) throws Exception{
		
		System.out.println("/post/listPost : GET / POST");
		
		//User user = (User) session.getAttribute("user");
		
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		if (search.getSearchSorting() == null) {
			search.setSearchSorting("0");
		}
		search.setPageSize(pageSize);
		//search.setSearchSorting("3");
		
		System.out.println("////////////////////////////////");
		System.out.println(search);
		System.out.println("////////////////////////////////");
		
		Map<String, Object> map = postService.getPostList(search, postCategory);
		
		System.out.println("////////////////////////////////");
		System.out.println(postCategory);
		System.out.println("////////////////////////////////");
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println("////////////////////////////////");
		System.out.println(resultPage);
		System.out.println("////////////////////////////////");
		
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
		
		
		String sessionID = (String) session.getAttribute("sessionID");
		
		Post post = postService.getPost(postNo);
		List<Comment> commentList = postService.getCommentList(postNo);
		
		System.out.println(post);
		System.out.println("////////////////////////////////");
		System.out.println(commentList);
		System.out.println("////////////////////////////////");
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("post", post);
		
		
		if( sessionID == null || !post.getNickname().equals(((User) session.getAttribute("user")).getNickname())) {
			return "forward:/post/getPost.jsp";
		}else if(((User) session.getAttribute("user")).getNickname() != null && post.getNickname().equals(((User) session.getAttribute("user")).getNickname())) {
			return "forward:/post/getMyPost.jsp";
		}else{
			postService.updatePostViewCount(postNo);
			return "forward:/post/getPost.jsp";

//		if(((User) session.getAttribute("user")).getNickname() != null && post.getNickname().equals(((User) session.getAttribute("user")).getNickname())) {
//			return "forward:/post/getMyPost.jsp";
//		}else if(((User) session.getAttribute("user")).getNickname() == null) {
//			return "forward:/post/getPost.jsp";
//		}else{
//			postService.updatePostViewCount(postNo);
//			return "forward:/post/getPost.jsp";
		}
	}
	
//	@RequestMapping(value="getPost", method=RequestMethod.GET)
//	public String getCommentList(@RequestParam int postNo, Model model, HttpSession session, @RequestParam Post post) throws Exception{
//		
//		System.out.println("/post/getPost,getMyPost : GET");
//		
//		List<Comment> commentList = postService.getCommentList(postNo);
//		
//		System.out.println(commentList);
//		model.addAttribute("commnetList", commentList);
//		
//
//		if(((User) session.getAttribute("user")).getNickname() != null && post.getNickname().equals(((User) session.getAttribute("user")).getNickname())) {
//			return "forward:/post/getMyPost.jsp";
//		}else {
//			return "forward:/post/getPost.jsp";
//		}
//	}
	
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
		
		model.addAttribute("postCategory", postCategory);
		model.addAttribute("nickname", nickname);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/post/listPostBynickname.jsp";
	}
	
	@RequestMapping(value="deletePost")
	public String deletePost(@RequestParam("postNo")int postNo, Model model) throws Exception{
		
		System.out.println("/post/deletePost");
		
		postService.deletePost(postNo);
		
		return "forward:/post/listPost?postCategory=6";
	}
	
//	@RequestMapping(value="addComment", method = RequestMethod.POST)
//	public String addComment(@ModelAttribute("comment")Comment comment, @RequestParam int postNo, Model model, HttpSession session) throws Exception{
//		
//		System.out.println("/post/addComment");
//		
//		User user = (User) session.getAttribute("user");
//		
//		System.out.println("===========================");
//		System.out.println("이건 User값입니다"+user);
//		System.out.println("===========================");
//		
//		System.out.println(postNo);
//		
//		comment.setNickname(user.getNickname());
//		comment.setPostNo(postNo);
//		
//		
//		postService.addComment(comment);
//		
//		System.out.println("===========================");
//		System.out.println("이건 comment값입니다"+comment);
//		System.out.println("===========================");
//
//		model.addAttribute("comment", comment);
//		
//		return "forward:/post/getPost.jsp";
//
////		if(((User) session.getAttribute("user")).getNickname() != null && comment.getNickname().equals(((User) session.getAttribute("user")).getNickname())) {
////			return "redirect:/post/getMyPost?postNo="+comment.getPostNo();
////		}else {
////			return "redirect:/post/getPost?postNo="+comment.getPostNo();
////		}
//	}
	
	@RequestMapping(value="listMyComment",  method= {RequestMethod.GET, RequestMethod.POST})
	public String listMyComment(@ModelAttribute("search") Search search, @RequestParam String nickname, Model model) throws Exception{
		
		System.out.println("/comment/listMyComment GET/POST");
		

		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		if (search.getSearchSorting() == null) {
			search.setSearchSorting("0");
		}
		search.setPageSize(pageSize);
		//search.setSearchSorting("3");
		
		
		Map<String, Object> map = postService.getMycommentList(search, nickname);

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("nickname", nickname);
		model.addAttribute("commentList", map.get("commentList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/post/listMyComment.jsp";
		
	}
}
