package com.teulda.service.post;

import java.util.List;

import com.teulda.common.Photo;
import com.teulda.common.Search;
import com.teulda.service.domain.Comment;
import com.teulda.service.domain.Post;

public interface PostDao {
	
	//	POST INSERT
	public void addPost(Post post) throws Exception;
	
	// PHOTO INSERT
	public void addPhoto(Photo photo) throws Exception;
	
	//	POST SELECT ONE
	public Post getPost(int postNo) throws Exception;
	
	//	POST UPDATE
	public void updatePost(Post post) throws Exception;
	
	//	POST DELETE
	public void deletePost(int postNo) throws Exception;

	//	COMMENT INSERT
	public void addComment(Comment comment) throws Exception;
	
	//	COMMENT UPDATE
	public void updateComment(Comment comment) throws Exception;
	
	//	COMMENT DELETE
	public void deleteComment(int commentNo) throws Exception;
	
	//COMMENT SELECT LIST
	public List<Comment> getCommentList(int postNo) throws Exception;
	
	//COMMENT SELECT LIST
	public List<Photo> getPhotoList(int postNo) throws Exception;
	
	//	MY COMMENT SELECT LIST
	public List<Comment> getMycommentList(Search search, String nickname) throws Exception;
	
	//	POST SELECT LIST
	public List <Post> getPostList(Search search, char postCategory) throws Exception;
	
	//게시판 page, 
	public int getPostTotalCount(char postCategory) throws Exception;
	
	//댓글 목록
	public int getMycommentTotalCount(String nickname) throws Exception;
	
	//게시글 조회수
	public void updaatePostViewCount(int postNo) throws Exception;
	
}
