package com.teulda.review.test;

import java.util.Date;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.service.domain.Review;
import com.teulda.service.review.ReviewService;


@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })

public class ReviewServiceTest {
	
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;
	
	int no = 10000;
	
	@Test
	public void testAddReview() throws Exception{
		
		Review review = new Review();
		int reviewNo = no;
		String nickName = "corud_the_RapGod";
	    String reviewPlace = "매디슨 스퀘어 가든";
	    String reviewContents = 
	    				"오늘은 매디슨 스퀘어 가든에서 2만명을 앞에 두고 공연을 했다. 2만명 앞에서 공연이라 떨렸지만 나의 랩에 열광하는 사람들을 보며 즐거운 마음으로 랩을 할 수 있었다. make some noise!!";
	    String reviewPhoto = "";
//	    Date reviewDate;
	    int star = 4;
	    char isAllowed = 't';
	    
	    System.out.println(review);
	    reviewService.addReview(review);
	    
	    Review reviewGod = reviewService.getReview(no);
	    System.out.println(reviewGod);
	    
	    Assert.assertEquals(reviewNo, 10000);
	    Assert.assertEquals(nickName, "corud_the_RapGod");
	    Assert.assertEquals(reviewPlace, "매디슨 스퀘어 가든");
	    Assert.assertEquals(reviewContents, "오늘은 매디슨 스퀘어 가든에서 2만명을 앞에 두고 공연을 했다. 2만명 앞에서 공연이라 떨렸지만 나의 랩에 열광하는 사람들을 보며 즐거운 마음으로 랩을 할 수 있었다. make some noise!!");
	    Assert.assertEquals(reviewPhoto, "");
	    Assert.assertEquals(star, 4);
	    Assert.assertEquals(isAllowed, 't');
		
	}
}
