//package com.teulda.web.post;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.teulda.service.post.PostService;
//
//	@Controller
//	@RequestMapping("/post/*")
//	public class PostController {
//
//	@Autowired
//	@Qualifier("postServiceImpl")
//	private PostService postService;
//	
//	public PostController() {
//		System.out.println(this.getClass());
//	}
//	
//	
//	@Value("#{commonProperties['pageUnit']}")
//	//@Value("#{commonProperties['pageUnit'] ?: 3}")
//	int pageUnit;
//	
//	@Value("#{commonProperties['pageSize']}")
//	//@Value("#{commonProperties['pageSize'] ?: 2}")
//	int pageSize; 
//
////	
////	@RequestMapping(value="addPost", method=RequestMethod.GET)
////	public String addPost() throws Exception{
////		
////		System.out.println("/post/addPost : GET");
////		
////		return "forward:/post/addPostView.jsp";
////		
////	}
//	
//	@RequestMapping(value = "listPost")
//	public String listPost(@ModelAttribute("search"))
//}
