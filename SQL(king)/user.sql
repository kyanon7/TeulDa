	SELECT COUNT(*)
	  	FROM(	SELECT nickname , email , user_name
						FROM users
						 ) countTable	
	
						 
						 
//신고한사람으로 신고내역 select					 
SELECT  r.reporter_nick , r.reason
	FROM users u, report r 
	WHERE u.nickname = r.reporter_nick;
	
//신고당한사람으로 신고내역 select					 
SELECT   r.reason,r.reporter_nick
	FROM users u, report r 
	WHERE u.nickname = r.target_nick;
	
SELECT   r.target_nick,r.reason,r.reporter_nick
	FROM users u, report r 
	WHERE u.nickname = 'king제현';

//신고횟수 카운트(테이블컬럼 없으므로 직접 화면에 뿌려주기)
SELECT COUNT(*)
	 FROM report
	  where target_nick = 'king제현';
	  
//king 제현= #{targetNick}
SELECT r.target_nick, (SELECT COUNT(*)FROM report r, users u
							  where r.target_nick = 'king제현' and r.target_nick = u.nickname)
                               FROM report r, users u
                               where r.target_nick = 'king제현'
                               GROUP BY r.target_nick
                               
                               
//신고카운트가 10회 이상인 유저리스트(블랙리스트)                               
SELECT u.user_name ,u.email,(SELECT COUNT(*)FROM report where target_nick = 'king제현'), u.status
                               FROM report r, users u
                               where (SELECT COUNT(*)FROM report where target_nick = 'king제현') >= 10
                               GROUP BY  u.user_name ,u.email,r.report_photo,u.status
                               
//
delete from subscribe
    from subscribe sb, users u
    where sb.subscribe_nick = u.nickname;
 DELETE FROM REVIEW WHERE NICKNAME = (SELECT NICKNAME FROM USERS WHERE NICKNAME='testUser2');
 DELETE FROM HASHTAG WHERE DIARY_ID = (SELECT NICKNAME FROM USERS WHERE NICKNAME='testUser2');
 DELETE FROM BOOKMARK WHERE NICKNAME = (SELECT NICKNAME FROM USERS WHERE NICKNAME='testUser2');
 DELETE FROM SUBSCRIBE WHERE SUBSCRIBE_NICK = (SELECT NICKNAME FROM USERS WHERE NICKNAME='testUser2');
 DELETE FROM REPORT WHERE REPORTER_NICK = (SELECT NICKNAME FROM USERS WHERE NICKNAME='testUser2');
 DELETE FROM DIARY WHERE ORIGIN_NICK = (SELECT NICKNAME FROM USERS WHERE NICKNAME='testUser2');
 DELETE FROM GROUPS WHERE NICKNAME = (SELECT NICKNAME FROM USERS WHERE NICKNAME='testUser2');
 DELETE FROM STAMP WHERE NICKNAME = (SELECT NICKNAME FROM USERS WHERE NICKNAME='testUser2');
 DELETE FROM CHAT_HISTORY WHERE CHATROOM_ID = (SELECT CHAT_ROOM FROM USERS WHERE CHATROOM_ID='testUser2');
 DELETE FROM COMMNETS WHERE NICKNAME = (SELECT NICKNAME FROM USERS WHERE NICKNAME='testUser2');
 DELETE FROM CHAT_MEMBER WHERE NICKNAME = (SELECT NICKNAME FROM USERS WHERE NICKNAME='testUser2');
 DELETE FROM STAMP WHERE NICKNAME = (SELECT NICKNAME FROM USERS WHERE NICKNAME='testUser2');
 DELETE FROM POST WHERE NICKNAME = (SELECT NICKNAME FROM USERS WHERE NICKNAME='testUser2');
                               
                               
                               
 //신고사유 보기                         
SELECT r.reporter_nick, r.reason ,r.report_type,r.report_date,r.report_photo
                               FROM report r, users u
                               where r.target_nick = 'king제현'
                               GROUP BY r.reporter_nick, r.reason,r.report_type,r.report_date,r.report_photo

	  
	  
//상태수정날짜에서 쓰일 논리(현재날짜에서 변경날짜 빼기)
SELECT TRUNC(SYSDATE) - TO_DATE('20171110', 'YYYYMMDD') FROM DUAL;

SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD')) - TO_DATE('19930315') FROM DUAL;	  	