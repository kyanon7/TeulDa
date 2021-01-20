package com.teulda.service.subscribe;

import java.util.List;

import com.teulda.service.domain.Subscribe;

public interface SubscribeDao {

	// INSERT SUBSCRIBE
	public void addSubscribe(Subscribe subscribe) throws Exception;
	
	// SELECT SUBSCRIBE LIST
	public List<Subscribe> getSubscribeList(String subNickname) throws Exception;
	
	// DELETE SUBSCRIBE
	public void deleteSubscribe(Subscribe subscribe) throws Exception;
	
	// CHECK SUBSCRIBE
	public boolean checkSubscribe(Subscribe subscribe) throws Exception;
	
}
