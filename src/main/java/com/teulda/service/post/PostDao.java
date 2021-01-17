package com.teulda.service.post;

import java.util.List;

import com.teulda.common.Search;
import com.teulda.service.domain.Comment;
import com.teulda.service.domain.Post;

public interface PostDao {
	
	//	POST INSERT
	public void addPost(Post post) throws Exception;
	
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
	
	//	COMMENT SELECT LIST
	public List<Comment> getCommentList(Search search) throws Exception;
	//원래는 getMycommnetList인데 이거 getCommentList로 바꿈 게시글에서 댓끌 리스트로
	//그냥 내댓글보기 이걸로 써서 하면 될듯 이름만 바뀜 
	
	//	POST SELECT LIST
	public List <Post> getPostList(Search search) throws Exception;
	
	//게시판 page, 
	public int getPostTotalCount(Search search) throws Exception;
	
	//댓글 목록
	public int getCommentTotalCount(Search search) throws Exception;
	
	
}
