package com.teulda.service.subscribe;

import java.util.List;

import com.teulda.service.domain.Subscribe;

public interface SubscribeService {

	// 구독 추가
	public boolean addSubscribe(Subscribe subscribe) throws Exception;
	
	// 구독 목록 조회
	public List<Subscribe> getSubscribeList(String subNickname) throws Exception;
	
	// 구독 취소
	public boolean deleteSubscribe(Subscribe subscribe) throws Exception;
	
	// 구독 상태 확인
	public boolean checkSubscribe(Subscribe subscribe) throws Exception;
	
}
