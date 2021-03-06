// DiaryMapper.xml 작성 전 연습해본 예제

// add diary

insert 
into diary (diary_id, title, diary_addr, latitude, longitude, diary_date, origin_nick, start_date, end_date, 
            content, thumbnail, group_id,
            currency, trans_bill, room_bill, food_bill, tour_bill, shop_bill, is_public)
values (seq_diary_diary_id.nextval, '제목', '서울시 강서구', '36.541235', '79.35489', sysdate, 'king주원', '20210115', '20210116', 
        '안녕!', 'a.jpg' ,  (select group_id
                            from groups
                            where nickname='king주원' and group_name = 'default2'),
        '달러', 20000, 30000, 40000, 50000, 60000, 'f');

// add hashtag 

insert
into hashtag (hashtag_id, diary_id, hashtag_name)
values (seq_hashtag_hashtag_id.nextval, 
            (SELECT diary_id 
            FROM
            (SELECT * 
            FROM diary 
            where origin_nick = 'king주원'
            ORDER BY diary_id desc)
            WHERE ROWNUM = 1),
        '겨울여행');

// add Photo 

insert
into photo (photo_id, diary_id, 
            photo_name, description, diary_photo_type)
values (seq_photo_photo_id.nextval, (SELECT diary_id 
                                    FROM
                                    (SELECT * 
                                    FROM diary 
                                    where origin_nick = 'king주원'
                                    ORDER BY diary_id desc)
                                    WHERE ROWNUM = 1),
        'a.jpg', '너무 춥다!', 'd')

// add hashtag랑 add Photo 할 때 기록번호를 알 수 없음. 
// 그러므로 가장 최근에 내가 작성한 기록번호 가져오는 Query가 있어야 함! 

SELECT diary_id 
FROM
(SELECT * 
FROM diary 
where origin_nick = 'king주원'
ORDER BY diary_id desc)
WHERE ROWNUM = 1

// add diary group

INSERT 
INTO groups (group_id, group_name, nickname, group_type)
VALUES (seq_groups_group_id.nextval, '겨울여행', 'king주원', '2')

// get diary 

select * 
from diary
where diary_id = 10006

+ 그룹 이름까지 가져오기

select d.*, g.group_name
from diary d, groups g
where diary_id = 10055 and d.group_id = g.group_id

// get hashtag list

select *
from hashtag
where diary_id = 10040

// get photo list

SELECT * 
FROM PHOTO
WHERE diary_id = 10041

// get diary group list

select group_id, group_name
from groups
where nickname = 'king주원' and group_type = 2;

// update diary

UPDATE diary
SET title = '변경한 기록 제목!',
    diary_addr = '부산 광안리',
    latitude = 59.6784712535,
    longitude = 946.5845321,
    last_update_date = sysdate, 
    start_date = '21-01-17',
    end_date = '21-01-18',
    content = '변경한 기록 내용~~!!',
    thumbnail = 'update.jpg',
    currency = '위안',
    trans_bill = '10000',
    room_bill = '20000',
    food_bill = '30000',
    tour_bill = '40000',
    shop_bill = '50000',
    is_public = 'f'
WHERE diary_id = 10038

// delete hashtag 

delete 
from hashtag
where hashtag_id = 10022

// delete photo

delete
from photo
where photo_id = 10000

// update diary status

update diary
set delete_date = sysdate
where diary_id = 10038;

// update diary group

update diary
set group_id = 10040
where diary_id = 10038;

// delete diary 
// (diary delete 하기 전에 해시태그, 사진 부터 지워야 함)

delete 
from diary
where diary_id = 10038

// delete hashtag use diary no

delete 
from hashtag
where diary_id = 10038

// delete photo use diary no

delete 
from photo
where diary_id = 10038

// update diary view count

update diary 
set view_count = view_count + 1
where diary_id = 10047;

// get my diary list 

// (내 기록 목록)

select  diary_id, title, diary_addr, latitude, longitude, 
        diary_date, start_date, end_date,
        content, delete_date, thumbnail, group_id
from diary
where origin_nick = 'king주원' and delete_date is null;

// (내 기록 지도)
SELECT  diary_id, title, diary_addr, latitude, longitude, 
        start_date, end_date,
        content, thumbnail, group_id
        FROM diary
        where origin_nick = 'king주원' and delete_date is null;

// (휴지통)

select  diary_id, title, diary_addr, latitude, longitude, 
        diary_date, start_date, end_date,
        content, delete_date, thumbnail, group_id
from diary
where origin_nick = 'king주원' and delete_date is not null;

// get my diary list를 한 페이지에 보이는 것만 찾아오게끔 함 

select * 
from ( select inner_table.*, rownum as row_seq
        from    (select  diary_id, title, diary_addr, latitude, longitude, 
                diary_date, start_date, end_date,
                content, delete_date, thumbnail, group_id
                from diary
                where origin_nick = 'king주원' and delete_date is null) inner_table
      where rownum <= 5 )
where row_seq between 1 and 5

// get my diary count

select count(*)
from ( select  diary_id, title, diary_addr, latitude, longitude, 
                diary_date, start_date, end_date,
                content, delete_date, thumbnail, group_id
        from diary
        where origin_nick = 'king주원' and delete_date is null ) countTable
        
