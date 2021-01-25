package com.teulda.web.photo;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
	//그룹삭제(플래그)
	//사진삭제(휴지통)
	//그룹삭제(휴지통)
	@RequestMapping(value="rest/deleteGroup")
	public String deleteGroup(HttpSession session) throws Exception{
		
		System.out.println("photo/rest/deleteGroup");
		
		User user = (User)session.getAttribute("user");
		
		photoService.deleteGroup(user.getNickname());
		
		return "forward:/photo/photoBin.jsp";
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
