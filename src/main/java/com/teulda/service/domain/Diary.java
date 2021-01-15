package com.teulda.service.domain;

import java.util.Date;
import java.util.List;

public class Diary { // 기록

	private int diaryNo; // 기록 No (스크랩 한 기록 No)
	private String title; // 제목
	private String location; // 여행지 위치
	private double latitude; // 여행지 위도
	private double longitude; // 여행지 경도
	private Date writeDate; // 작성일
	private Date updateDate; // 마지막 수정일
	private String nickname; // 원글 작성자
	private Date startDate; // 여행 시작날짜
	private Date endDate; // 여행 종료날짜
	private String content; // 글 내용
	private String thumbnail; // 사진 파일명
	private int viewCount; // 조회수

	private int bookmarkCount; // 북마크 횟수 - DB엔 칼럼 없음
	private int scrapCount; // 스크랩 횟수 - DB엔 칼럼 없음

	private Date deleteDate; // 삭제일자
	private String scrapNickname; // 스크랩한 회원 닉네임
	private Date scrapDate; // 스크랩 한 날짜
	private int groupNo; // 기록일때 기록 그룹 No, 스크랩일때 스크랩 그룹 No
	private String currency; // 통화 (화폐)
	private double transBill; // 교통비
	private double roomBill; // 숙박비
	private double foodBill; // 식비
	private double tourBill; // 관광비
	private double shopBill; // 쇼핑비
	private char isPublic; // 공개 : t / 비공개 : f
	private List<String> hashTagList; // 해시태그
	// private List<HashTag> hashTagList;
	private List<String> photoList; // 사진 파일명 여러개
	// private List<Photo> photoList;

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getBookmarkCount() {
		return bookmarkCount;
	}

	public void setBookmarkCount(int bookmarkCount) {
		this.bookmarkCount = bookmarkCount;
	}

	public int getScrapCount() {
		return scrapCount;
	}

	public void setScrapCount(int scrapCount) {
		this.scrapCount = scrapCount;
	}

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}

	public String getScrapNickname() {
		return scrapNickname;
	}

	public void setScrapNickname(String scrapNickname) {
		this.scrapNickname = scrapNickname;
	}

	public Date getScrapDate() {
		return scrapDate;
	}

	public void setScrapDate(Date scrapDate) {
		this.scrapDate = scrapDate;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public double getTransBill() {
		return transBill;
	}

	public void setTransBill(double transBill) {
		this.transBill = transBill;
	}

	public double getRoomBill() {
		return roomBill;
	}

	public void setRoomBill(double roomBill) {
		this.roomBill = roomBill;
	}

	public double getFoodBill() {
		return foodBill;
	}

	public void setFoodBill(double foodBill) {
		this.foodBill = foodBill;
	}

	public double getTourBill() {
		return tourBill;
	}

	public void setTourBill(double tourBill) {
		this.tourBill = tourBill;
	}

	public double getShopBill() {
		return shopBill;
	}

	public void setShopBill(double shopBill) {
		this.shopBill = shopBill;
	}

	public char getIsPublic() {
		return isPublic;
	}

	public void setIsPublic(char isPublic) {
		this.isPublic = isPublic;
	}

	public List<String> getHashTagList() {
		return hashTagList;
	}

	public void setHashTagList(List<String> hashTagList) {
		this.hashTagList = hashTagList;
	}

	public List<String> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(List<String> photoList) {
		this.photoList = photoList;
	}

	@Override
	public String toString() {
		return "Diary [diaryNo=" + diaryNo + ", title=" + title + ", location=" + location + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", writeDate=" + writeDate + ", updateDate=" + updateDate + ", nickname="
				+ nickname + ", startDate=" + startDate + ", endDate=" + endDate + ", content=" + content
				+ ", thumbnail=" + thumbnail + ", viewCount=" + viewCount + ", bookmarkCount=" + bookmarkCount
				+ ", scrapCount=" + scrapCount + ", deleteDate=" + deleteDate + ", scrapNickname=" + scrapNickname
				+ ", scrapDate=" + scrapDate + ", groupNo=" + groupNo + ", currency=" + currency + ", transBill="
				+ transBill + ", roomBill=" + roomBill + ", foodBill=" + foodBill + ", tourBill=" + tourBill
				+ ", shopBill=" + shopBill + ", isPublic=" + isPublic + ", hashTagList=" + hashTagList + ", photoList="
				+ photoList + "]";
	}

}
