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
SELECT r.target_nick, email, (SELECT COUNT(*)FROM report r, users u
							  where r.target_nick = 'king제현' and r.target_nick = u.nickname)
                               FROM report r, users u
                               where r.target_nick = 'king제현'
                               GROUP BY r.target_nick

	  
	  
//상태수정날짜에서 쓰일 논리(현재날짜에서 변경날짜 빼기)
SELECT TRUNC(SYSDATE) - TO_DATE('20171110', 'YYYYMMDD') FROM DUAL;

SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD')) - TO_DATE('19930315') FROM DUAL;	  	