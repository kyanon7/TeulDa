package com.teulda.service.post.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teulda.common.Search;
import com.teulda.service.domain.Comment;
import com.teulda.service.domain.Post;
import com.teulda.service.post.PostDao;

@Repository("postDaoImpl")
public class PostDaoImpl implements PostDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public PostDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addPost(Post post) throws Exception {
		sqlSession.insert("PostMapper.addPost", post);
		
	}

	@Override
	public Post getPost(int postNo) throws Exception {
		
		return sqlSession.selectOne("PostMapper.getPost",postNo);
	}

	@Override
	public void updatePost(Post post) throws Exception {
		
		sqlSession.update("PostMapper.updatePost", post);
		
	}

	@Override
	public void deletePost(int postNo) throws Exception {
		
		sqlSession.delete("PostMapper.deletePost", postNo);
		
	}

	@Override
	public List<Post> getPostList(Search search) throws Exception {
		
		return sqlSession.selectList("PostMapper.getPostList", search);
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		
		sqlSession.insert("CommentMapper.addComment", comment);
		
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		
		sqlSession.update("CommentMapper.updateComment", comment);
	}

	@Override
	public void deleteComment(int commentNo) throws Exception {
		
		sqlSession.delete("CommentMappepr.deleteComment", commentNo);
		
	}

	@Override
	public List<Comment> getCommentList(Search search) throws Exception {
		
		return sqlSession.selectList("CommentMapper.getCommentList", search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
	
		return sqlSession.selectOne("PostMapper.getTotalCount", search);
	}

}
