package com.teulda.service.searchnscrap;

import java.util.List;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.HashTag;

public interface SearchNScrapDao {

	// INSERT Scrap
	public void addScrap(Diary diary) throws Exception;
	
	// INSERT Scrap HashTag
	public void addHashTag(HashTag hashTag) throws Exception;
	
	//INSERT Scrap Photo
	public void addPhoto(Photo photo) throws Exception;
	
	//INSERT Scrap Group
	public void addScrapGroup(Group group) throws Exception;
	
	//SELECT Scrap GroupList
	public List<Group> getScrapGroupList(String nickname) throws Exception;

	//SELECT ScrapList
	public List<Diary> getScrapList(Search search, String nickname, char isDelete) throws Exception;

	public int getScrapCount(Search search, String nickname, char isDelete) throws Exception;

	//UPDATE ScrapGroup
	public void updateScrapGroup(Diary diary) throws Exception;
}
