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
import com.teulda.service.user.UserService;

	@Service("postServiceImpl")
	public class PostServiceImpl implements PostService {
	
	//setter 인젝션	
		
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
		
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
		map.put("totalCount", new Integer(postDao.getPostTotalCount(search, postCategory)));
	 
		return map;
	}

	@Override
	public Post getPost(int postNo) throws Exception {
		Post post = postDao.getPost(postNo);
		post.setCommentList(postDao.getCommentList(postNo));
		//post.setPhotoList(postDao.getPhotoList(postNo));
		return post;
	}
	
	//게시글 등록 +사진(썸머노트를 쓰면 db에는 서버경로만 저장되고 사진등은 서버에저장된다.)
	@Override
	public void addPost(Post post) throws Exception {
		
		postDao.addPost(post);	// 포스트 디비 생성
		
		
//		List <Photo> photoList = post.getPhotoList();
//		
//		for (int i = 0; i < photoList.size(); i++) {
//			Photo photo = photoList.get(i);
//			photo.setNickname(post.getNickname()); //게시글 번호로 찾기위해서
//			postDao.addPhoto(photo);
//		}
	}

	@Override
	public void updatePost(Post post) throws Exception {
		
		postDao.updatePost(post);
		
		//새로 생성한 사진 등록
//		List <Photo> photoList = post.getPhotoList();
//		
//		for (int i = 0; i < photoList.size(); i++) {
//			Photo photo = photoList.get(i);
//			photo.setNickname(post.getNickname()); //게시글 번호로 찾기위해서
//			postDao.addPhoto(photo);
//		}
		
	}

	@Override
	public void deletePost(int postNo) throws Exception {
		//postDao.deletePhoto(postNo);
		postDao.deleteCommentUsePostNo(postNo);
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
		
		List <Comment> commetList = postDao.getMycommentList(search, nickname);
		
		map.put("commentList", commetList);
		map.put("totalCount", new Integer(postDao.getMycommentTotalCount(search, nickname)));
		
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

	@Override
	public List<Comment> getCommentList(int postNo) throws Exception {
		return postDao.getCommentList(postNo);
	}

	@Override
	public void updatePostViewCount(int postNo) throws Exception {
		postDao.updatePostViewCount(postNo);
		
	}
	
	@Override
	public Map<String, Object> getPostListBynickname(Search search, String nickname, char postCategory) throws Exception {
		
		Map<String, Object> map =  new HashMap<String, Object>();
		
		List <Post>  postList = postDao.getPostListBynickname(search, nickname, postCategory);
		
		map.put("list", postList);
		map.put("totalCount", new Integer(postDao.getPostBynicknameTotalCount(search, nickname, postCategory)));
	 
		return map;
	}

	@Override
	public int getNewPostNo(String nickname) throws Exception {
		
		return postDao.getNewPostNo(nickname);
	}

//	@Override
//	public void deletePhoto(int photoNo) throws Exception {
//		postDao.deletePhoto(photoNo);
//		
//	}

}
