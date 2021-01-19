package com.teulda.service.domain;

import java.sql.Timestamp;

public class Subscribe {
    private int subscribeNo;
    private String subNickname;
    private String subTargetNickname;
    private Timestamp subscribeDate;

    public int getSubscribeNo() {
        return subscribeNo;
    }

    public void setSubscribeNo(int subscribeNo) {
        this.subscribeNo = subscribeNo;
    }

    public String getSubNickname() {
        return subNickname;
    }

    public void setSubNickname(String subNickname) {
        this.subNickname = subNickname;
    }

    public String getSubTargetNickname() {
        return subTargetNickname;
    }

    public void setSubTargetNickname(String subTargetNickname) {
        this.subTargetNickname = subTargetNickname;
    }

    public Timestamp getSubscribeDate() {
        return subscribeDate;
    }

    public void setSubscribeDate(Timestamp subscribeDate) {
        this.subscribeDate = subscribeDate;
    }

    @Override
    public String toString() {
        return "Subscribe [subscribeNo=" + subscribeNo + ", subNickname=" + subNickname + ", subTargetNickname="
                + subTargetNickname + ", subscribeDate=" + subscribeDate + "]";
    }
    
}
