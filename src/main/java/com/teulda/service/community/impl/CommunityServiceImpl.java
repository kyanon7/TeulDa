package com.teulda.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teulda.common.Search;
import com.teulda.service.community.CommunityDao;
import com.teulda.service.community.CommunityService;
import com.teulda.service.domain.Bookmark;

//	@Service("communityServiceImpl")
	public class CommunityServiceImpl implements CommunityService {

//		//setter 인젝션	
//		@Autowired
//		@Qualifier("communityDaoImpl")
//		private CommunityDao communityDao;
//		
//		public void setCommunityDao(CommunityDao communityDao){
//			this.communityDao = communityDao;
//		}
//		
//		//디버깅을 위한
//		public CommunityServiceImpl() {  
//			System.out.println(this.getClass());
//		}
	
	
	@Override
	public void addBookmark(Bookmark bookmark) throws Exception {
		
//		communityDao.addBookmark(bookmark);
		
	}

	@Override
	public void deleteBookmark(int bookmark) throws Exception {
		
//		communityDao.deleteBookmark(bookmark);
		
	}

	@Override
	public Map<String, Object> getBookmarkList(Search search) throws Exception {
//		List<Bookmark> list = communityDao.getBookmarkList(search);
//		int totalCount = communityDao.getTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("totalCount", totalCount);
//		
//		return map;
		return null;
	}

}
