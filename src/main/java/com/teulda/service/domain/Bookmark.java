package com.teulda.service.domain;

import java.util.Date;

public class Bookmark {
	
	private int bookmarkNo; //북마크번호
	private int diaryNo; //기록번호
	private String nickname; //기록 작성자
	private Date bookmarkDate; //북마크한 일자
	private Diary diary;
	
	public Diary getDiary() {
		return diary;
	}

	public void setDiary(Diary diary) {
		this.diary = diary;
	}

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
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public Date getBookmarkDate() {
		return bookmarkDate;
	}
	
	public void setBookmarkDate(Date bookmarkDate) {
		this.bookmarkDate = bookmarkDate;
	}

	@Override
	public String toString() {
		return "Bookmark [bookmarkNo=" + bookmarkNo + ", diaryNo=" + diaryNo + ", nickname=" + nickname
				+ ", bookmarkDate=" + bookmarkDate + ", diary=" + diary + "]";
	}
	
	
}
