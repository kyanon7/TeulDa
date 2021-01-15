
// add diary 연습 예제 

insert 
into diary (diary_id, title, diary_addr, latitude, longitude, diary_date, origin_nick, start_date, end_date, 
            content, thumbnail, group_id,
            currency, trans_bill, room_bill, food_bill, tour_bill, shop_bill, is_public)
values (seq_diary_diary_id.nextval, '제목', '서울시 강서구', '36.541235', '79.35489', sysdate, 'king주원', '20210115', '20210116', 
        '안녕!', 'a.jpg' ,  (select group_id
                            from groups
                            where nickname='king주원' and group_name = 'default2'),
        '달러', 20000, 30000, 40000, 50000, 60000, 'f');
