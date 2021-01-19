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
	  	
	  	