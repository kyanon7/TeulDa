package com.teulda.web.post;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.teulda.service.domain.Comment;
import com.teulda.service.domain.User;
import com.teulda.service.post.PostService;

//@RestController
//@RequestMapping("/post/*")

public class PostRestController {
	
	@Autowired
	@Qualifier("postServiceImpl")
	private PostService postService;
	
	public PostRestController() {
		
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="rest/addComment")
	public String addComment(@RequestParam("commentContents") String commentContents ,@RequestParam("postNo") int postNo, HttpSession session) throws Exception{
		
		System.out.println("/post/rest/addComment");
		
		User user = (User)session.getAttribute("user");
		
		System.out.println("===========================");
		System.out.println("이건 User값입니다"+user);
		System.out.println("===========================");
		
		Comment comment = new Comment();
		
		comment.setCommentContents(commentContents);
		comment.setNickname(user.getNickname());
		comment.setPostNo(postNo);
		
		postService.addComment(comment);
		
		System.out.println("===========================");
		System.out.println("이건 comment값입니다"+comment);
		System.out.println("===========================");
		
		return "Success";

	}
}
