package com.teulda.photo.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.service.photo.PhotoService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class PhotoServiceTest {

	@Autowired
	@Qualifier("photoServiceImpl")
	private PhotoService photoService;
	
	//사진등록
	@Test
	public void testAddPhoto() throws Exception{
		
		Photo photo = new Photo();
		
		System.out.println("ㅎㅇ");
//		photo.setPhotoNo(photoNo);
		photo.setPhotoGroupNo(10012);
//		photo.setPostNo(postNo);
//		photo.setDiaryNo(diaryNo);
		photo.setPhotoName("testName");
		photo.setPhotoAddr("testAddr");
		photo.setLatitude(00.0000);
		photo.setLongitude(00.0000);
//		photo.setPhotoDate(photoDate);
//		photo.setDeleteDate(deleteDate);
//		photo.setDescription(description);
//		photo.setDiaryPhotoType(diaryPhotoType);
		photo.setNickname("king정인");
		
		System.out.println(photo);
		photoService.addPhoto(photo);
	}
	
	//앨범등록
	//@Test
	public void testAddGroup() throws Exception{
		
		Group group = new Group();
		
		System.out.println("디버깅용");
//		group.setGroupNo(groupNo);
		group.setGroupName("testGroup");
		group.setNickname("king정인");
//		group.setDeleteDate(deleteDate);
//		group.setGroupType(groupType);
		
		System.out.println(group);
		photoService.addGroup(group);
	}
}
