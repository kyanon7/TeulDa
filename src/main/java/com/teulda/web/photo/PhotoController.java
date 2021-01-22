package com.teulda.web.photo;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teulda.common.Group;
import com.teulda.service.domain.User;
import com.teulda.service.photo.PhotoService;


//PhotoList(삭제, 삭제 아닌 사진)
//PhotoGroupList(삭제, 삭제 아닌 그룹)

@Controller
@RequestMapping("/photo/*")
public class PhotoController {

	@Autowired
	@Qualifier("photoServiceImpl")
	private PhotoService photoService;
	
	public PhotoController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
//	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
//	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="album")
	public String photoList(Model model, HttpSession session) throws Exception{
		
		System.out.println("/listPhoto");
		
		User user = (User)session.getAttribute("user");
//		Group group = (Group)session.getAttribute("groupList");
//		group.setNickname(user.getNickname());
//		group.setGroupNo(group.getGroupNo());
		Group group = new Group();
		group.setNickname("king정인");
		group.setGroupNo(10012);
		
		//그룹에 있는 nickname, groupNo를 받아와서 getPhotoList로 넘겨야됨
		Map<String, Object> map = photoService.getPhotoList(group);
		
		model.addAttribute("photoList", map.get("photoList"));
		model.addAttribute("totalCount", map.get("totalCount"));
		
		return "forward:/photo/album.jsp";
	}
	
	//그룹 가지고 오기
	@RequestMapping(value="listPhoto")
	public String listPhoto(Model model, HttpSession session) throws Exception{
		
		User user = (User)session.getAttribute("user");
		
		Group group = new Group();
//		group.setNickname(user.getNickname());
		group.setNickname("king정인");
		Map<String, Object> map = photoService.getGroupList(group);
		
		model.addAttribute("groupList", map.get("groupList"));
		model.addAttribute("totalCount", map.get("totalCount"));
		
		System.out.println(map.get("groupList"));
		
		return "forward:/photo/listPhoto.jsp";
	}
	
	@RequestMapping(value="photoBin")
	public String deletePhotoList(Model model, HttpSession session) throws Exception{
		
		User user = (User)session.getAttribute("user");
		
		Group group = new Group();
		
		Map<String, Object> map = photoService.getGroupList(group);
		
		return "forward:/photo/photoBin.jsp";
	}
}
