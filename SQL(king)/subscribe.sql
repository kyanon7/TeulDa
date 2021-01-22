
<!-- SQL : INSERT SUBSCRIBE-->
<insert	id="addSubscribe"	parameterType="com.teulda.service.domain.Subscribe" >

    INSERT
    INTO subscribe(subscribe_id, subscribe_nick, target_nick, subscribe_date)
    VALUES (seq_subscribe_subscribe_id.NEXTVAL, 'king제현', 'king정인', SYSDATE)


<!-- SQL : SELECT SUBSCRIBE LIST -->
<select	id="getSubscribeList"	parameterType="String"	resultMap="subscribeSelectMap">

    SELECT *
    FROM subscribe
    WHERE subscribe_nick = 'king성영'


<!-- SQL : DELETE SUBSCRIBE-->
<delete id="deleteSubscribe"	parameterType="com.teulda.service.domain.Subscribe" >

    DELETE
    FROM subscribe
    WHERE subscribe_nick = 'king성영'
    AND target_nick = 'king제현'


<!-- SQL : CHECK SUBSCRIBE-->
<select id="checkSubscribe"	parameterType="com.teulda.service.domain.Subscribe" resultType="int">

    SELECT COUNT(*)
    FROM subscribe
    WHERE subscribe_nick = 'king정인'
    AND target_nick = 'king주원'

    
    
--다이어리에 들어가는 것

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
    