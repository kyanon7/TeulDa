//DROP & CREATE SEQUENCE

DROP SEQUENCE seq_groups_group_id;
DROP SEQUENCE seq_users_user_id;
DROP SEQUENCE seq_report_report_id;
DROP SEQUENCE seq_diary_diary_id;
DROP SEQUENCE seq_hashtag_hashtag_id;
DROP SEQUENCE seq_review_review_id;
DROP SEQUENCE seq_bookmark_bookmark_id;
DROP SEQUENCE seq_subscribe_subscribe_id;
DROP SEQUENCE seq_stamp_stamp_id;
DROP SEQUENCE seq_post_post_id;
DROP SEQUENCE seq_comment_comment_id;
DROP SEQUENCE seq_photo_photo_id;
DROP SEQUENCE seq_chat_room_chatroom_id;



CREATE SEQUENCE seq_groups_group_id		 			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_users_user_id					INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_report_report_id				INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_diary_diary_id					INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_hashtag_hashtag_id				INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_review_review_id				INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_bookmark_bookmark_id			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_subscribe_subscribe_id			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_stamp_stamp_id					INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_post_post_id					INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_comment_comment_id				INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_photo_photo_id					INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_chat_room_chatroom_id			INCREMENT BY 1 START WITH 10000;



//DROP & CREATE 테이블

DROP TABLE report;
DROP TABLE review;
DROP TABLE bookmark;
DROP TABLE subscribe;
DROP TABLE stamp;
DROP TABLE hashtag;
DROP TABLE photo;
DROP TABLE comments;
DROP TABLE post;
DROP TABLE diary;
DROP TABLE groups;

DROP TABLE chat_member;
DROP TABLE chat_history;
DROP TABLE chat_room;

DROP TABLE users;



//회원 테이블
CREATE TABLE users (
	nickname				VARCHAR2(50)	NOT NULL,
	email					VARCHAR2(50)	NOT NULL,
	password				VARCHAR2(50)	NOT NULL,
	user_name				VARCHAR2(50)	NOT NULL,
	phone_number			VARCHAR2(20)	NOT NULL,
	user_addr				VARCHAR2(300),
	like_addr				VARCHAR2(300),
	birth					DATE,
	user_photo				VARCHAR2(100),
	update_status_date		DATE,
	is_public				CHAR(1),
	status					CHAR(1)			DEFAULT 0,
	role					CHAR(1)			DEFAULT 1,
	scrap_count				NUMBER			DEFAULT 0,
	report_count			NUMBER			DEFAULT 0,
	PRIMARY KEY(nickname)
);

//유니크(Email, phoneNumber)

ALTER TABLE USERS
ADD CONSTRAINT USERS_UK1 UNIQUE 
(email);

ALTER TABLE USERS
ADD CONSTRAINT USERS_UK2 UNIQUE 
(phone_number);


//그룹 테이블

CREATE TABLE groups (
	group_id		NUMBER				NOT NULL,
	group_name		VARCHAR2(30)		NOT NULL,
	nickname		VARCHAR2(50)		NOT NULL	REFERENCES users(nickname) ON DELETE CASCADE,
	delete_date		DATE,
	group_type		CHAR(1)				NOT NULL,
	group_date		DATE,
	PRIMARY KEY(group_id)
);

//신고 테이블
CREATE TABLE report (
	report_id			NUMBER			NOT NULL,
	report_date			DATE			NOT NULL,
	report_photo		VARCHAR2(100),
	reason				VARCHAR2(100)	NOT NULL,
	reporter_nick		VARCHAR2(50)	NOT NULL	REFERENCES users(nickname) ON DELETE CASCADE,
	target_nick			VARCHAR2(50)	NOT NULL	REFERENCES users(nickname) ON DELETE CASCADE,
	report_type			VARCHAR2(20)	NOT NULL,
	PRIMARY KEY(report_id)
);

