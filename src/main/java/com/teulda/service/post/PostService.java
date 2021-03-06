package com.teulda.service.post;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.teulda.common.Search;
import com.teulda.service.domain.Comment;
import com.teulda.service.domain.Post;

public interface PostService {

	//게시글 조회
	public Post getPost(int postNo) throws Exception;
	
	//방금 저장한 게시글 확인
	public int getNewPostNo(String nickname) throws Exception;
	
	//게시글 작성
	public void addPost(Post post) throws Exception;
	
	//게시글 수정
	public void updatePost(Post post) throws Exception;
	
	//게시글 삭제
	public void deletePost(int postNo) throws Exception;
	
	//댓글 작성
	public void addComment(Comment comment) throws Exception;
	
	//댓글 수정
	public void updateComment(Comment comment) throws Exception;
	
	//댓글 삭제
	public void deleteComment(int commentNo) throws Exception;
	
	//게시글 조회수
	public void updatePostViewCount(int postNo) throws Exception;
	
	//사진 삭제
	//public void deletePhoto(int photoNo) throws Exception;
	
	//각각의 게시글 목록 보기 (그러기위해서 뒤에 char postCategory를 넣어줌!)
	public Map<String, Object> getPostList(Search search, char postCategory) throws Exception;
		
	//나의 댓글 목록 조회(나의 댓글을 보기위해서 목록을 뽑은다음에 닉네임으로 나의 댓글을 볼수있게 설정함) 	
	public Map<String, Object> getMycommentList(Search search, String nickname) throws Exception;

	//댓글 목록 조회
	public List<Comment> getCommentList(int postNo) throws Exception;
	
	//내가 작성한 게시글 리스트 조회
	public Map<String, Object> getPostListBynickname(Search search, String nickname, char postCategory) throws Exception;	
}
