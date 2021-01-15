//insertPhoto
INSERT 
INTO photo ( photo_id, photo_group_id, post_id, diary_id, photo_name, photo_addr, latitude, longitude, photo_date, delete_date, description, diary_photo_type )
VALUES ( seq_photo_photo_id.nextval, #{photoGroupId}, #{postId}, #{diaryId}, #{photoName : VARCHAR}, #{photoAddr : VARCHAR}, #{latitude : VARCHAR}, #{longitude : VARCHAR}, #{photoDate : DATE}, #{deleteDate : DATE}, #{description : VARCHAR}, #{diaryPhotoType : VARCHAR});


//insertGroups
INSERT
INTO groups ( group_id, group_name, nickname, delete_date, group_type)
VALUES ( seq_groups_group_id.nextval, #{groupName : VARCHAR}, #{nickname : VARCHAR}, #{deleteDate : DATE}, #{groupType : VARCHAR});