// get diary list (통합검색시 보여지는 리스트)를 한 페이지에 보이는 것만 찾아오게끔 함

select * 
from ( select inner_table.*, rownum as row_seq
        from    (select     diary_id, title, diary_addr, diary_date, 
                            origin_nick, start_date, end_date,
                            content, thumbnail, view_count
                from diary
                where is_public = 't' and delete_date is null and scrap_nick is null ) inner_table
      where rownum <= 5 )
where row_seq between 1 and 5;

+ 검색조건 추가 (북마크 횟수까지! 이렇게 하면 CLOB 때문에 매핑시 오류남..)

SELECT inner_table.*, rownum as row_seq
        	 FROM    (SELECT    d.diary_id, d.title, d.diary_addr, d.diary_date, 
                            	d.origin_nick, d.start_date, d.end_date,
                                DBMS_LOB.SUBSTR(CONTENT, 300, 1) as content,
                            	d.thumbnail, d.view_count, d.scrap_count, 
                                (select count(*)
                                from bookmark
                                where diary_id = d.diary_id) as bookmark_count
                	 FROM diary d
               	 	 WHERE (is_public = 't' and delete_date is null and scrap_nick is null)
                            and 
                            (title like '%안녕%'
                            or content like '%한라봉%'
                            or diary_addr like '%안녕%'
                            or origin_nick like '%안녕%')
                     group by   diary_id, title, diary_addr, diary_date, origin_nick, 
                                start_date, end_date, thumbnail, view_count, 
                                scrap_count, DBMS_LOB.SUBSTR(CONTENT, 300, 1)
                     order by bookmark_count desc, diary_date desc
                     ) inner_table;
                     
+ 북마크 횟수는 X

SELECT inner_table.*, rownum as row_seq
        	 FROM    (SELECT    diary_id, title, diary_addr, diary_date, 
                            	origin_nick, start_date, end_date,
                                content,
                            	thumbnail, view_count, scrap_count
                	 FROM diary 
               	 	 WHERE (is_public = 't' and delete_date is null and scrap_nick is null)
                            and 
                            (title like '%안녕%'
                            or content like '%한라봉%'
                            or diary_addr like '%안녕%'
                            or origin_nick like '%안녕%')
                     order by diary_date desc
                     ) inner_table;

// get diary count

select count(*)
from (select    diary_id, title, diary_addr, diary_date, 
                origin_nick, start_date, end_date,
                content, thumbnail, view_count
      from diary
      where is_public = 't' and delete_date is null and scrap_nick is null 
     ) countTable 
     
// get bookmark count

select count(*)
from (select *
      from bookmark
      where diary_id = 10048);
      
// update diary scrap count

update diary
set scrap_count = scrap_count + 1
where diary_id = 10055

// get scrap count (유저의 글을 몇번 스크랩해갔는지) - 사용 X
// 이거 쓰면 기록 지우면 스크랩 횟수 줄어들어서 불가능 

select sum(scrap_count)
from diary
where origin_nick = 'king주원'

// update user scrap count

UPDATE users
SET scrap_count = scrap_count + 1
WHERE nickname = 'king영진'


<!-- SQL : SELECT SUBSCRIBE DIARY LIST -->

--나 한테 구독당한 사람들 기록을 가져오기

	SELECT * 
	FROM diary 
	WHERE diary_date 
	BETWEEN '2020-12-22' AND '2021-01-15' 
	AND is_public = 't' 
	ORDER BY diary_date DESC
    
    
<!-- SQL : SELECT SUBSCRIBE DIARY LIST -->
   <select  id="getSubscribeDiaryList"  parameterType="map"   resultMap="diarySelectMap">
   SELECT diary_id, title, diary_addr, diary_date, origin_nick, start_date, end_date, thumbnail, group_id 
   FROM diary
   WHERE origin_nick IN 
   <foreach collection="subscriberList" item="userList" index="index" open="(" close=")" separator=",">#{userList}</foreach>
   <choose>
		<when test="end != null">
			AND diary_date BETWEEN #{start} AND #{end}
		</when>
		<otherwise>
			AND diary_date &gt; #{start}
		</otherwise>
	</choose>
   AND is_public = 't'
   ORDER BY diary_date DESC
   </select>
   
// 조회수 TOP 기록

select *
from
(select diary_id, diary_addr, title, origin_nick, view_count
 from diary
 order by view_count desc
)
where rownum <= 9;

// 북마크 TOP 기록

select * 
from 
(   select d.diary_id, d.diary_addr, d.title, d.origin_nick,
      (select count(*)
       from bookmark
       where diary_id = d.diary_id) as bookmark_count
    from diary d
    order by bookmark_count desc
)
where rownum <= 9; 

// 많이 사용된 해시태그 TOP

select *
from
(   select hashtag_name, count(*)
    from hashtag
    group by hashtag_name
    order by count(*) desc
)
where rownum <= 9;

// 휴지통 기록 비우기 (전체삭제)

delete
from diary
where delete_date is not null and origin_nick = 'king주원' 

// 휴지통으로 이동된 기록에 포함된 해시태그 전체삭제

delete
from hashtag
where diary_id in (select diary_id 
                   from diary
                   where delete_date is not null and origin_nick = 'king주원')

// 그룹 이름 수정

update groups
set group_name = '하이하이'
where group_id = 10121