
package com.teulda.common;

import java.sql.Date;

public class Group {

	
	private int groupId;
	private String groupName;
	private String nickname;
	private Date deleteDate;
	private String groupType;

	
public Group() {}


public int getGroupId() {
	return groupId;
}

public void setGroupId(int groupId) {
	this.groupId = groupId;
}

public String getGroupName() {
	return groupName;
}

public void setGroupName(String groupName) {
	this.groupName = groupName;
}


public String getNickName() {
	return nickname;
}

public void setNickName(String nickname) {
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


@Override
public String toString() {
	return "Group [groupId=" + groupId + ", groupName=" + groupName + ", nickName=" + nickname + ", deleteDate="
			+ deleteDate + ", groupType=" + groupType + "]";
	}

}