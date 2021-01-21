package com.teulda.web.photo;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teulda.common.Group;
import com.teulda.common.Photo;
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
	
//	@RequestMapping(value="photoList")
//	public String photoList(@ModelAttribute("group")Group group, Model model, HttpServletRequest request) throws Exception{
//		
//		System.out.println("/listPhoto");
//		
//		//그룹에 있는 nickname, groupNo를 받아와서 getPhotoList로 넘겨야됨
//		Map<String, Object> map = photoService.getPhotoList(group);
//		
//		model.addAttribute("photoList", map.get("photoList"));
//		model.addAttribute("totalCount", map.get("totalCount"));
//		
//		return "forwoad:/photo/listPhoto.jsp";
//	}
}
