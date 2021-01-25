package com.teulda.web.diary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Diary;

//==> 기록관리 RestController
@RestController
@RequestMapping("/diary/*")

public class DiaryRestController {

	/// Field
	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;
	
	public DiaryRestController() {
		System.out.println(this.getClass()); // 디버깅 위함
	}
	
//	@RequestMapping(value="rest/addDiary", method=RequestMethod.POST)
//	public ModelAndView addDiary(@RequestBody Diary diary) throws Exception {
//		
//		System.out.println("/diary/rest/addDiary : POST");
//		
//		// Model 과 View 연결
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("diary", diary);
//		modelAndView.setViewName("/diary/addDiary.jsp");
//		
//		return modelAndView;
//	}
}
