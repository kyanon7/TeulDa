package com.teulda.service.post.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teulda.common.Search;
import com.teulda.service.domain.Comment;
import com.teulda.service.domain.Post;
import com.teulda.service.post.PostDao;
import com.teulda.service.post.PostService;

	@Service("postServiceImpl")
	public class PostServiceImpl implements PostService {
	
		
	@Autowired
	@Qualifier("postDaoImpl")
	private PostDao postDao;
	//setter 인젝션
	public void setPostDao(PostDao postDao){
		postDao = this.postDao;
	}
	
	public PostServiceImpl() {  
		System.out.println(this.getClass());
	}
	
	public Map<String, Object> getPostList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post getPost(int postNo) throws Exception {
		return postDao.getPost(postNo);
	}

	@Override
	public void addPost(Post post) throws Exception {
		
		postDao.addPost(post);	
	}

	@Override
	public void updatePost(Post post) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePost(int postNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addComment(Comment commnet) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComment(int commentNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> getCommentList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
