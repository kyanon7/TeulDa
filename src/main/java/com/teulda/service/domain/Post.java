package com.teulda.service.domain;

import java.util.Date;
import java.util.List;

public class Post {
	
	private int postNo; //게시글 번호
	private String postTitle; //게시글 제목
	private String postContents; //게시글 제목
	private Date postDate; //게시글 작성일자
	private String postCategory; //게시글 유형
	private List<String> photo; //게시글 사진
	private int viewCount; //조회수
	private String nickName; //게시글작성자 닉네임
	private List<String> comment; //댓글
	
	
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
	
	public String getPostCategory() {
		return postCategory;
	}
	
	public void setPostCategory(String postCategory) {
		this.postCategory = postCategory;
	}
	
	public List<String> getPhoto() {
		return photo;
	}
	
	public void setPhoto(List<String> photo) {
		this.photo = photo;
	}
	
	public int getViewCount() {
		return viewCount;
	}
	
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	public String getNickname() {
		return nickName;
	}
	
	public void setNickname(String nickName) {
		this.nickName = nickName;
	}
	
	public List<String> getComment() {
		return comment;
	}
	
	public void setComment(List<String> comment) {
		this.comment = comment;
	}
	
	
	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", postTitle=" + postTitle + ", postContents=" + postContents + ", postDate="
				+ postDate + ", postCategory=" + postCategory + ", photo=" + photo + ", viewCount=" + viewCount
				+ ", nickName=" + nickName + ", comment=" + comment + "]";
	}
	
	
	
	

}