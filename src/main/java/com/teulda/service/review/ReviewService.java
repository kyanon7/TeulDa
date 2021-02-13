package com.teulda.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teulda.common.Search;
import com.teulda.service.domain.Review;

public interface ReviewService {

    //  후기 작성
    public void addReview(Review review) throws Exception;

    //  후기 조회
    public Review getReview(int reviewNo) throws Exception;
    
    //	내가 마지막으로 쓴 후기 번호
    public int getLastMyReview(String nickname) throws Exception;

    //  후기 목록 조회
    public Map<String, Object> getReviewList(Search search) throws Exception;

    //  후기 수정
    public void updateReview(Review review) throws Exception;
    
    //  후기 삭제
    public void deleteReview(int reviewNo) throws Exception;
    
    //	파일 업로드
    public void uploadFile(Review review, String path, MultipartHttpServletRequest request) throws Exception;
}
