package com.teulda.service.community;

import java.util.List;
import java.util.Map;

import com.teulda.common.Search;
import com.teulda.service.domain.Bookmark;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.Subscribe;

public interface CommunityService {

	//북마크 등록
	public void addBookmark(Bookmark bookmark) throws Exception;
	
	//북마크 삭제
	public void deleteBookmark(int bookmark) throws Exception;
	
	//북마크 목록 조회
	public Map<String, Object> getBookmarkList(Search search) throws Exception;
	
	//스크랩 등록
	public void addScrap(Diary diary) throws Exception;
	
	// 구독 추가
	public boolean addSubscribe(Subscribe subscribe) throws Exception;
	
	// 구독 목록 조회
	public List<Subscribe> getSubscribeList(String subNickname) throws Exception;
	
	// 구독 취소
	public void deleteSubscribe(Subscribe subscribe) throws Exception;
	
}
