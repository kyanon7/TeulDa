package com.teulda.service.community.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teulda.common.Search;
import com.teulda.service.community.CommunityDao;
import com.teulda.service.domain.Bookmark;
import com.teulda.service.domain.Diary;

@Repository("communityDaoImpl")
public class CommunityDaoImpl implements CommunityDao {

	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println(getClass().getName()+" : setSqlSessino() call");
		this.sqlSession = sqlSession;
	}
	
	public CommunityDaoImpl() {
		System.out.println(getClass()+" : default Constructor call");
	}
	
	
	@Override
	public void addBookmark(Bookmark bookmark) throws Exception {
		
		
	}

	@Override
	public void deleteBookmark(int bookmark) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Bookmark> getBookmarkList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	// INSERT Scrap
	@Override
	public void addScrap(Diary diary) throws Exception {
		
		sqlSession.insert("CommunityMapper.addScrap", diary);
		
	}

}
