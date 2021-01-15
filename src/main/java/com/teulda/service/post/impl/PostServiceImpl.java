package com.teulda.service.post.impl;

import java.util.HashMap;
import java.util.List;
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
	
	//setter 인젝션	
	@Autowired
	@Qualifier("postDaoImpl")
	private PostDao postDao;
	
	public void setPostDao(PostDao postDao){
		this.postDao = postDao;
	}
	
	//디버깅을 위한
	public PostServiceImpl() {  
		System.out.println(this.getClass());
	}
	
	//게시글 리스트 토탈카운트를 map에 저장
	@Override
	public Map<String, Object> getPostList(Search search) throws Exception {
		List<Post> list = postDao.getPostList(search);
		int totalCount = postDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		
		return map;
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
		
		postDao.updatePost(post);
		
	}

	@Override
	public void deletePost(int postNo) throws Exception {
		
		postDao.deletePost(postNo);
		
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		
		postDao.addComment(comment);
		
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		
		postDao.updateComment(comment);
		
	}

	@Override
	public void deleteComment(int commentNo) throws Exception {
		
		postDao.deleteComment(commentNo);
		
	}

	@Override
	public Map<String, Object> getCommentList(Search search) throws Exception {
		
		List<Comment> list = postDao.getCommentList(search);
		int totalCount = postDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
				
		return map;
	}

}
