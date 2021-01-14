package com.teulda.service.post;

import java.util.Map;

import com.teulda.common.Search;
import com.teulda.service.domain.Comment;
import com.teulda.service.domain.Post;

public interface PostService {
	
	//게시글 목록 조회
	public Map<String, Object> getPostList(Search search) throws Exception;

	//게시글 조회
	public Post getPost(int postNo) throws Exception;
	
	//게시글 작성
	public void addPost(Post post) throws Exception;
	
	//게시글 수정
	public void updatePost(Post post) throws Exception;
	
	//게시글 삭제
	public void deletePost(int postNo) throws Exception;
	
	//댓글 작성
	public void addComment(Comment commnet) throws Exception;
	
	//댓글 수정
	public void updateComment(int commentNo) throws Exception;
	
	//댓글 삭제
	public void deleteComment(int commentNo) throws Exception;
	
	//나의 댓글 목록 조회
	public Map<String, Object> getCommentList(Search search) throws Exception;
	
}
