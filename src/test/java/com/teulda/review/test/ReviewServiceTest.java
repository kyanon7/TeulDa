package com.teulda.review.test;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.service.domain.Review;
import com.teulda.service.review.ReviewService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })

public class ReviewServiceTest {
	
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;
	
	int no = 10018;
	
	//@Test
	public void testAddReview() throws Exception{
		
		Review review = new Review();
		review.setReviewNo(no);
		review.setNickName("king채경");
	    review.setReviewPlace("매디슨 스퀘어 가든");
	    review.setReviewContents(
	    				"오늘은 매디슨 스퀘어 가든에서 2만명을 앞에 두고 공연을 했다. 2만명 앞에서 공연이라 떨렸지만 나의 랩에 열광하는 사람들을 보며 즐거운 마음으로 랩을 할 수 있었다. make some noise!!");
	    review.setReviewPhoto("");
	    Timestamp dateTime = Timestamp.valueOf(LocalDateTime.now());
	    review.setReviewDate(dateTime);
	    review.setStar(4);
	    review.setIsAllowed('t');
	    
	    System.out.println(review);
	    reviewService.addReview(review);
	    
	    Review reviewGod = reviewService.getReview(no);
	    System.out.println(reviewGod);
	    
	    Assert.assertEquals(no, reviewGod.getReviewNo());
	    Assert.assertEquals("king채경", reviewGod.getNickName());
	    Assert.assertEquals("매디슨 스퀘어 가든", reviewGod.getReviewPlace());
	    Assert.assertEquals("오늘은 매디슨 스퀘어 가든에서 2만명을 앞에 두고 공연을 했다. 2만명 앞에서 공연이라 떨렸지만 나의 랩에 열광하는 사람들을 보며 즐거운 마음으로 랩을 할 수 있었다. make some noise!!", review.getReviewContents());
	    Assert.assertEquals("", reviewGod.getReviewPhoto());
	    Assert.assertEquals(dateTime, reviewGod.getReviewDate());
	    Assert.assertEquals(4, reviewGod.getStar());
	    Assert.assertEquals('t', reviewGod.getIsAllowed());
	}
	
	@Test
	public void testGetReview() throws Exception{
		
		Review reviewGod = reviewService.getReview(no);
	    System.out.println(reviewGod);
	    
	    Assert.assertEquals(no, reviewGod.getReviewNo());
	    Assert.assertEquals("king채경", reviewGod.getNickName());
	    Assert.assertEquals("매디슨 스퀘어 가든", reviewGod.getReviewPlace());
	    Assert.assertEquals("오늘은 매디슨 스퀘어 가든에서 2만명을 앞에 두고 공연을 했다. 2만명 앞에서 공연이라 떨렸지만 나의 랩에 열광하는 사람들을 보며 즐거운 마음으로 랩을 할 수 있었다. make some noise!!", reviewGod.getReviewContents());
	    Assert.assertEquals(null, reviewGod.getReviewPhoto());
//	    Assert.assertEquals(dateTime, reviewGod.getReviewDate());
	    Assert.assertEquals(4, reviewGod.getStar());
	    Assert.assertEquals('t', reviewGod.getIsAllowed());
	}
	
	//@Test
	public void testUpdateReview() throws Exception{
		
	}
}
