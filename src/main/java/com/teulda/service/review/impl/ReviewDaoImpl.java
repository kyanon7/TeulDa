package com.teulda.service.review.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teulda.common.Search;
import com.teulda.service.domain.Review;
import com.teulda.service.review.ReviewDao;

@Repository("reviewDaoImpl")
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public ReviewDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::"+getClass()+".setSqlSession() Call.....");
		this.sqlSession = sqlSession;
	}

	@Override
	public void addReview(Review review) throws Exception {
		sqlSession.insert("ReviewMapper.addReview", review);
	}

	@Override
	public Review getReview(int reviewNo) throws Exception {
		return sqlSession.selectOne("ReviewMapper.getReview", reviewNo);
	}

	@Override
	public List<Review> getReviewList(Search search) throws Exception {
		return sqlSession.selectList("ReviewMapper.getReviewList", search);
	}

	@Override
	public void updateReview(Review review) throws Exception {
		sqlSession.update("ReviewMapper.updateReview", review);
	}

	@Override
	public void deleteReview(int reviewNo) throws Exception {
		sqlSession.delete("ReviewMapper.deleteReview", reviewNo);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ReviewMapper.getTotalCount", search);
	}
}