//기록 테이블
CREATE TABLE diary (
	diary_id			NUMBER				NOT NULL,
	title				VARCHAR2(100)		NOT NULL,
	diary_addr			VARCHAR2(300)		NOT NULL,
	latitude			NUMBER				NOT NULL,
	longitude			NUMBER				NOT NULL,
	diary_date			DATE				NOT NULL,
	last_update_date	DATE,
	origin_nick			VARCHAR2(50)		NOT NULL	REFERENCES users(nickname) ON DELETE CASCADE,
	start_date			VARCHAR2(20)		NOT NULL,
	end_date			VARCHAR2(20)		NOT NULL,
	content				CLOB,
	thumbnail			VARCHAR2(100),
	view_count			NUMBER				DEFAULT 0,
	delete_date			DATE,
	scrap_nick			VARCHAR2(50)					REFERENCES users(nickname) ON DELETE CASCADE,
	scrap_date			DATE,
	group_id			NUMBER							REFERENCES groups(group_id) ON DELETE CASCADE,
	currency			VARCHAR2(20),
	trans_bill			NUMBER,
	room_bill			NUMBER,
	food_bill			NUMBER,
	tour_bill			NUMBER,
	shop_bill			NUMBER,
	is_public			CHAR(1),
	scrap_count			NUMBER				DEFAULT 0,
	PRIMARY KEY(diary_id)
);

//해시태그 테이블
CREATE TABLE hashtag (
	hashtag_id		NUMBER			NOT NULL,
	diary_id		NUMBER			NOT NULL	REFERENCES diary(diary_id) ON DELETE CASCADE,
	hashtag_name	VARCHAR2(50)	NOT NULL,
	PRIMARY KEY(hashtag_id)
);

//후기 테이블
CREATE TABLE review (
	review_id		NUMBER			NOT NULL,
	nickname		VARCHAR2(50)	NOT NULL	REFERENCES users(nickname) ON DELETE CASCADE,
	review_addr		VARCHAR2(300)	NOT NULL,
	content			VARCHAR2(400)	NOT NULL,
	review_photo	VARCHAR2(100),
	review_date		DATE			NOT NULL,
	star			CHAR(1)			NOT NULL,
	is_allowed		CHAR(1)			NOT NULL,
	PRIMARY KEY(review_id)
);

//북마크 테이블
CREATE TABLE bookmark (
	bookmark_id		NUMBER			NOT NULL,
	diary_id		NUMBER			NOT NULL,
	nickname		VARCHAR2(50)	NOT NULL	REFERENCES users(nickname) ON DELETE CASCADE,
	bookmark_date	DATE			NOT NULL,
	PRIMARY KEY(bookmark_id)
);

//구독 테이블
CREATE TABLE subscribe (
	subscribe_id		NUMBER			NOT NULL,
	subscribe_nick		VARCHAR2(50)	NOT NULL	REFERENCES users(nickname) ON DELETE CASCADE,
	target_nick			VARCHAR2(50)	NOT NULL	REFERENCES users(nickname) ON DELETE CASCADE,
	subscribe_date		DATE			NOT NULL,
	PRIMARY KEY(subscribe_id)
);

//도장 테이블
CREATE TABLE stamp (
	stamp_id		NUMBER			NOT NULL,
	stamp_name		VARCHAR2(50)	NOT NULL,
	stamp_date		DATE			NOT NULL,
	nickname		VARCHAR2(50)	NOT NULL	REFERENCES users(nickname) ON DELETE CASCADE,
	PRIMARY KEY(stamp_id)
);

//게시글 테이블
CREATE TABLE post (
	post_id			NUMBER			NOT NULL,
	nickname		VARCHAR2(50)	NOT NULL	REFERENCES users(nickname) ON DELETE CASCADE,
	title			VARCHAR2(100)	NOT NULL,
	content			CLOB,
	post_date		DATE			NOT NULL,
	view_count		NUMBER			DEFAULT 0,
	post_type		CHAR(1)			NOT NULL,
	PRIMARY KEY(post_id)
);

//댓글 테이블
CREATE TABLE comments (
	comment_id		NUMBER			NOT NULL,
	post_id			NUMBER			NOT NULL	REFERENCES post(post_id) ON DELETE CASCADE,
	content			VARCHAR2(300),
	comment_date	DATE			NOT NULL,
	nickname		VARCHAR2(50)	NOT NULL	REFERENCES users(nickname) ON DELETE CASCADE,
	PRIMARY KEY(comment_id)
);

