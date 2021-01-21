package com.teulda.service.subscribe.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teulda.service.domain.Diary;
import com.teulda.service.domain.Subscribe;
import com.teulda.service.subscribe.SubscribeDao;
import com.teulda.service.subscribe.SubscribeService;

	@Service("subscribeServiceImpl")
	public class SubscribeServiceImpl implements SubscribeService {

		@Autowired
		@Qualifier("subscribeDaoImpl")
		private SubscribeDao subscribeDao;
		
//		@Autowired
//		@Qualifier("diaryDaoImpl")
//		private DiaryDao diaryDao;
		
		public void setSubscribeDao(SubscribeDao subscribeDao){
			this.subscribeDao = subscribeDao;
		}
		
		//디버깅을 위한
		public SubscribeServiceImpl() {  
			System.out.println(this.getClass()+" : default Constructor call");
		}
	

	@Override
	public boolean addSubscribe(Subscribe subscribe) throws Exception {
		if(subscribeDao.checkSubscribe(subscribe)) {
			subscribeDao.addSubscribe(subscribe);
			return true;
		}
		return false;
	}

	@Override
	public List<Subscribe> getSubscribeList(String subNickname) throws Exception {
		return subscribeDao.getSubscribeList(subNickname);
	}
	
	@Override
	public List<Diary> getSubscriberDiaryList(String subNickname) throws Exception{
		
		List<String> list = new ArrayList<String>();
		for(Subscribe each : subscribeDao.getSubscribeList(subNickname)) {
			list.add(each.getSubTargetNickname());
		}
		
		System.out.println(list);
		
		return subscribeDao.getSubscriberDiaryList(list);
	}

	@Override
	public boolean deleteSubscribe(Subscribe subscribe) throws Exception {
		if(!subscribeDao.checkSubscribe(subscribe)) {
			subscribeDao.deleteSubscribe(subscribe);
			return true;
		}
		return false;
	}

	@Override
	public boolean checkSubscribe(Subscribe subscribe) throws Exception {
		return subscribeDao.checkSubscribe(subscribe);	//	구독 중이면 false, 구독하지 않는 중이면 true.(그러니까 구독 가능하면 true)
	}

}
