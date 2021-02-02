
package com.teulda.common;

import java.sql.Date;

public class Group {

	private int groupNo;
	private String groupName;
	private String nickname;
	private Date deleteDate;
	private String groupType; // 사진 그룹 : 1 / 기록 그룹 : 2 / 스크랩 그룹 : 3
	private int contentCount; // 그룹 안에 들어간 사진 or 기록 갯수

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}

	public String getGroupType() {
		return groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public int getContentCount() {
		return contentCount;
	}

	public void setContentCount(int contentCount) {
		this.contentCount = contentCount;
	}

	@Override
	public String toString() {
		return "Group [groupNo=" + groupNo + ", groupName=" + groupName + ", nickname=" + nickname + ", deleteDate="
				+ deleteDate + ", groupType=" + groupType + ", contentCount=" + contentCount + "]";
	}

}