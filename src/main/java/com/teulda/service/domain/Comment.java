package com.teulda.service.domain;

import java.sql.Date;

public class Comment {
	
	private int commnetNo; //댓글번호
	private int postNo; //게시글 번호
	private String commentContents; //댓글내용
	private Date commentDate; //댓글 작성일자
	private String nickName; //댓글작성자
	
	
	public int getCommnetNo() {
		return commnetNo;
	}
	
	public void setCommnetNo(int commnetNo) {
		this.commnetNo = commnetNo;
	}
	
	public int getPostNo() {
		return postNo;
	}
	
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	
	public String getCommentContents() {
		return commentContents;
	}
	
	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}
	
	public Date getCommentDate() {
		return commentDate;
	}
	
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	
	public String getNickName() {
		return nickName;
	}
	
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
	@Override
	public String toString() {
		return "Comment [commnetNo=" + commnetNo + ", postNo=" + postNo + ", commentContents=" + commentContents
				+ ", commentDate=" + commentDate + ", nickName=" + nickName + "]";
	}

}
