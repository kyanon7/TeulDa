package com.teulda.service.diary.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teulda.common.Group;
import com.teulda.common.Search;
import com.teulda.service.diary.DiaryDao;
import com.teulda.service.domain.Diary;

//==> 기록관리 DAO CRUD 구현
//데이터베이스와 직접적인 통신을 담당하는 퍼시스턴스 계층을 담당할 DiaryDao 인터페이스 구현 

@Repository("diaryDaoImpl")
public class DiaryDaoImpl implements DiaryDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public DiaryDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addDiary(Diary diary) throws Exception {
		sqlSession.insert("DiaryMapper.addDiary", diary);
	}

	@Override
	public void addDiaryGroup(Group group) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Diary getDiary(int diaryNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Diary> getDiaryList(Search search, String nickname) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getDiaryCount(String nickname) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	
	public void updateDiary(Diary diary) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateDiaryStatus(Diary diary) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateDiaryGroup(Diary diary) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateDiaryViewCount(int diaryNo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteDiary(int diaryNo) throws Exception {
		// TODO Auto-generated method stub

	}

}
