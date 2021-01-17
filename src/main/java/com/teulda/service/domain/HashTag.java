package com.teulda.service.domain;

public class HashTag { // 해시태그

	private int hashTagNo; // 해시태그 No
	private int diaryNo; // 기록 No
	private String hashTagName; // 해시태그명
	private String nickname; // addHashTag 할 때 내 최신 기록번호 찾아오기 위해 필요

	public int getHashTagNo() {
		return hashTagNo;
	}

	public void setHashTagNo(int hashTagNo) {
		this.hashTagNo = hashTagNo;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public String getHashTagName() {
		return hashTagName;
	}

	public void setHashTagName(String hashTagName) {
		this.hashTagName = hashTagName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "HashTag [hashTagNo=" + hashTagNo + ", diaryNo=" + diaryNo + ", hashTagName=" + hashTagName
				+ ", nickname=" + nickname + "]";
	}

}
