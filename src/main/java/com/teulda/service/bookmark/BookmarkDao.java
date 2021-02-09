package com.teulda.service.bookmark;

import java.util.List;

import com.teulda.common.Search;
import com.teulda.service.domain.Bookmark;
import com.teulda.service.domain.Diary;

public interface BookmarkDao {

	// INSERT
	public void addBookmark(Bookmark bookmark) throws Exception;
	
	// DELETE
	public void deleteBookmark(int bookmarkNo) throws Exception;
	
	// SELECT LIST
	public List<Bookmark> getBookmarkList(Search search, String nickname) throws Exception;
	
	// 북마크페이지
	public int getBookmarkTotalCount(Search search, String nickname) throws Exception;
	
	// SELECT ONE
	public int selectBookmarkNo(int diaryNo) throws Exception;
}
