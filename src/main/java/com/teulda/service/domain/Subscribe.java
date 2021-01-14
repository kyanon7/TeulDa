package com.teulda.service.domain;

import java.util.Date;

public class Subscribe {
    private int SubscribeNo;
    private String subNickname;
    private String subTargetNickname;
    private Date subscribeDate;

    public int getSubscribeNo() {
        return SubscribeNo;
    }

    public void setSubscribeNo(int subscribeNo) {
        SubscribeNo = subscribeNo;
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

    public Date getSubscribeDate() {
        return subscribeDate;
    }

    public void setSubscribeDate(Date subscribeDate) {
        this.subscribeDate = subscribeDate;
    }

    @Override
    public String toString() {
        return "Subscribe [SubscribeNo=" + SubscribeNo + ", subNickname=" + subNickname + ", subTargetNickname="
                + subTargetNickname + ", subscribeDate=" + subscribeDate + "]";
    }
    
}
