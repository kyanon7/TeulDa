package com.teulda.service.searchnscrap;

import java.util.Map;

import com.teulda.common.Group;
import com.teulda.service.domain.Diary;

public interface SearchNScrapService {

	//스크랩 등록
	public void addScrap(Diary diary) throws Exception;
	
	//스크랩 그룹 등록
	public void addScrapGroup(Group group) throws Exception;
	
	//스크랩 그룹 조회
	public Map<String, Object> getGroupList(Group group) throws Exception;
	
}
