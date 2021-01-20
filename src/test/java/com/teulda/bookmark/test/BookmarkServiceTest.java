package com.teulda.bookmark.test;

import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.common.Search;
import com.teulda.service.bookmark.BookmarkService;
import com.teulda.service.domain.Bookmark;

	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
	
	
	public class BookmarkServiceTest {
	
		@Autowired
		@Qualifier("bookmarkServiceImpl")
		private BookmarkService bookmarkService;
		
		
		
		//@Test
		public void testaddBookmark() throws Exception{
			
			Bookmark bookmark = new Bookmark();
			
			bookmark.setDiaryNo(10020);
			bookmark.setNickname("king제현");
			
			System.out.println("1");
			System.out.println(bookmark);
			
			bookmarkService.addBookmark(bookmark);
		}
		
		//@Test
		public void testdeleteBookmark() throws Exception{
			
			bookmarkService.deleteBookmark(10001);
		}
		
		//@Test
		public void testgetBookmarkList() throws Exception{
			
			Search search = new Search();
			
			search.setCurrentPage(1);
			search.setPageSize(5);
			
			Map<String, Object> map = bookmarkService.getBookmarkList(search, "king제현");
			System.out.println(map);
			
		}
}