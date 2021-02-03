//addPhoto(사진등록)
INSERT 
INTO photo ( photo_id, photo_group_id, photo_name, photo_addr, 
			 photo_date, delete_date, nickname)
VALUES ( seq_photo_photo_id.nextval, 
${photoGroupNo},
'${photoName}', '${photoAddr}', sysdate, null, '${nickname}')


//addGroup(앨범등록)
INSERT 
INTO groups ( group_id, group_name, nickname, delete_date, group_type)
VALUES ( seq_groups_group_id.nextval, '${groupName}', '${nickname}', null, '1')


//getPhoto(사진조회)
SELECT
photo_id, photo_group_id, post_id, diary_id, photo_name, photo_addr, 
latitude, longitude, photo_date, delete_date, description, diary_photo_type
FROM photo
WHERE photo_id = #{value}


//getGroup(그룹조회)
SELECT
group_id, group_name, nickname, delete_date, group_type
FROM groups
WHERE group_id = #{value} AND group_type = 1


//updateGroupName(그룹이름변경)
UPDATE groups
SET group_name = #{groupName}
WHERE group_id = #{groupNo}


//updateGroupNo(사진옮기기)
UPDATE photo
SET photo_group_id = #{photoGroupNo}
WHERE photo_id = #{photoNo}


//updatePhotoStatus(사진삭제, 복구 플래그처리)
UPDATE photo
WHERE delete_date = null
where photo_id = #{photoNo}

UPDATE photo
WHERE delete_date = SYSDATE
where photo_id = #{photoNo}


//updateGroupStatus(앨범삭제, 복구 플래그처리)
UPDATE groups
WHERE delete_date = null
where group_id = #{groupNo}

UPDATE groups
WHERE delete_date = SYSDATE
where group_id = #{groupNo}


//deletePhoto(사진 영구삭제)
DELETE
FROM photo
WHERE delete_date IS NOT NULL AND photo_group_id IS NOT NULL AND nickname= #{value}


//deleteGroup(그룹 영구삭제)
DELETE
FROM groups
WHERE delete_date IS NOT NULL AND group_type = 1 AND nickname = #{value}


//deleteGroupInPhoto(그룹안에 있는 사진영구삭제 (휴지통비우기))
DELETE
FROM photo
WHERE photo_group_id IN 
(SELECT	group_id
FROM groups
WHERE delete_date IS NOT NULL AND nickname = #{value})


//getPhotoTotalCount(앨범에 들어있는 사진 갯수)
SELECT
count(*)
FROM photo
WHERE photo_group_id IN 
(SELECT
g.group_id
FROM groups g, photo p
WHERE g.group_id = p.photo_group_id AND g.nickname = #{nickname} AND g.group_id = #{groupNo} AND g.group_type = '1') AND delete_date IS NULL


//getPhotoList(사진목록 조회)
SELECT
photo_id, photo_group_id, photo_name, photo_addr, latitude, longitude, photo_date, delete_date
FROM photo
WHERE photo_group_id IN 
(SELECT
g.group_id
FROM groups g, photo p
WHERE g.group_id = p.photo_group_id AND g.nickname = #{nickname} AND g.group_id = #{groupNo} AND g.group_type = '1') AND delete_date IS NULL
ORDER BY photo_id DESC


//getGroupTotalCount(앨범갯수)
SELECT
count(*)
FROM groups
WHERE nickname = #{nickname} AND group_type = '1' AND delete_date IS NULL


//getGroupList(앨범 리스트 조회)
SELECT
group_id, group_name, nickname, delete_date, group_type
FROM groups
WHERE nickname = #{nickname} AND group_type = '1' AND delete_date IS NULL
ORDER BY group_id DESC


//deletePhotoList(삭제처리된 사진목록 조회)
SELECT
photo_id, photo_group_id, photo_name, photo_addr, latitude, longitude, photo_date, delete_date
FROM photo
WHERE photo_group_id IS NOT NULL AND delete_date IS NOT NULL
ORDER BY delete_date DESC


//deleteGroupList(삭제처리된 앨범목록 조회)
SELECT
group_id, group_name, nickname, delete_date, group_type
FROM groups
WHERE nickname = #{nickname} AND group_type = '1' AND delete_date IS NOT NULL
ORDER BY delete_date DESC
