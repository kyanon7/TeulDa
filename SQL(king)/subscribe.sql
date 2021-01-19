
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
