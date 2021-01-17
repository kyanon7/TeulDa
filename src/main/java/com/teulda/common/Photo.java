package com.teulda.common;

import java.sql.Date;

public class Photo {

	private int photoNo; // 앨범, 기록, 게시글 사진 No
	private int photoGroupNo; // 앨범 그룹 No - 앨범 사진
	private int postNo; // 게시글 No - 게시글 사진
	private int diaryNo; // 기록 No - 기록 사진
	private String photoName; // 사진 파일명 - 앨범 사진
	private String photoAddr; // 사진 찍은 위치 - 앨범 사진
	private Double latitude; // 위도 - 앨범 사진
	private Double longitude; // 경도 - 앨범 사진
	private Date photoDate; // 사진 찍은 날짜 - 앨범 사진
	private Date deleteDate; // 사진 삭제 날짜 - 앨범 사진
	private String description; // 설명 - 기록 사진
	private char diaryPhotoType; // 기록 : d / 기념품 : s - 기록 사진
	private String nickname;
	
	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public int getPhotoGroupNo() {
		return photoGroupNo;
	}

	public void setPhotoGroupNo(int photoGroupNo) {
		this.photoGroupNo = photoGroupNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getPhotoAddr() {
		return photoAddr;
	}

	public void setPhotoAddr(String photoAddr) {
		this.photoAddr = photoAddr;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Date getPhotoDate() {
		return photoDate;
	}

	public void setPhotoDate(Date photoDate) {
		this.photoDate = photoDate;
	}

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public char getDiaryPhotoType() {
		return diaryPhotoType;
	}

	public void setDiaryPhotoType(char diaryPhotoType) {
		this.diaryPhotoType = diaryPhotoType;
	}

	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "Photo [photoNo=" + photoNo + ", photoGroupNo=" + photoGroupNo + ", postNo=" + postNo + ", diaryNo="
				+ diaryNo + ", photoName=" + photoName + ", photoAddr=" + photoAddr + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", photoDate=" + photoDate + ", deleteDate=" + deleteDate
				+ ", description=" + description + ", diaryPhotoType=" + diaryPhotoType + ", nickname=" + nickname
				+"]";
	}

}