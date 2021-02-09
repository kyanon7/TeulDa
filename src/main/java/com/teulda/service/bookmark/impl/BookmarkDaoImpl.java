package com.teulda.service.bookmark.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teulda.common.Search;
import com.teulda.service.bookmark.BookmarkDao;
import com.teulda.service.domain.Bookmark;
import com.teulda.service.domain.Diary;

	@Repository("bookmarkDaoImpl")
	public class BookmarkDaoImpl implements BookmarkDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public BookmarkDaoImpl() {
		System.out.println(this.getClass());
	}
	
	
	@Override
	public void addBookmark(Bookmark bookmark) throws Exception {
		sqlSession.insert("BookmarkMapper.addBookmark", bookmark);
		
	}

	@Override
	public void deleteBookmark(int bookmarkNo) throws Exception {
		sqlSession.delete("BookmarkMapper.deleteBookmark", bookmarkNo);
		
	}

	@Override
	public List<Bookmark> getBookmarkList(Search search, String nickname) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("nickname", nickname);
		
		return sqlSession.selectList("BookmarkMapper.getBookmarkList", map);
	}

	@Override
	public int getBookmarkTotalCount(Search search, String nickname) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("nickname", nickname);
		
		return sqlSession.selectOne("BookmarkMapper.getBookmarkTotalCount", map); 
		
	}

	@Override
	public int selectBookmarkNo(int diaryNo) throws Exception {
		
		return sqlSession.selectOne("BookmarkMapper", diaryNo);
		
	}

}
