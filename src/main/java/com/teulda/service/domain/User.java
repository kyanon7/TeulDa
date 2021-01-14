package com.teulda.service.domain;

import java.sql.Date;

public class User {
	
	///Field
		private String nickName;//닉네임(PK 및 중복불가)
		private String email;//이메일(아이디로 사용,U)
		private String password;//비밀번호
		private String name;//이름
		private String phone;//휴대전화번호(중복불가)
		private Date birth;//생일
		private String address;//거주지
		private String likePlace;//관심지역
		private String profilePhoto;//프로필사진
		private String status;//상태
		private Date statusDate;//상태변경날짜
		private int reportCount;	//신고당한횟수
		/////////////// EL 적용 위해 추가된 Field ///////////
		//private String phone1;
		//private String phone2;
		//private String phone3;
		public String getNickName() {
			return nickName;
		}
		public void setNickName(String nickName) {
			this.nickName = nickName;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public Date getBirth() {
			return birth;
		}
		public void setBirth(Date birth) {
			this.birth = birth;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getLikePlace() {
			return likePlace;
		}
		public void setLikePlace(String likePlace) {
			this.likePlace = likePlace;
		}
		public String getProfilePhoto() {
			return profilePhoto;
		}
		public void setProfilePhoto(String profilePhoto) {
			this.profilePhoto = profilePhoto;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public Date getStatusDate() {
			return statusDate;
		}
		public void setStatusDate(Date statusDate) {
			this.statusDate = statusDate;
		}
		public int getReportCount() {
			return reportCount;
		}
		public void setReportCount(int reportCount) {
			this.reportCount = reportCount;
		}
		
		@Override
		public String toString() {
			return "User [nickName=" + nickName + ", email=" + email + ", password=" + password + ", name=" + name
					+ ", phone=" + phone + ", birth=" + birth + ", address=" + address + ", likePlace=" + likePlace
					+ ", profilePhoto=" + profilePhoto + ", status=" + status + ", statusDate=" + statusDate
					+ ", reportCount=" + reportCount + "]";
		}

//미완
}
