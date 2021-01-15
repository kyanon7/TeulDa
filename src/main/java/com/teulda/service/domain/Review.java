package com.teulda.service.domain;

import java.sql.Timestamp;

public class Review {
    private int reviewNo;
    private String nickName;
    private String reviewPlace;
    private String reviewContents;
    private String reviewPhoto;
    private Timestamp reviewDate;
    private int star;
    private char isAllowed;
    
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getReviewPlace() {
		return reviewPlace;
	}
	public void setReviewPlace(String reviewPlace) {
		this.reviewPlace = reviewPlace;
	}
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public String getReviewPhoto() {
		return reviewPhoto;
	}
	public void setReviewPhoto(String reviewPhoto) {
		this.reviewPhoto = reviewPhoto;
	}
	public Timestamp getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Timestamp reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public char getIsAllowed() {
		return isAllowed;
	}
	public void setIsAllowed(char isAllowed) {
		this.isAllowed = isAllowed;
	}
	
	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", nickName=" + nickName + ", reviewPlace=" + reviewPlace
				+ ", reviewContents=" + reviewContents + ", reviewPhoto=" + reviewPhoto + ", reviewDate=" + reviewDate
				+ ", star=" + star + ", isAllowed=" + isAllowed + "]";
	}

}
