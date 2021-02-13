package com.teulda.service.review.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
    	System.out.println(this.getClass()+" : default Constructor call");
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
	public int getLastMyReview(String nickname) throws Exception {
		return reviewDao.getLastMyReview(nickname);
	}

    @Override
    public Map<String, Object> getReviewList(Search search) throws Exception {
        
    	List<Review> list = reviewDao.getReviewList(search);
    	int totalCount = reviewDao.getTotalCount(search);
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("list", list);
    	map.put("totalCount", Integer.valueOf(totalCount));
    	
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
    
    @Override
    public void uploadFile(Review review, String path, MultipartHttpServletRequest request) throws Exception{
		
		MultipartFile imageFile = request.getFile("imageFile");
		String fileName = "";
		String identify = UUID.randomUUID().toString();
		String reviewPath = request.getSession().getServletContext().getRealPath(path);
		
		if(!imageFile.isEmpty() && !imageFile.getOriginalFilename().equals("")) {
			File file = new File(reviewPath);
			if(file.exists() == false) {
				file.mkdirs();
			}
			
			String pathName = imageFile.getOriginalFilename();
			fileName = identify+"_"+pathName;
			imageFile.transferTo(new File(reviewPath, fileName));
			review.setReviewPhoto(fileName);
		}
	}

}
