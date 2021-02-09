package com.teulda.service.bookmark.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teulda.common.Search;
import com.teulda.service.bookmark.BookmarkDao;
import com.teulda.service.bookmark.BookmarkService;
import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Bookmark;
import com.teulda.service.domain.Diary;

@Service("bookmarkServiceImpl")
public class BookmarkServiceImpl implements BookmarkService {

	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;
	
	@Autowired
	@Qualifier("bookmarkDaoImpl")
	private BookmarkDao bookmarkDao;
	
	// setter injection 
	public void setBookmarkDao(BookmarkDao bookmarkDao) {
		this.bookmarkDao = bookmarkDao;
	}
	
	public BookmarkServiceImpl() { // 생성자
		System.out.println(this.getClass()); // 디버깅 위함
	}
	
	//북마크를 추가
	@Override
	public void addBookmark(Bookmark bookmark) throws Exception {
		
		bookmarkDao.addBookmark(bookmark);
		
	}
	//북마크를 삭제
	@Override
	public void deleteBookmark(int bookmarkNo) throws Exception {
		
		bookmarkDao.deleteBookmark(bookmarkNo);
		
	}

	//북마크 목록을 불러옴
	@Override
	public Map<String, Object> getBookmarkList(Search search, String nickname) throws Exception {
		
			Map<String, Object> map = new HashMap<String, Object>();
			
			List<Bookmark> bookmarkList = bookmarkDao.getBookmarkList(search, nickname);
			
			for(int i=0; i<bookmarkList.size(); i++) {
				
				Diary diary = new Diary();
				diary = diaryService.getDiary(bookmarkList.get(i).getDiaryNo());
				bookmarkList.get(i).setDiary(diary);
			}
			
			
			map.put("list", bookmarkList);
			map.put("totalCount", new Integer(bookmarkDao.getBookmarkTotalCount(search, nickname)));
			
			return map;
	}

	@Override
	public int selectBookmarkNo(int diaryNo) throws Exception {
		
		return bookmarkDao.selectBookmarkNo(diaryNo);
	}

	
}
