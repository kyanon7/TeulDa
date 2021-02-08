package com.teulda.web.bookmark;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.teulda.service.bookmark.BookmarkService;
import com.teulda.service.domain.Bookmark;
import com.teulda.service.domain.User;

@RestController
@RequestMapping("/bookmark/*")
public class BookmarkRestController {

	@Autowired
	@Qualifier("bookmarkServiceImpl")
	private BookmarkService bookmarkService;
		
	public BookmarkRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit'] ?: 5}") // 못 불러온다면 5 주입 
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 3}") // 못 불러온다면 3 주입 
	int pageSize;
	
	@RequestMapping(value="rest/addBookmark", method=RequestMethod.POST)
	public String addBookmark(@RequestBody Bookmark bookmark, HttpSession session) throws Exception{ 
	
		
		System.out.println("/bookmark/addBookmark : GET");
		
		User user = (User) session.getAttribute("user");
		
		bookmark.setNickname(user.getNickname());
		
		System.out.println("===========================");
	    System.out.println("이건 bookmark값입니다"+bookmark);
	    System.out.println("===========================");
		
		bookmarkService.addBookmark(bookmark);

		return "Success";	
	}
	
	@RequestMapping(value="rest/deleteBookmark", method=RequestMethod.POST)
	public String deleteBookmark(@RequestBody Bookmark bookmark) throws Exception{
		
		System.out.println("/bookmark/rest/deleteBookmark :POST");
		
		System.out.println("===========================");
	    System.out.println("이건 bookmark값입니다"+bookmark);
	    System.out.println("===========================");
	    
	    bookmarkService.deleteBookmark(bookmark.getBookmarkNo());
	    
	    return "Success";
	}
}
