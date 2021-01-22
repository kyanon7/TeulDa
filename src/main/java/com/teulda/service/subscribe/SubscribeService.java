package com.teulda.service.subscribe;

import java.sql.Timestamp;
import java.util.List;

import com.teulda.service.domain.Diary;
import com.teulda.service.domain.Subscribe;

public interface SubscribeService {

	// 구독 추가
	public boolean addSubscribe(Subscribe subscribe) throws Exception;
	
	// 구독 목록 조회
	public List<Subscribe> getSubscribeInfoList(String subNickname) throws Exception;
	
	// 구독자 목록
	public List<String> getSubscriberList(String subNickname) throws Exception;
		
	// 구독자 기록 목록 조회
	public List<Diary> getSubscriberDiaryList(List<String> subscriberList, Timestamp start) throws Exception;
	public List<Diary> getSubscriberDiaryPeriodList(List<String> subscriberList, Timestamp start, Timestamp end) throws Exception;
	
	// 구독 취소
	public boolean deleteSubscribe(Subscribe subscribe) throws Exception;
	
	// 구독 상태 확인
	public boolean checkSubscribe(Subscribe subscribe) throws Exception;

}
