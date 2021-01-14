package com.teulda.common;

import java.sql.Date;

public class Photo { 

	private int photoId;
	private int photoGroupId;
	private int postId;
	private int diaryId;
	private String photoName;
	private String photoAddr;
	private String latitude;
	private String longitude;
	private Date photoDate;
	private Date deleteDate;
	private String description;
	private String diaryPhotoType;



public Photo() {}



public int getPhotoId() {
	return photoId;
}



public void setPhotoId(int photoId) {
	this.photoId = photoId;
}



public int getPhotoGroupId() {
	return photoGroupId;
}



public void setPhotoGroupId(int photoGroupId) {
	this.photoGroupId = photoGroupId;
}



public int getPostId() {
	return postId;
}



public void setPostId(int postId) {
	this.postId = postId;
}



public int getDiaryId() {
	return diaryId;
}



public void setDiaryId(int diaryId) {
	this.diaryId = diaryId;
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



public String getLatitude() {
	return latitude;
}



public void setLatitude(String latitude) {
	this.latitude = latitude;
}



public String getLongitude() {
	return longitude;
}



public void setLongitude(String longitude) {
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



public String getDiaryPhotoType() {
	return diaryPhotoType;
}



public void setDiaryPhotoType(String diaryPhotoType) {
	this.diaryPhotoType = diaryPhotoType;
}



@Override
public String toString() {
	return "Photo [photoId=" + photoId + ", photoGroupId=" + photoGroupId + ", postId=" + postId + ", diaryId="
			+ diaryId + ", photoName=" + photoName + ", photoAddr=" + photoAddr + ", latitude=" + latitude
			+ ", longitude=" + longitude + ", photoDate=" + photoDate + ", deleteDate=" + deleteDate + ", description="
			+ description + ", diaryPhotoType=" + diaryPhotoType + "]";
	}
}