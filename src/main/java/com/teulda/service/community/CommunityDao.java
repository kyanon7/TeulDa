package com.teulda.service.community;

import java.util.List;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;
import com.teulda.service.domain.Bookmark;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.HashTag;
import com.teulda.service.domain.Subscribe;

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
	
	// INSERT Scrap HashTag
	public void addHashTag(HashTag hashTag) throws Exception;
	
	//INSERT Scrap Photo
	public void addPhoto(Photo photo) throws Exception;
	
	//INSERT Scrap Group
	public void addScrapGroup(Group group) throws Exception;
	
	//SELECT Scrap Group
	public List<Group> getGroupList(Group group) throws Exception;
	
	// INSERT SUBSCRIBE
	public void addSubscribe(Subscribe subscribe) throws Exception;
	
	// SELECT SUBSCRIBE LIST
	public List<Subscribe> getSubscribeList(String subNickname) throws Exception;
	
	// DELETE SUBSCRIBE
	public void deleteSubscribe(Subscribe subscribe) throws Exception;
	
	// CHECK SUBSCRIBE
	public int checkSubscribe(Subscribe subscribe) throws Exception;
}
