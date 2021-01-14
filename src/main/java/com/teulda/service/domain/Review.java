package com.teulda.service.domain;

import java.util.Date;

public class Review {
    private int reviewNo;
    private String nickName;
    private String reviewPlace;
    private String reviewContents;
    private String reviewPhoto;
    private int stars;
    private Date reviewDate;

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

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }

    @Override
    public String toString() {
        return "Review [nickName=" + nickName + ", reviewContents=" + reviewContents + ", reviewDate=" + reviewDate
                + ", reviewNo=" + reviewNo + ", reviewPhoto=" + reviewPhoto + ", reviewPlace=" + reviewPlace
                + ", stars=" + stars + "]";
    }

}
