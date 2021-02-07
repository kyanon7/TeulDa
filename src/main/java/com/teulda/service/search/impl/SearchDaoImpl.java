package com.teulda.service.search.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.HashTag;
import com.teulda.service.search.SearchDao;

@Repository("searchDaoImpl")
public class SearchDaoImpl implements SearchDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		System.out.println(getClass().getName() + " : setSqlSessino() call");
		this.sqlSession = sqlSession;
	}

	public SearchDaoImpl() {
		System.out.println(getClass() + " : default Constructor call");
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
	public List<Group> getScrapGroupList(String nickname) throws Exception {
		return sqlSession.selectList("SearchNScrapMapper.getScrapGroupList", nickname);
	}

	@Override
	public List<Diary> getScrapList(Search search, String nickname, char isDelete) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("nickname", nickname);
		map.put("search", search);
		map.put("isDelete", isDelete);

		return sqlSession.selectList("SearchNScrapMapper.getScrapList", map);
	}

	@Override
	public int getScrapCount(Search search, String nickname, char isDelete) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("nickname", nickname);
		map.put("search", search);
		map.put("isDelete", isDelete);

		return sqlSession.selectOne("SearchNScrapMapper.getScrapCount", map);
	}

	@Override
	public void updateScrapGroup(Diary diary) throws Exception {
		sqlSession.update("SearchNScrapMapper.updateScrapGroup", diary);
	}
}
