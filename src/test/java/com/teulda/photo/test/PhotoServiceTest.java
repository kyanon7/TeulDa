package com.teulda.photo.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.common.Search;
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
	//@Test
	public void testAddPhoto() throws Exception{
		
		Photo photo = new Photo();
		
		System.out.println("ㅎㅇ");
//		photo.setPhotoNo(photoNo);
		photo.setPhotoGroupNo(10018);
//		photo.setPostNo(postNo);
//		photo.setDiaryNo(diaryNo);
		photo.setPhotoName("testName2");
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
		group.setGroupName("testGroup3");
		group.setNickname("king정인");
//		group.setDeleteDate(deleteDate);
//		group.setGroupType(groupType);
		
		System.out.println(group);
		photoService.addGroup(group);
	}
	
	//사진조회
	//@Test
	public void testGetPhoto() throws Exception{
		
		Photo photo = photoService.getPhoto(10000);
		
		System.out.println("디버깅용");
		
		Assert.assertEquals(10012, photo.getPhotoGroupNo());
		Assert.assertEquals(0, photo.getPostNo());
		Assert.assertEquals(0, photo.getDiaryNo());
		Assert.assertEquals("testName", photo.getPhotoName());
		Assert.assertEquals("testAddr", photo.getPhotoAddr());
//		Assert.assertEquals(0.0, photo.getLatitude());
//		Assert.assertEquals(0.0, photo.getLongitude());
		Assert.assertEquals(null, photo.getPhotoDate());
		Assert.assertEquals(null, photo.getDeleteDate());
		Assert.assertEquals(null, photo.getDescription());
		Assert.assertEquals(null, photo.getDiaryPhotoType());
		
		System.out.println("Assert 종료");
	}
	
	//그룹조회
	//@Test
	public void testGetGroup() throws Exception{
		
		Group group = photoService.getGroup(10016);
		
		System.out.println("디버깅용");
		
		Assert.assertEquals(10016, group.getGroupNo());
		Assert.assertEquals("testGroup", group.getGroupName());
		Assert.assertEquals("king정인", group.getNickname());
		Assert.assertEquals(null, group.getDeleteDate());
		Assert.assertEquals("1", group.getGroupType());
	}
	
	//사진앨범 변경
	//@Test
	public void testUpdateGroupNo() throws Exception{
		
		Photo photo = photoService.getPhoto(10000);
		System.out.println("photoGroupNo 수정 전 : "+photo);
		
		photo.setPhotoGroupNo(10015);
		System.out.println("photoGroupNo 수정 후 : "+photo);
		
		photoService.updateGroupNo(photo);
	}
	
	//앨범이름 변경
	//@Test
	public void testUpdateGroupName() throws Exception{
		
		Group group = photoService.getGroup(10015);
		System.out.println("GroupName 수정 전 : " +group);
		
		group.setGroupName("수정한 GroupName");
		System.out.println("GroupName 수정 후 : "+group);
		
		photoService.updateGroupName(group);
	}
	
	//사진삭제 플래그처리
	//@Test
	public void testUpdatePhotoStatus() throws Exception{
		
		Photo photo = photoService.getPhoto(10000);
		System.out.println(photo);
		
		photoService.updatePhotoStatus(photo);
	}
	
	//앨범삭제 플래그처리(앨범에 있는 사진 포함)
	//@Test
	public void testUpdateGroupStatus() throws Exception{
		
		Group group = photoService.getGroup(10018);
		System.out.println(group);
		
		photoService.updateGroupStatus(group);
		photoService.updateGroupPhotoStatus(group);
	}
	
	//사진영구 삭제(휴지통 비우기)
	//@Test
	public void testDeletePhoto() throws Exception{
		
		photoService.deletePhoto("king정인");
		photoService.deleteGroup("king정인");
	}
	
	//사진목록 & 갯수
	//@Test
	public void testGetPhotoList() throws Exception{
		
		Group group = new Group();
		group.setNickname("king정인");
		group.setGroupNo(10016);
		
		System.out.println("Junit Test : "+group);
		
		Map<String, Object> map = photoService.getPhotoList(group);
		
		List<Object> list = (List<Object>)map.get("photoList");
		System.out.println("photoList : "+list);
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("totalCount : "+totalCount);
	}
	
	//앨범목록 & 갯수
	//@Test
	public void testGetGroupList() throws Exception{
		
		Group group = new Group();
		group.setNickname("king정인");
		
		System.out.println("Junit Test : "+group);
		
		Map<String, Object> map = photoService.getGroupList(group);
		
		List<Object> list = (List<Object>)map.get("groupList");
		System.out.println("groupList : "+list);
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("totalCount : "+totalCount);
		
	}
	
}
