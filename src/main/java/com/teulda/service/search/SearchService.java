package com.teulda.service.search;

import java.util.List;
import java.util.Map;

import com.teulda.common.Group;
import com.teulda.common.Search;
import com.teulda.service.domain.Diary;

public interface SearchService {

	//스크랩 등록
	public void addScrap(Diary diary) throws Exception;
	
	//스크랩 그룹 등록
	public void addScrapGroup(Group group) throws Exception;
	
	//스크랩 그룹 조회
	public List<Group> getScrapGroupList(String nickname) throws Exception;
	
	//스크랩 기록 조회
	public Map<String, Object> getScrapList(Search search, String nickname, char isDelete) throws Exception;

	//스크랩 그룹 변경
	public void updateScrapGroup(Diary diary) throws Exception;
	
}
