package com.teulda.web.diary;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.User;

//==> 상품관리 Controller
@Controller
@RequestMapping("/diary/*")
public class DiaryController {
	
	///Field
	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;
	
	public DiaryController() {
		System.out.println(this.getClass()); // 디버깅 위함
	}
	
	// meta-data 로 부터 값 받아옴. pageSize : 한 페이지에 목록 몇개, pageUnit : 몇 페이지씩 나눌건지 
	//==> classpath:config/common.properties  ,  classpath:config/context-common.xml 참조 할것
	@Value("#{commonProperties['pageUnit'] ?: 5}") // 못 불러온다면 5 주입 
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 3}") // 못 불러온다면 3 주입 
	int pageSize;
	
	@RequestMapping(value="addDiary", method=RequestMethod.POST)
	public String addDiary(@ModelAttribute("diary") Diary diary, Model model,
											HttpSession session) throws Exception {
		
		System.out.println("/diary/addDiary : POST");
		
		User user = (User) session.getAttribute("user");
		
		diary.setNickname(user.getNickname());
		// Business Logic
		System.out.println(diary); // for debug 
		diaryService.addDiary(diary);
		
		Diary newDiary = // 방금 저장한 기록번호로 기록 내용 가져옴 (+ 해시태그, 기록작성일 등 더 많은 정보 가져오기 위함) 
		diaryService.getDiary(diaryService.getLatestDiaryNo(user.getNickname()));
		
		// Model 과 View 연결
		model.addAttribute("diary", newDiary);
		
		return "forward:/diary/getDiary.jsp"; 
	}
	
	// 내 기록 조회 (getDiary?diaryNo=번호&status=own) & 공개 기록 조회 (getDiary?diaryNo=번호)
	@RequestMapping(value="getDiary", method=RequestMethod.GET)
	public String getDiary(@RequestParam("diaryNo") int diaryNo, 
							@RequestParam(value="status", required=false) String status, Model model) throws Exception {
		
		System.out.println("/diary/getDiary : GET");
		//Business Logic
		Diary diary = diaryService.getDiary(diaryNo);
		
		// Model 과 View 연결
		model.addAttribute("diary", diary);
		
		if (status != null && status.equals("own")) { // 마이페이지-기록에서 내 기록만 찾는거면 
			return "forward:/diary/getMyDiary.jsp";
		}
		
		return "forward:/diary/getDiary.jsp"; // (타 모듈에서 기록 찾는거면) 
	}
	
	@RequestMapping(value="updateDiary", method=RequestMethod.GET)
	public String updateDiary(@RequestParam("diaryNo") int diaryNo, Model model) throws Exception {
		
		System.out.println("/diary/updateDiary : GET");
		//Business Logic
		Diary diary = diaryService.getDiary(diaryNo);
		
		// Model 과 View 연결
		model.addAttribute("diary", diary);
		
		return "forward:/diary/updateDiary.jsp";
	}
	
	@RequestMapping(value="updateDiary", method=RequestMethod.POST)
	public String updateDiary(@ModelAttribute("diary") Diary diary, Model model) throws Exception {
		
		System.out.println("/diary/updateDiary : POST");
		//Business Logic
		diaryService.updateDiary(diary);
		
		Diary newDiary = diaryService.getDiary(diary.getDiaryNo());
		
		// Model 과 View 연결
		model.addAttribute("diary", newDiary);
		
		return "forward:/diary/getDiary.jsp";
	}

}
