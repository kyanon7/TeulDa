package com.teulda.post.test;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.common.Group;
import com.teulda.common.Page;
import com.teulda.common.Photo;
import com.teulda.common.Search;
import com.teulda.service.domain.Comment;
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
		@Test
		public void testaddPost() throws Exception{
					
			Post post = new Post();
		
			post.setPostTitle("돌아간다 신난다");
			post.setPostContents("당황스럽네?");
			post.setPostCategory('1');
			post.setNickname("king제현");
			
			System.out.println("1");
//			//사진 리스트
//			Photo photo1 = new Photo();
//			photo1.setPhotoName("당황스럽.jpg");
//			
//			Photo photo2 = new Photo();
//			photo2.setPhotoName("안당황스럽.jpg");
//			
//			List<Photo> photoList = new ArrayList<Photo>();
//			photoList.add(photo1);
//			photoList.add(photo2);
//			
//			post.setPhotoList(photoList);
//			//
			System.out.println("2");
			System.out.println(post);
			postService.addPost(post);
			
			System.out.println("3");
			Post post1 = postService.getPost(10028);
			System.out.println("post1 : "+post1);
			
			System.out.println("4");
			Assert.assertEquals("돌아간다 신난다", post1.getPostTitle());
			Assert.assertEquals("당황스럽네?", post1.getPostContents());
			Assert.assertEquals('1', post1.getPostCategory());
			Assert.assertEquals("king제현", post1.getNickname());	
		}
		
		
		//@Test
		public void testgetPost() throws Exception{
			
			Post post1 = postService.getPost(10033);
		    System.out.println(post1);

		    Assert.assertEquals("돌아간다 신난다", post1.getPostTitle());
			Assert.assertEquals("당황스럽네?", post1.getPostContents());
			Assert.assertEquals('1', post1.getPostCategory());
			Assert.assertEquals("king제현", post1.getNickname());	
		  }
		
		//@Test
		public void testupdatePost() throws Exception{
			
			Post post1 = postService.getPost(10032);
			System.out.println("post1 : "+post1);
			
			Assert.assertEquals(10032, post1.getPostNo());
			Assert.assertEquals("돌아간다 신난다", post1.getPostTitle());
			Assert.assertEquals("당황스럽네?", post1.getPostContents());
			Assert.assertEquals('1', post1.getPostCategory());
			Assert.assertEquals("king제현", post1.getNickname());	
			
			Post post = new Post();
			
			post.setPostNo(10032);
			post.setPostTitle("이번에는");
			post.setPostContents("댓글도 수정할수있게 넣었어");
			post.setPostCategory('0');
			post.setNickname("king주원");

			postService.updatePost(post);
			Post post2 = postService.getPost(10032);
			System.out.println(post2);
			
			Assert.assertEquals(10032, post2.getPostNo());
			Assert.assertEquals("이번에는", post2.getPostTitle());
			Assert.assertEquals("댓글도 수정할수있게 넣었어", post2.getPostContents());
			Assert.assertEquals('0', post2.getPostCategory());
			Assert.assertEquals("king주원", post2.getNickname());	
		}
		
		//@Test
		public void testDeletePost() throws Exception{
			
			System.out.println(postService.getPost(10034));
			postService.deletePost(10034);
			
		}
				
		//@Test
		public void testaddComment() throws Exception{
			
			Comment comment = new Comment();
			
			comment.setPostNo(10033);
			comment.setCommentContents("댓글이 제대로 달려야 당황하지 않을텐데,,,");
			comment.setNickname("king제현");
			
			System.out.println(comment);
				
			Comment comment2 = new Comment();

			comment2.setPostNo(10033);
			comment2.setCommentContents("댓글을 또 다는데 되겠지?");
			comment2.setNickname("king제현");
			System.out.println(comment2);
			
			System.out.println("1");
			postService.addComment(comment); 
			postService.addComment(comment2);
			
			List<Comment> commentList = new ArrayList<Comment>();
			
			commentList.add(comment);
			System.out.println(comment);
			commentList.add(comment2);
			System.out.println(comment2);
			
			Post post = new Post();
			post.setCommentList(commentList);
			System.out.println("2");
			
			post = postService.getPost(10033);	
			System.out.println(post);
		}
		
		//@Test
		public void testdeleteComment() throws Exception{
			
			postService.deleteComment(10001);
		}
		
		//@Test
		public void testupdateComment() throws Exception{
			
			Comment comment = new Comment();
			
			comment.setCommentNo(10002);
			comment.setCommentContents("이번에는 한번에 가자 ");
			postService.updateComment(comment);
		}
		
		//@Test
		public void testGetPostList() throws Exception{
		 
			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(5);
			
			Map<String, Object> map = postService.getPostList(search, '1');
			System.out.println(map);
		}
		
		//@Test
		public void testGetCommentList() throws Exception{
			List<Comment> commentList = postService.getCommentList(10033);
		}
		
		//@Test
		//이거 sql 한번 물어보기
		public void testGetMyCommentList() throws Exception{
			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(5);
			
			Map<String, Object> map = postService.getMycommentList(search, "king제현");
			System.out.println(map);
		}
		
		//@Test
		public void testUpdatePostViewCount() throws Exception{
			
			postService.updatePostViewCount(10035);
		}
}
