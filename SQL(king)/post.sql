// add post

	INSERT
	INTO POST (post_id, nickname, title, content, post_date, view_count, post_type)
	VALUES	(seq_post_post_id.nextval, 'king제현', '제목', 
			'내용', SYSDATE, '0', '1')
			

// get post

	SELECT
	*
	FROM post
	WHERE post_id = #{postNo}
	
	
// update post

	UPDATE post
		<set>
			nickname		=#{nickname},
			title			=#{postTitle},
			content			=#{postContents},
			post_type		=#{postCategory}
		</set>
			WHERE post_id = #{postNo}
			
// delete post

	DELETE
	 	FROM post
	 	WHERE post_id = #{postNo}
	 	
// 