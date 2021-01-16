//insertPhoto(사진등록)
INSERT 
INTO photo ( photo_id, photo_group_id, post_id, diary_id, photo_name, photo_addr, 
			latitude, longitude, photo_date, delete_date, description, diary_photo_type )
VALUES ( seq_photo_photo_id.nextval, 
	       (select group_id 
			from groups
			where nickname='${nickname}' and group_name = 'default1'),
			null, null, '${photoName}', '${photoAddr}', ${latitude}, ${longitude}, null, null, null, null)

//insertGroup(앨범등록)
INSERT 
INTO groups ( group_id, group_name, nickname, delete_date, group_type)
VALUES ( seq_groups_group_id.nextval, '${groupName}', '${nickname}', null, '1')

//getPhoto(사진조회 1개)
SELECT
photo_id, photo_group_id, post_id, diary_id, photo_name, photo_addr, 
latitude, longitude, photo_date, delete_date, description, diary_photo_type
FROM photo
WHERE photo_id = #{value}

//getGroup(앨범조회 1개)
SELECT
group_id, group_name, nickname, delete_date, group_type
FROM groups
WHERE group_id = #{value} AND group_type = 1

//updateGroupName(앨범이름 변경)
UPDATE groups
SET group_name = #{groupName}
WHERE group_id = #{groupNo}

//updateGroupNo(사진앨범 변경)
UPDATE photo
SET photo_group_id = #{photoGroupNo}
WHERE photo_id = #{photoNo}

//updatePhotoStatus(삭제, 복구)
UPDATE photo
SET delete_date = sysdate
WHERE photo_id = #{photoNo}

UPDATE photo
SET delete_date null
WHERE photo_id = #{photoNo}

//updatreGroupStatus(삭제, 복구)
UPDATE photo
delete_date = null
WHERE photo_id IN
(SELECT 
p.photo_id
FROM photo p, groups g
WHERE g.group_id = p.photo_group_id AND p.photo_group_id = #{groupNo})

UPDATE photo
delete_date = sysdate
WHERE photo_id IN
(SELECT 
p.photo_id
FROM photo p, groups g
WHERE g.group_id = p.photo_group_id AND p.photo_group_id = #{groupNo})

//deletePhoto
DELETE
FROM photo
WHERE delete_date IS NOT NULL AND photo_group_id IN 
(SELECT group_id
FROM groups
WHERE nickname = #{value} AND delete_date IS NOT NULL)
AND photo_group_id IS NOT NULL

//deleteGroup
DELETE
FROM groups
WHERE delete_date IS NOT NULL AND group_type = 1 AND nickname = #{value}