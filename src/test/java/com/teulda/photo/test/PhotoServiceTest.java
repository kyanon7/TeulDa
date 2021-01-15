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

//@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class PhotoServiceTest {

	@Autowired
	@Qualifier("photoServiceImpl")
	private PhotoService photoService;
	

	@Test
	public void testAddPhoto() throws Exception{
		
		Photo photo = new Photo();
		
//		photo.setPhotoNo(photoNo);
		photo.setPhotoGroupNo(10012);
//		photo.setPostNo(postNo);
//		photo.setDiaryNo(diaryNo);
		photo.setPhotoName("testName");
		photo.setPhotoAddr("testAddr");
		photo.setLatitude("00.0000");
		photo.setLongitude("00.0000");
//		photo.setPhotoDate(photoDate);
//		photo.setDeleteDate(deleteDate);
//		photo.setDescription(description);
//		photo.setDiaryPhotoType(diaryPhotoType);
		
		System.out.println(photo);
		photoService.addPhoto(photo);
	}
}
