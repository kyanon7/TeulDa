package com.teulda.service.domain;

import java.sql.Date;

public class Report {
	
	private int reportNo;//신고 No
	private Date reportDate;//신고 날짜
	private String reportType;//신고유형
	private String reportPhoto;//신고자료(사진)
	private String reporterNick;//신고한 유저 닉네임
	private String targetNick;//신고당한 유저 닉네임
	
	
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public String getReportPhoto() {
		return reportPhoto;
	}
	public void setReportPhoto(String reportPhoto) {
		this.reportPhoto = reportPhoto;
	}
	public String getReporterNick() {
		return reporterNick;
	}
	public void setReporterNick(String reporterNick) {
		this.reporterNick = reporterNick;
	}
	public String getTargetNick() {
		return targetNick;
	}
	public void setTargetNick(String targetNick) {
		this.targetNick = targetNick;
	}

	
	//값반환 확인
	public String toString() {
	
		return "ReportVO : [reportNo]" + reportNo
				+ "[reportDate]" + reportDate+ "[reportType]" + reportType + "[reportPhoto]" + reportPhoto
				+ "[reporterNick]" + reporterNick + "[targetNick]" +targetNick;
	}
}
