package com.teulda.post.test;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.common.Photo;
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
		
		
		//이거 포토에서 bad sql나오는데 한번 확인해보기
		//@Test
		public void testaddPost() throws Exception{
					
			Post post = new Post();
			
			post.setPostNo(10008);
			post.setPostTitle("돌아간다 신난다");
			post.setPostContents("당황스럽네?");
			post.setPostCategory('1');
			post.setNickname("king제현");
			
			//사진 리스트
			Photo photo1 = new Photo();
			photo1.setPhotoName("당황스럽.jpg");
			
			Photo photo2 = new Photo();
			photo2.setPhotoName("안당황스럽.jpg");
			
			List<Photo> photoList = new ArrayList<Photo>();
			photoList.add(photo1);
			photoList.add(photo2);
			
			post.setPhotoList(photoList);
			//
			
			System.out.println(post);
			postService.addPost(post);
			
			System.out.println("2");
			Post post1 = postService.getPost(10008);
			System.out.println("post1 : "+post1);
			
			System.out.println("3");
			Assert.assertEquals("돌아간다 신난다", post1.getPostTitle());
			Assert.assertEquals("당황스럽네?", post1.getPostContents());
			Assert.assertEquals('1', post1.getPostCategory());
			Assert.assertEquals("king제현", post1.getNickname());	
		}
		
		//@Test
		public void testgetPost() throws Exception{
			
			Post post1 = postService.getPost(10004);
		    System.out.println(post1);
		    
		  
		    Assert.assertEquals("돌아간다 신난다", post1.getPostTitle());
			Assert.assertEquals("당황스럽네?", post1.getPostContents());
			Assert.assertEquals('1', post1.getPostCategory());
			Assert.assertEquals("king제현", post1.getNickname());	
		  }
		
		//@Test
		public void testupdatePost() throws Exception{
			
			Post post1 = postService.getPost(10005);
			System.out.println("post1 : "+post1);
			
			Assert.assertEquals(10005, post1.getPostNo());
			Assert.assertEquals("돌아간다 신난다", post1.getPostTitle());
			Assert.assertEquals("당황스럽네?", post1.getPostContents());
			Assert.assertEquals('1', post1.getPostCategory());
			Assert.assertEquals("king제현", post1.getNickname());	
			
			Post post = new Post();
			
			post.setPostNo(10005);
			post.setPostTitle("신난다 돌아간다");
			post.setPostContents("이게 됬음 좋겠네?");
			post.setPostCategory('2');
			post.setNickname("king주원");
			
			postService.updatePost(post);
			Post post2 = postService.getPost(10005);
			System.out.println(post2);
			
			Assert.assertEquals(10005, post2.getPostNo());
			Assert.assertEquals("신난다 돌아간다", post2.getPostTitle());
			Assert.assertEquals("이게 됬음 좋겠네?", post2.getPostContents());
			Assert.assertEquals('2', post2.getPostCategory());
			Assert.assertEquals("king주원", post2.getNickname());	
		}
		
		//@Test
		public void testDeletePost() throws Exception{
			
			System.out.println(postService.getPost(10005));
			postService.deletePost(10005);
			
			System.out.println(postService.getPost(10005));
		}
		
		//@Test
		public void testGetPostList() throws Exception{
			
			
		}
		
		
	
}
