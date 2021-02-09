package com.teulda.service.bookmark;

import java.util.Map;

import com.teulda.common.Search;
import com.teulda.service.domain.Bookmark;
import com.teulda.service.domain.Diary;

public interface BookmarkService {

		
	//북마크 추가
	public void addBookmark(Bookmark bookmark) throws Exception;
	
	//북마크 삭제 
	public void deleteBookmark(int bookmarkNo) throws Exception;
	
	//북마크 목록 조회
	public Map<String, Object> getBookmarkList(Search search, String nickname) throws Exception;
	
	//닉네임과 다이어리 번호로 북마크번호를 갖고있는지 확인
	public int selectBookmarkNo(int diaryNo) throws Exception;
}
