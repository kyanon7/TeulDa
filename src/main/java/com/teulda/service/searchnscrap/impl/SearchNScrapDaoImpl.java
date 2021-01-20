package com.teulda.service.searchnscrap.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.HashTag;
import com.teulda.service.searchnscrap.SearchNScrapDao;

@Repository("searchNScrapDaoImpl")
public class SearchNScrapDaoImpl implements SearchNScrapDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println(getClass().getName()+" : setSqlSessino() call");
		this.sqlSession = sqlSession;
	}
	
	public SearchNScrapDaoImpl() {
		System.out.println(getClass()+" : default Constructor call");
	}
	
	
	// INSERT Scrap
	@Override
	public void addScrap(Diary diary) throws Exception {
		sqlSession.insert("SearchNScrapMapper.addScrap", diary);
		
	}
	
	@Override
	public void addHashTag(HashTag hashTag) throws Exception {
		sqlSession.insert("SearchNScrapMapper.addHashTag", hashTag);
	}

	@Override
	public void addPhoto(Photo photo) throws Exception {
		sqlSession.insert("SearchNScrapMapper.addPhoto", photo);
	}
	
	@Override
	public void addScrapGroup(Group group) throws Exception {
		sqlSession.insert("SearchNScrapMapper.addScrapGroup", group);
	}
	
	@Override
	public List<Group> getGroupList(Group group) throws Exception {	
		return sqlSession.selectList("SearchNScrapMapper.getGroupList", group);
	}
	
}
