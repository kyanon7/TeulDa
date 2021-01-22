package com.teulda.service.diary.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;
import com.teulda.service.diary.DiaryDao;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.HashTag;

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
	public void addHashTag(HashTag hashTag) throws Exception {
		sqlSession.insert("DiaryMapper.addHashTag", hashTag);
	}

	@Override
	public void addPhoto(Photo photo) throws Exception {
		sqlSession.insert("DiaryMapper.addPhoto", photo);
	}

	@Override
	public void addDiaryGroup(Group group) throws Exception {
		sqlSession.insert("DiaryMapper.addDiaryGroup", group);
	}

	@Override
	public Diary getDiary(int diaryNo) throws Exception {
		return (Diary) sqlSession.selectOne("DiaryMapper.getDiary", diaryNo);
	}
	
	@Override
	public int getBookmarkCount(int diaryNo) throws Exception {
		return sqlSession.selectOne("DiaryMapper.getBookmarkCount", diaryNo);
	}
	
	@Override
	public List<HashTag> getHashTagList(int diaryNo) throws Exception {
		return sqlSession.selectList("DiaryMapper.getHashTagList", diaryNo);
	}

	@Override
	public List<Photo> getPhotoList(int diaryNo) throws Exception {
		return sqlSession.selectList("DiaryMapper.getPhotoList", diaryNo);
	}

	@Override
	public List<Group> getDiaryGroupList(String nickname) throws Exception {
		return sqlSession.selectList("DiaryMapper.getDiaryGroupList", nickname);
	}

	@Override
	public List<Diary> getMyDiaryList(Search search, String nickname, char isDelete) throws Exception {
		Map<String, Object> map = new HashMap <String, Object>();
		
		map.put("nickname", nickname);
		map.put("search", search);
		map.put("isDelete", isDelete);
		
		return sqlSession.selectList("DiaryMapper.getMyDiaryList", map);
	}
	
	@Override
	public int getMyDiaryCount(Search search, String nickname, char isDelete) throws Exception {
		Map<String, Object> map = new HashMap <String, Object>();
		
		map.put("nickname", nickname);
		map.put("search", search);
		map.put("isDelete", isDelete);
		
		return sqlSession.selectOne("DiaryMapper.getMyDiaryCount", map);
	}
	
	@Override
	public List<Diary> getDiaryList(Search search) throws Exception {
		return sqlSession.selectList("DiaryMapper.getDiaryList", search);
	}
	
	@Override
	public int getDiaryCount(Search search) throws Exception {
		return sqlSession.selectOne("DiaryMapper.getDiaryCount", search);
	}

	@Override
	public void updateDiary(Diary diary) throws Exception {
		sqlSession.update("DiaryMapper.updateDiary", diary);
	}

	@Override
	public void updateDiaryStatus(Diary diary) throws Exception {
		sqlSession.update("DiaryMapper.updateDiaryStatus", diary);
	}

	@Override
	public void updateDiaryGroup(Diary diary) throws Exception {
		sqlSession.update("DiaryMapper.updateDiaryGroup", diary);
	}

	@Override
	public void updateDiaryViewCount(int diaryNo) throws Exception {
		sqlSession.update("DiaryMapper.updateDiaryViewCount", diaryNo);
	}
	
	@Override
	public void updateDiaryScrapCount(int diaryNo) throws Exception {
		sqlSession.update("DiaryMapper.updateDiaryScrapCount", diaryNo);
	}
	
	@Override
	public void updateUserScrapCount(String originNickname) throws Exception {
		sqlSession.update("DiaryMapper.updateUserScrapCount", originNickname);
	}

	@Override
	public void deleteDiary(int diaryNo) throws Exception {
		sqlSession.delete("DiaryMapper.deleteDiary", diaryNo);
	}

	@Override
	public void deleteHashTagUseDiaryNo(int diaryNo) throws Exception {
		sqlSession.delete("DiaryMapper.deleteHashTagUseDiaryNo", diaryNo);
	}

	@Override
	public void deletePhotoUseDiaryNo(int diaryNo) throws Exception {
		sqlSession.delete("DiaryMapper.deletePhotoUseDiaryNo", diaryNo);
	}

	@Override
	public void deleteHashTag(int hashTagNo) throws Exception {
		sqlSession.delete("DiaryMapper.deleteHashTag", hashTagNo);
	}

	@Override
	public void deletePhoto(int photoNo) throws Exception {
		sqlSession.delete("DiaryMapper.deletePhoto", photoNo);
	}
	
	@Override
	public void deleteGroup(int groupNo) throws Exception {
		sqlSession.delete("DiaryMapper.deleteGroup", groupNo);
	}
	
	@Override
	public List<Diary> getSubscriberDiaryList(Map<String, Object> subscriberListInfo) throws Exception{
		return sqlSession.selectList("DiaryMapper.getSubscribeDiaryList", subscriberListInfo);
	}
}
