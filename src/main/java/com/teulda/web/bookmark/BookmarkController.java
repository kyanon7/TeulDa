package com.teulda.web.bookmark;

import java.util.List;
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
import com.teulda.service.bookmark.BookmarkService;
import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Bookmark;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.User;

	@Controller
	@RequestMapping("/bookmark/*")
	public class BookmarkController {

		
	@Autowired
	@Qualifier("bookmarkServiceImpl")
	private BookmarkService bookmarkService;
		
	public BookmarkController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit'] ?: 5}") // 못 불러온다면 5 주입 
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 3}") // 못 불러온다면 3 주입 
	int pageSize;
	
	
	@RequestMapping(value="listBookmark", method= {RequestMethod.GET, RequestMethod.POST})
	public String listBookmark(@ModelAttribute("search")Search search, @RequestParam String nickname, Model model) throws Exception{
		

		System.out.println("/bookmark/listBookmark : GET / POST");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		if (search.getSearchSorting() == null) {
			search.setSearchSorting("0");
		}
		search.setPageSize(pageSize);
		
		Map<String,Object> map = bookmarkService.getBookmarkList(search, nickname);

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		model.addAttribute("nickname", nickname);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/bookmark/listBookmark.jsp";
	}
}
