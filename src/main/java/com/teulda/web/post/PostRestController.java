package com.teulda.web.post;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.teulda.service.domain.Comment;
import com.teulda.service.domain.User;
import com.teulda.service.post.PostService;

@RestController
@RequestMapping("/post/*")

public class PostRestController {
	
	@Autowired
	@Qualifier("postServiceImpl")
	private PostService postService;
	
	public PostRestController() {
		
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="rest/addComment", method=RequestMethod.POST)
	   public String addComment(@RequestBody Comment comment, HttpSession session) throws Exception{
	      
	      System.out.println("/post/rest/addComment");
	      
	      User user = (User)session.getAttribute("user");
	      
	      System.out.println("===========================");
	      System.out.println("이건 User값입니다"+user);
	      System.out.println("===========================");
	      
	      comment.setNickname(user.getNickname());
	      
	      System.out.println(comment);
	      
	      postService.addComment(comment);
	      
	      System.out.println("===========================");
	      System.out.println("이건 comment값입니다"+comment);
	      System.out.println("===========================");
	      
	      return "Success";

	   }
	
	@RequestMapping(value="rest/deleteComment", method=RequestMethod.POST)
	public String deleteComment(@RequestBody Comment comment) throws Exception {
		
		System.out.println("/post/rest/deleteComment :POST");
		
		
		System.out.println("===========================");
	    System.out.println("이건 CommentNo값입니다"+comment);
	    System.out.println("===========================");
		
		postService.deleteComment(comment.getCommentNo());
		
		return "Success";
	}
	
	@RequestMapping(value="rest/updateComment", method = RequestMethod.POST)
	public String updateComment(@RequestBody Comment comment) throws Exception{
		
		System.out.println("/post/rest/updateComment :POST");
		
		System.out.println("===========================");
	    System.out.println("이건 CommentNo값입니다"+comment);
	    System.out.println("===========================");
	    
	    postService.updateComment(comment);
	    
	    return "Success";
	}
}
