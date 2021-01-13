
DROP TABLE transaction;
DROP TABLE product;
DROP TABLE users;

DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_transaction_tran_no;


CREATE SEQUENCE seq_product_prod_no		 	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_transaction_tran_no	INCREMENT BY 1 START WITH 10000;


CREATE TABLE users ( 
	user_id 			VARCHAR2(20)	NOT NULL,
	user_name 	VARCHAR2(50)	NOT NULL,
	password 		VARCHAR2(10)	NOT NULL,
	role 					VARCHAR2(5) 		DEFAULT 'user',
	ssn 					VARCHAR2(13),
	cell_phone 		VARCHAR2(14),
	addr 				VARCHAR2(100),
	email 				VARCHAR2(50),
	reg_date 		DATE,
	PRIMARY KEY(user_id)
);


CREATE TABLE product ( 
	prod_no 						NUMBER 				NOT NULL,
	prod_name 				VARCHAR2(100) 	NOT NULL,
	prod_detail 				VARCHAR2(200),
	manufacture_day		VARCHAR2(8),
	price 							NUMBER(10),
	image_file 					VARCHAR2(100),
	reg_date 					DATE,
	PRIMARY KEY(prod_no)
);

CREATE TABLE transaction ( 
	tran_no 					NUMBER 			NOT NULL,
	prod_no 					NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	buyer_id 				VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	payment_option		CHAR(3),
	receiver_name 		VARCHAR2(20),
	receiver_phone		VARCHAR2(14),
	demailaddr 			VARCHAR2(100),
	dlvy_request 			VARCHAR2(100),
	tran_status_code	CHAR(3),
	order_data 			DATE,
	dlvy_date 				DATE,
	PRIMARY KEY(tran_no)
);


INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'admin', 'admin', '1234', 'admin', NULL, NULL, '서울시 서초구', 'admin@mvc.com',to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS')); 

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'manager', 'manager', '1234', 'admin', NULL, NULL, NULL, 'manager@mvc.com', to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));          

INSERT INTO users 
VALUES ( 'user01', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user02', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user03', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user04', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user05', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user06', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user07', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user08', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user09', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user10', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user11', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user12', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user13', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user14', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user15', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user16', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user17', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user18', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user19', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate);
           
           
insert into product values (seq_product_prod_no.nextval,'vaio vgn FS70B','소니 바이오 노트북 신동품','20120514',2000000, 'AHlbAAAAtBqyWAAA.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'자전거','자전거 좋아요~','20120514',10000, 'AHlbAAAAvetFNwAA.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'보르도','최고 디자인 신품','20120201',1170000, 'AHlbAAAAvewfegAB.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'보드세트','한시즌 밖에 안썼습니다. 눈물을 머금고 내놓음 ㅠ.ㅠ','20120217', 200000, 'AHlbAAAAve1WwgAC.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'인라인','좋아욥','20120819', 20000, 'AHlbAAAAve37LwAD.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'삼성센스 2G','sens 메모리 2Giga','20121121',800000, 'AHlbAAAAtBqyWAAA.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'연꽃','정원을 가꿔보세요','20121022',232300, 'AHlbAAAAtDPSiQAA.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'삼성센스','노트북','20120212',600000, 'AHlbAAAAug1vsgAA.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));


commit;



//== Page 처리을 위한 SQL 구성연습

SELECT user_id , user_name , email
FROM users
ORDER BY user_id

currentPage =2
pageSize = 3   
4 ~ 6

SELECT inner_table. * ,  ROWNUM AS row_seq
FROM (	SELECT user_id , user_name , email
				FROM users
				ORDER BY user_id ) inner_table
WHERE ROWNUM <=6;	
//==>           currentPage * paseSize


SELECT * 
FROM (	SELECT inner_table. * ,  ROWNUM AS row_seq
				FROM (	SELECT user_id , user_name , email
								FROM users
								ORDER BY user_id ) inner_table
				WHERE ROWNUM <=6 )
WHERE row_seq BETWEEN 4 AND 6;

//==> (currentPage-1) * paseSize+1           currentPage * paseSize