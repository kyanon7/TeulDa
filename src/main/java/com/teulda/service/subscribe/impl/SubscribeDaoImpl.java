package com.teulda.service.subscribe.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teulda.service.domain.Subscribe;
import com.teulda.service.subscribe.SubscribeDao;

@Repository("subscribeDaoImpl")
public class SubscribeDaoImpl implements SubscribeDao {

	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println(getClass().getName()+" : setSqlSession() call");
		this.sqlSession = sqlSession;
	}
	
	public SubscribeDaoImpl() {
		System.out.println(getClass()+" : default Constructor call");
	}
	
	@Override
	public void addSubscribe(Subscribe subscribe) throws Exception {
		sqlSession.insert("SubscribeMapper.addSubscribe", subscribe);
	}

	@Override
	public List<Subscribe> getSubscribeInfoList(String subNickname) throws Exception {
		return sqlSession.selectList("SubscribeMapper.getSubscribeList", subNickname);
	}

	@Override
	public void deleteSubscribe(Subscribe subscribe) throws Exception {
		sqlSession.delete("SubscribeMapper.deleteSubscribe", subscribe);
	}

	@Override
	public boolean checkSubscribe(Subscribe subscribe) throws Exception {
		return sqlSession.selectOne("SubscribeMapper.checkSubscribe", subscribe).equals(0);
	}
	
}
