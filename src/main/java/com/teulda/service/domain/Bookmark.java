package com.teulda.service.domain;

import java.util.Date;

public class Bookmark {
	
	private int bookmarkNo; //북마크번호
	private int diaryNo; //기록번호
	private String nickName; //기록 작성자
	private Date bookmarkDate; //북마크한 일자
	
	
	public int getBookmarkNo() {
		return bookmarkNo;
	}
	
	public void setBookmarkNo(int bookmarkNo) {
		this.bookmarkNo = bookmarkNo;
	}
	
	public int getDiaryNo() {
		return diaryNo;
	}
	
	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}
	
	public String getNickName() {
		return nickName;
	}
	
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public Date getBookmarkDate() {
		return bookmarkDate;
	}
	
	public void setBookmarkDate(Date bookmarkDate) {
		this.bookmarkDate = bookmarkDate;
	}
	
	
	@Override
	public String toString() {
		return "Bookmark [bookmarkNo=" + bookmarkNo + ", diaryNo=" + diaryNo + ", nickName=" + nickName
				+ ", bookmarkDate=" + bookmarkDate + "]";
	}

	
	
	
	
}
