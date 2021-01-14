package com.teulda.service.domain;

public class Landmark {

	private int landmarkNo; // 랜드마크 No
	private String landmarkName; // 랜드마크 이름
	private String landmarkAddr; // 랜드마크 주소
	private String landmarkDes; // 랜드마크 간략 설명

	public int getLandmarkNo() {
		return landmarkNo;
	}

	public void setLandmarkNo(int landmarkNo) {
		this.landmarkNo = landmarkNo;
	}

	public String getLandmarkName() {
		return landmarkName;
	}

	public void setLandmarkName(String landmarkName) {
		this.landmarkName = landmarkName;
	}

	public String getLandmarkAddr() {
		return landmarkAddr;
	}

	public void setLandmarkAddr(String landmarkAddr) {
		this.landmarkAddr = landmarkAddr;
	}

	public String getLandmarkDes() {
		return landmarkDes;
	}

	public void setLandmarkDes(String landmarkDes) {
		this.landmarkDes = landmarkDes;
	}

	@Override
	public String toString() {
		return "Landmark [landmarkNo=" + landmarkNo + ", landmarkName=" + landmarkName + ", landmarkAddr="
				+ landmarkAddr + ", landmarkDes=" + landmarkDes + "]";
	}

}
