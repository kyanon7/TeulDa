package com.teulda.service.review;

import java.util.List;

import com.teulda.common.Search;
import com.teulda.service.domain.Review;

public interface ReviewDao {
	
	//	INSERT
	public void addReview(Review review) throws Exception;
	
	//	SELECT ONE
	public Review getReview(int reviewNo) throws Exception;
	
	//	SELECT LAST ONE
	public int getLastMyReview(String nickname) throws Exception;

	//	SELECT LIST
	public List<Review> getReviewList(Search search) throws Exception;
	
	//	UPDATE
	public void updateReview(Review review) throws Exception;
	
	//	DELETE
	public void deleteReview(int reviewNo) throws Exception;
	
	//	PAGINATION
	public int getTotalCount(Search search) throws Exception; 
}
