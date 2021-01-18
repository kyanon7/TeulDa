package com.teulda.service.community;

import java.util.Map;

import com.teulda.common.Search;
import com.teulda.service.domain.Bookmark;
import com.teulda.service.domain.Diary;

public interface CommunityService {

	//북마크 등록
	public void addBookmark(Bookmark bookmark) throws Exception;
	
	//북마크 삭제
	public void deleteBookmark(int bookmark) throws Exception;
	
	//북마크 목록 조회
	public Map<String, Object> getBookmarkList(Search search) throws Exception;
	
	//스크랩 등록
	public void addScrap(Diary diary) throws Exception;
}
