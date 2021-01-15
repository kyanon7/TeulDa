package com.teulda.post.test;

import org.junit.Test;
import org.junit.Assert;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.service.domain.Post;
import com.teulda.service.post.PostService;



	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration(locations = {	"classpath:config/context-common.xml",
											"classpath:config/context-aspect.xml",
											"classpath:config/context-mybatis.xml",
											"classpath:config/context-transaction.xml" })
	public class PostServiceTest {
		
		@Autowired
		@Qualifier("postServiceImpl")
		private PostService postService;
		
		@Test
		public void testaddPost() throws Exception{
			
			System.out.println("안녕");
			
			Post post = new Post();
			
			int postNo = 10001;
			String postTitile = "돌아간다 신난다";
			String postContents = "당황스럽네?";
			String postCategory = "1";
			String nickNamee = "chillout";
			
			System.out.println(post);
			postService.addPost(post);
			
			post = postService.getPost(10001);
			System.out.println(post);
			
			Assert.assertEquals(10001, post.getPostNo());
			Assert.assertEquals("돌아간다 신난다", post.getPostTitle());
			Assert.assertEquals("당황스럽네?", post.getPostContents());
			Assert.assertEquals("1", post.getPostCategory());
			Assert.assertEquals("chillout", post.getNickname());

			System.out.println("안녕1");
		}
}
