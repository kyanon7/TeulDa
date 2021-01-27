package com.teulda.web.photo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.teulda.common.Group;
import com.teulda.common.Photo;
import com.teulda.service.domain.User;
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


	//사진등록
	@RequestMapping(value="rest/addPhoto")
	public Photo addPhoto(HttpSession session) throws Exception{
		
		User user = (User)session.getAttribute("user");
		
		
		return null;
	}
	//사진삭제(플래그)
	//그룹등록
	@RequestMapping(value="rest/addGroup/{groupName}")
	public Group addGroup(@PathVariable String groupName, HttpSession session) throws Exception{
		
		System.out.println("photo/rest/addGroup/{groupName}");
		
		User user = (User)session.getAttribute("user");
		
		Group group = new Group();
		group.setNickname(user.getNickname());
		group.setGroupName(groupName);
		
		photoService.addGroup(group);
		
		return group;
	}
	//그룹 삭제 플래그처리
  	
	//사진삭제(휴지통)
	//그룹, 사진 영구삭제(휴지통)
	@RequestMapping(value="rest/deletePhoto")
	public String deleteGroup(HttpSession session) throws Exception{
		
		System.out.println("photo/rest/deleteGroup");
		
		User user = (User)session.getAttribute("user");
		
		photoService.deletePhoto(user.getNickname());
		photoService.deleteGroup(user.getNickname());
		
		return user.getNickname();
	}
	//그룹옮기기
	@RequestMapping(value="rest/updateGroupNo")
	public String updateGroupNo(HttpSession session) throws Exception{
		
		System.out.println("photo/rest/updateGrouNo");
		
		Photo photo = new Photo();
//		photo.setPhotoGroupNo(photoGroupNo);
		
		photoService.updateGroupNo(photo);
		
		return null;
	}
	//그룹이름 변경
	
}
