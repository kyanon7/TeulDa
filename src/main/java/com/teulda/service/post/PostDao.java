package com.teulda.service.post;

import java.util.List;

import com.teulda.common.Photo;
import com.teulda.common.Search;
import com.teulda.service.domain.Comment;
import com.teulda.service.domain.Post;

public interface PostDao {
	
	//	POST INSERT
	public void addPost(Post post) throws Exception;
	
//	// PHOTO INSERT
//	public void addPhoto(Photo photo) throws Exception;
	
	//	POST SELECT ONE
	public Post getPost(int postNo) throws Exception;
	
	// SELECT ONE
	public int getNewPostNo(String nickname) throws Exception;
	
	//	POST UPDATE
	public void updatePost(Post post) throws Exception;
	
	//	POST DELETE
	public void deletePost(int postNo) throws Exception;

	//	COMMENT INSERT
	public void addComment(Comment comment) throws Exception;
	
	//	COMMENT UPDATE
	public void updateComment(Comment comment) throws Exception;
	
	//	COMMENT DELETE(ajax)
	public void deleteComment(int commentNo) throws Exception;
	
	// PHOTO DELETE(ajax)
	//public void deletePhoto(int photoNo) throws Exception;
	
	//COMMENT SELECT LIST
	public List<Comment> getCommentList(int postNo) throws Exception;
	
	//PHOTO SELECT LIST
	//public List<Comment> getPhotoList(int postNo) throws Exception;
	
	//	MY COMMENT SELECT LIST
	public List<Comment> getMycommentList(Search search, String nickname) throws Exception;
	
	//	POST SELECT LIST
	public List <Post> getPostList(Search search, char postCategory) throws Exception;
	
	//POST SELECT LIST
	public List <Post> getPostListBynickname(Search search, String nickname, char postCategory) throws Exception;
	
	//게시판 page
	public int getPostTotalCount(Search search, char postCategory) throws Exception;
	
	//게시판 nickname page
	public int getPostBynicknameTotalCount(Search search, String nickname, char postCategory) throws Exception;
	
	//댓글 page
	public int getCommentTotalCount(int postNo) throws Exception;
	
	//나의 댓글 page
	public int getMycommentTotalCount(Search search, String nickname) throws Exception;
	
	//게시글 조회수
	public void updatePostViewCount(int postNo) throws Exception;
	
	//기록번호 포함된 댓글 삭제
	public void deleteCommentUsePostNo(int postNo) throws Exception;
	
	//기록번호 포함된 사진 삭제
	//public void deletePhotoUsePostNo(int postNo) throws Exception;
	
}
