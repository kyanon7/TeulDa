package com.teulda.service.domain;

import java.sql.Date;

public class Comment {
	
	private int commentNo; //댓글번호
	private int postNo; //게시글 번호
	private String commentContents; //댓글내용
	private Date commentDate; //댓글 작성일자
	private String nickname; //댓글작성자
	
	
	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
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
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", postNo=" + postNo + ", commentContents=" + commentContents
				+ ", commentDate=" + commentDate + ", nickname=" + nickname + "]";
	}

}
