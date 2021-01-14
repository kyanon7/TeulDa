package com.teulda.review.test;

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
	
	//@Test
	public void testAddReview() throws Exception{
		
		Review review = new Review();
		
	}
}
