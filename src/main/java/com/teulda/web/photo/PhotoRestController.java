package com.teulda.web.photo;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.service.domain.Diary;
import com.teulda.service.photo.PhotoService;

@RestController
@RequestMapping("/photo/*")
public class PhotoRestController {

	@Autowired
	@Qualifier("photoServiceImpl")
	private PhotoService photoService;
	
	public PhotoRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
//	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
//	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;


	//앨범 삭제 플래그처리
	@RequestMapping(value="rest/updateGroupStatus", produces = "application/json")
	public String updateGroupStatus(@RequestParam("groupNo") int groupNo) throws Exception {
		
		Group group = photoService.getGroup(groupNo);
		
		System.out.println("DeleteDate =========== "+group.getDeleteDate());
		
		photoService.updateGroupStatus(group);
		
		return "Success";
	}
	
	//사진 삭제 플래그처리
	@RequestMapping(value="rest/updatePhotoStatus", produces = "application/json")
	public String updatePhotoStatus(@RequestParam("photoNo") int photoNo) throws Exception {
		
		Photo photo = photoService.getPhoto(photoNo);
		
		System.out.println("DeleteDate =========== "+photo.getDeleteDate());
		
		photoService.updatePhotoStatus(photo);
		
		return "Success";
	}
	
	//사진옮기기
	@RequestMapping(value="rest/updateGroupNo", produces = "application/json")
	public String updateGroupNo(@RequestParam("groupNo") int groupNo, @RequestParam("photoNo") int photoNo) throws Exception {
		
		Photo photo = new Photo();
		photo.setPhotoGroupNo(groupNo);
		photo.setPhotoNo(photoNo);
		
		photoService.updateGroupNo(photo);
		
		return "Success";
	}
	
	//앨범명 수정
	@RequestMapping(value="rest/updateGroupName", produces = "application/json")
	public String updateGroupName(@RequestParam("groupNo") int groupNo, @RequestParam("groupName") String groupName) throws Exception {
		
		Group group = new Group();
		group.setGroupNo(groupNo);
		group.setGroupName(groupName);
		
		System.out.println("GroupNo ==== "+groupNo+" //// GroupName ==== "+groupName );
		
		photoService.updateGroupName(group);
		
		return "Success";
	}
	
	//사진 개별 영구삭제
	@RequestMapping(value="rest/removePhoto", produces = "application/json")
	public String removePhoto(@RequestParam("photoNo")int photoNo) throws Exception{
		
		photoService.removePhoto(photoNo);
		
		return "Success";
	}
	
	//앨범 개별 영구삭제
	@RequestMapping(value="rest/removeGroup", produces = "application/json")
	public String removeGroup(@RequestParam("groupNo")int groupNo) throws Exception{
		
		photoService.removeGroup(groupNo);
		
		return "Success";
	}
	
}
