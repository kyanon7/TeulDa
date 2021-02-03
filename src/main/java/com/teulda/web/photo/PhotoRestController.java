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


	@RequestMapping(value="rest/updateGroupStatus", produces = "application/json")
	public String updateGroupStatus(@RequestParam("groupNo") int groupNo) throws Exception {
		
		Group group = photoService.getGroup(groupNo);
		
		System.out.println("DeleteDate =========== "+group.getDeleteDate());
		
		photoService.updateGroupStatus(group);
		
		return "Success";
	}
	
	@RequestMapping(value="rest/updatePhotoStatus", produces = "application/json")
	public String updatePhotoStatus(@RequestParam("photoNo") int photoNo) throws Exception {
		
		Photo photo = photoService.getPhoto(photoNo);
		
		System.out.println("DeleteDate =========== "+photo.getDeleteDate());
		
		photoService.updatePhotoStatus(photo);
		
		return "Success";
	}
	
}