//사진 테이블
CREATE TABLE photo (
	photo_id				NUMBER			NOT NULL,
	photo_group_id			NUMBER			REFERENCES groups(group_id) ON DELETE CASCADE,
	post_id					NUMBER			REFERENCES post(post_id) ON DELETE CASCADE,
	diary_id				NUMBER			REFERENCES diary(diary_id) ON DELETE CASCADE,
	photo_name				VARCHAR2(100)	NOT NULL,
	photo_addr				VARCHAR2(300),
	latitude				NUMBER,
	longitude				NUMBER,
	photo_date				DATE,
	delete_date				DATE,
	description				VARCHAR2(100),
	diary_photo_type		CHAR(1),
	nickname				VARCHAR2(50) 	REFERENCES users(nickname) ON DELETE CASCADE,
	PRIMARY KEY(photo_id)
);





//채팅방 테이블
CREATE TABLE chat_room (	
	chatroom_id			NUMBER			NOT NULL,
	title				VARCHAR2(100)	NOT NULL,
	max					NUMBER			NOT NULL,
	total				NUMBER			NOT NULL,
	is_allowed			CHAR(1)			NOT NULL,
	head_nick			VARCHAR2(50)	NOT NULL	REFERENCES users(nickname) ON DELETE CASCADE,	
	PRIMARY KEY(chatroom_id)
);

//채팅참여자 테이블
CREATE TABLE chat_member (
	chatroom_id		NUMBER			NOT NULL	REFERENCES chat_room(chatroom_id) ON DELETE CASCADE,
	nickname		VARCHAR2(50)	NOT NULL	REFERENCES users(nickname) ON DELETE CASCADE,
	PRIMARY KEY(chatroom_id)
);

//채팅내역 테이블
CREATE TABLE chat_history (
	chatroom_id		NUMBER			NOT NULL	REFERENCES chat_room(chatroom_id) ON DELETE CASCADE,
	message			VARCHAR2(400)	NOT NULL,
	chat_date		DATE			NOT NULL,
	nickname		VARCHAR2(50)	NOT NULL,
	PRIMARY KEY(nickname)
);






INSERT
INTO users (nickname, email, password, user_name, phone_number, user_addr, like_addr, birth, user_photo, update_status_date, is_public, status, role)
VALUES ('king성영', 'email1', 1234, '김성영', '010-0000-0000', null, null, null, null, null, 'f', 0, 0);

INSERT
INTO users (nickname, email, password, user_name, phone_number, user_addr, like_addr, birth, user_photo, update_status_date, is_public, status, role)
VALUES ('king제현', 'email2', 1234, '임제현', '010-1111-1111', null, null, null, null, null, 'f', 0, 0);

INSERT
INTO users (nickname, email, password, user_name, phone_number, user_addr, like_addr, birth, user_photo, update_status_date, is_public, status, role)
VALUES ('king채경', 'email3', 1234, '김채경', '010-2222-2222', null, null, null, null, null, 'f', 0, 0);

INSERT
INTO users (nickname, email, password, user_name, phone_number, user_addr, like_addr, birth, user_photo, update_status_date, is_public, status, role)
VALUES ('king주원', 'email4', 1234, '정주원', '010-3333-3333', null, null, null, null, null, 'f', 0, 0);

INSERT
INTO users (nickname, email, password, user_name, phone_number, user_addr, like_addr, birth, user_photo, update_status_date, is_public, status, role)
VALUES ('king정인', 'email5', 1234, '박정인', '010-4444-4444', null, null, null, null, null, 'f', 0, 0);



INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default1', 'king성영', null, 1);

INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default2', 'king성영', null, 2);

INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default3', 'king성영', null, 3);



INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default1', 'king제현', null, 1);

INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default2', 'king제현', null, 2);

INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default3', 'king제현', null, 3);



INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default1', 'king채경', null, 1);

INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default2', 'king채경', null, 2);

INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default3', 'king채경', null, 3);



INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default1', 'king주원', null, 1);

INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default2', 'king주원', null, 2);

INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default3', 'king주원', null, 3);



INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default1', 'king정인', null, 1);

INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default2', 'king정인', null, 2);

INSERT
INTO groups (group_id, group_name, nickname, delete_date, group_type)
VALUES (seq_groups_group_id.nextval, 'default3', 'king정인', null, 3);

commit;