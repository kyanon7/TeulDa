package com.teulda.service.domain;

import java.util.Date;
import java.util.List;

import com.teulda.common.Photo;

public class Post {
	
	private int postNo; //게시글 번호
	private String postTitle; //게시글 제목
	private String postContents; //게시글 제목
	private Date postDate; //게시글 작성일자
	private char postCategory; //게시글 유형
	private int viewCount; //조회수
	private String nickname; //게시글작성자 닉네임
	private List<Comment> commentList; //댓글
	private List<Photo> photoList; //게시글 사진
	
	public int getPostNo() {
		return postNo;
	}
	
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	
	public String getPostTitle() {
		return postTitle;
	}
	
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	
	public String getPostContents() {
		return postContents;
	}
	
	public void setPostContents(String postContents) {
		this.postContents = postContents;
	}
	
	public Date getPostDate() {
		return postDate;
	}
	
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	
	public char getPostCategory() {
		return postCategory;
	}
	
	public void setPostCategory(char postCategory) {
		this.postCategory = postCategory;
	}
	
	public int getViewCount() {
		return viewCount;
	}
	
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public List<Comment> getCommentList() {
		return commentList;
	}
	
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

	public List<Photo> getPhotoList() {
		return photoList;
	}
	
	public void setPhotoList(List<Photo> photoList) {
		this.photoList = photoList;
	}
	
	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", postTitle=" + postTitle + ", postContents=" + postContents + ", postDate="
				+ postDate + ", postCategory=" + postCategory + ", viewCount=" + viewCount + ", nickname=" + nickname
				+ ", commentList=" + commentList + ", photoList=" + photoList + "]";
	}
	
}
