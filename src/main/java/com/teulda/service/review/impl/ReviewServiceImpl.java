package com.teulda.service.review.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teulda.common.Search;
import com.teulda.service.domain.Review;
import com.teulda.service.review.ReviewDao;
import com.teulda.service.review.ReviewService;

@Service("reviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	@Qualifier("reviewDaoImpl")
	private ReviewDao reviewDao;
	
    public ReviewServiceImpl() {
    	System.out.println(this.getClass());
	}
    
    public void setReviewDao(ReviewDao reviewDao) {
    	this.reviewDao = reviewDao;
    }

	@Override
    public void addReview(Review review) throws Exception {
    	reviewDao.addReview(review);
    }

    @Override
    public Review getReview(int reviewNo) throws Exception {
        return reviewDao.getReview(reviewNo);
    }

    @Override
    public Map<String, Object> getReviewList(Search search) throws Exception {
        
    	List<Review> list = reviewDao.getReviewList(search);
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("list", list);
    	
    	return map;
    }

    @Override
    public void updateReview(Review review) throws Exception {
    	reviewDao.updateReview(review);
    }
    
    @Override
    public void deleteReview(int reviewNo) throws Exception {
    	reviewDao.deleteReview(reviewNo);
    }

}
