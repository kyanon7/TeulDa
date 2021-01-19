package com.teulda.service.community;

import java.util.List;

import com.teulda.common.Photo;
import com.teulda.common.Search;
import com.teulda.service.domain.Bookmark;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.HashTag;

public interface CommunityDao {

	//	INSERT
	public void addBookmark(Bookmark bookmark) throws Exception;
	
	//	DELETE
	public void deleteBookmark(int bookmark) throws Exception;
	
	//	SELECT LIST
	public List<Bookmark> getBookmarkList(Search search) throws Exception;
	
	// LIST TOTALCOUNT
	public int getTotalCount(Search search) throws Exception;
	
	// INSERT Scrap
	public void addScrap(Diary diary) throws Exception;
	
	public void addHashTag(HashTag hashTag) throws Exception;
	
	public void addPhoto(Photo photo) throws Exception;
	
}
