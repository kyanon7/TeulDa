package com.teulda.service.post;

import java.util.List;

import com.teulda.common.Search;
import com.teulda.service.domain.Comment;
import com.teulda.service.domain.Post;

public interface PostDao {
	
	//	INSERT
	public void insertPost(Post post) throws Exception;
	
	//	SELECT ONE
	public Post findPost(int postNo) throws Exception;
	
	//	UPDATE
	public void updatePost(Post post) throws Exception;
	
	//	DELETE
	public void deletePost(int postNo) throws Exception;
	
	//	SELECT LIST
	public List <Post> getPostList(Search search) throws Exception;
	
	//	INSERT
	public void insertComment(Comment comment) throws Exception;
	
	//	UPDATE
	public void updateComment(Comment comment) throws Exception;
	
	//	DELETE
	public void deleteComment(int commnetNo) throws Exception;
	
	//	SELECT LIST
	public List<Comment> getCommentList(Search search) throws Exception;
	//원래는 getMycommnetList인데 이거 getCommentList로 바꿈 게시글에서 댓끌 리스트로
	//그냥 내댓글보기 이걸로 써서 하면 될듯 이름만 바뀜 
	
	//게시판 page, 게시글에 댓글page, 내 게시글, 댓글보기에서 page
	public int getTotalCount(Search search) throws Exception;
	
}
