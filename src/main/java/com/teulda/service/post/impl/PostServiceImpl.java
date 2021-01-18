package com.teulda.service.post.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teulda.common.Photo;
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
	public Map<String, Object> getPostList(Search search, char postCategory) throws Exception {
		
		Map<String, Object> map =  new HashMap<String, Object>();
		
		List <Post>  postList = postDao.getPostList(search, postCategory);
		
		map.put("list", postList);
		map.put("totalCount", new Integer(postDao.getPostTotalCount(postCategory)));
		
		return map;
	}

	@Override
	public Post getPost(int postNo) throws Exception {
		Post post = postDao.getPost(postNo);
		post.setCommentList(postDao.getCommentList(postNo));
		post.setPhotoList(postDao.getPhotoList(postNo));
		return post;
	}
	
	//게시글 등록 +댓글 +사진(썸머노트를 쓰면 db에는 서버경로만 저장되고 사진등은 서버에저장된다.)
	@Override
	public void addPost(Post post) throws Exception {
		
		postDao.addPost(post);	// 포스트 디비 생성
		
		List<Comment> commentList = post.getCommentList();
		
		for(int i =0; i<commentList.size(); i++) {
			Comment comment = commentList.get(i);
			comment.setPostNo(post.getPostNo());
			postDao.addComment(comment);
		}
		
		List <Photo> photoList = post.getPhotoList();
		
		for (int i = 0; i < photoList.size(); i++) {
			Photo photo = photoList.get(i);
			photo.setPostNo(post.getPostNo()); //게시글 번호로 찾기위해서
			postDao.addPhoto(photo);
		}
	}

	@Override
	public void updatePost(Post post) throws Exception {
		
		postDao.updatePost(post);
		
		//새로 생성한 사진 등록
		List <Photo> photoList = post.getPhotoList();
		
		for (int i = 0; i < photoList.size(); i++) {
			Photo photo = photoList.get(i);
			photo.setPostNo(post.getPostNo()); //게시글 번호로 찾기위해서
			postDao.addPhoto(photoList.get(i));
		}
		
	}

	@Override
	public void deletePost(int postNo) throws Exception {
		postDao.deletePost(postNo);
		
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		postDao.addComment(comment);
		
	}

	//이거 ajax써서 하고싶은데 어떻게 해야될까?
	
	@Override
	public void updateComment(Comment comment) throws Exception {
		postDao.updateComment(comment);
		
	}

	@Override
	public void deleteComment(int commentNo) throws Exception {
		postDao.deleteComment(commentNo);
		
	}

	@Override
	public Map<String, Object> getMycommentList(Search search, String nickname) throws Exception {
	
		Map<String, Object> map =  new HashMap<String, Object>();
		
		List <Comment> myCommetList = postDao.getMycommentList(search, nickname);
		
		map.put("list", myCommetList);
		map.put("totalCount", new Integer(postDao.getMycommentTotalCount(nickname)));
		
		return map;
		
		
		
		
//		List<Comment> list = postDao.getMycommentList(search, nickname);
//		int totalCount = postDao.getCommentTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("totalCount", new Integer(totalCount));
//				
//		return map;
	}

}
