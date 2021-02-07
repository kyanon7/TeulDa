package com.teulda.web.diary;

import java.sql.Date;
import java.util.List;
import java.util.Map;

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

import com.teulda.common.Group;
import com.teulda.common.Page;
import com.teulda.common.Search;
import com.teulda.common.handler.getThumbnail;
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
	
	//@Value("#{commonProperties['pageSize'] ?: 5}") // 못 불러온다면 5 주입 
	int pageSize = 12;
	
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
		
		return "forward:/diary/getMyDiary.jsp"; 
	}
	
	// 내 기록 조회 (getDiary?diaryNo=번호&status=own) & 공개 기록 조회 (getDiary?diaryNo=번호)
	@RequestMapping(value="getDiary", method=RequestMethod.GET)
	public String getDiary(@RequestParam("diaryNo") int diaryNo, 
							@RequestParam(value="status", required=false) String status, Model model) throws Exception {
		
		System.out.println("/diary/getDiary : GET");
		//Business Logic
		Diary diary = diaryService.getDiary(diaryNo);
		// *********** 이미지 썸네일 연습  ***********
		if (diary.getContent() != null) {
			diary.setThumbnail(getThumbnail.getImgSrc(diary.getContent()));
		}
		System.out.println(diary.getThumbnail());
		// *********** 이미지 썸네일 연습  ***********
		
		// Model 과 View 연결
		model.addAttribute("diary", diary);
		
		if (status != null && status.equals("own")) { // 마이페이지 - 기록에서 내 기록만 찾는거면 
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
		
		return "forward:/diary/getMyDiary.jsp"; 
	}
	
	@RequestMapping(value="listDiary", method= {RequestMethod.GET, RequestMethod.POST})
	public String listDiary(@ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception {
		
		System.out.println("/diary/listDiary : POST");
		
		User user = (User) session.getAttribute("user");
		
		// JSP를 거치지 않고 URL을 통해 컨트롤러로 왔을 때 첫 페이지를 1이라고 지정 
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		// JSP를 거치지 않고 URL을 통해 컨트롤러로 왔을 때 0번 ( 최근 작성 순 ) 으로 정렬되게 지정 
		if (search.getSearchSorting() == null) {
			search.setSearchSorting("0");
		}
		
		search.setPageSize(pageSize); // pageSize 지정 
		
		System.out.println("보낼 Search " + search);
		
		// Business logic 수행
		Map<String, Object> map = diaryService.getMyDiaryList(search, user.getNickname(), 'f');
		Page resultPage	= // 페이지 나누는 것을 추상화 & 캡슐화 한 Page 클래스 이용 
				new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		// Model 과 View 연결
		model.addAttribute("diaryList", map.get("diaryList")); // 기록 
		model.addAttribute("resultPage", resultPage); // 화면상의 페이지 정보가 다 담겨있음 
		model.addAttribute("search", search); // 검색 정보가 담겨있음 
		
		return "forward:/diary/listDiary.jsp";
	}
	
	@RequestMapping(value="listDiaryByGroup", method= RequestMethod.GET)
	public String listDiaryByGroup(@RequestParam("groupNo") int groupNo, Model model) throws Exception {
		
		System.out.println("/diary/listDiaryByGroup : GET");
		
		// Business logic 수행
		Map<String, Object> map = diaryService.getMyDiaryList(groupNo);
		
		// Model 과 View 연결
		model.addAttribute("diaryList", map.get("diaryList")); // 기록 
		model.addAttribute("totalCount", ((Integer)map.get("totalCount")).intValue()); 
		
		return "forward:/diary/listDiaryByGroup.jsp";
	}
	
	@RequestMapping(value="listDiaryGroup", method= RequestMethod.GET)
	public String listDiaryGroup(HttpSession session, Model model) throws Exception {
		
		System.out.println("/diary/listDiaryGroup : GET");
		
		User user = (User) session.getAttribute("user");
		
		// 기록 그룹 찾기
		List <Group> diaryGroupList = diaryService.getDiaryGroupList(user.getNickname());
		
		// 찾은 기록 그룹에 들어있는 기록 갯수 세팅 
		for (int i = 0; i < diaryGroupList.size(); i++) {
			int contentCount = diaryService.getMyDiaryCountByGroup(diaryGroupList.get(i).getGroupNo());
			diaryGroupList.get(i).setContentCount(contentCount);
		}
		
		model.addAttribute("diaryGroupList", diaryGroupList);
		
		return "forward:/diary/listDiaryGroup.jsp";
	}
	
	@RequestMapping(value="selectDiaryGroup", method= RequestMethod.GET)
	public String selectDiaryGroup(@RequestParam("diaryNo") int diaryNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/diary/selectDiaryGroup : GET");
		
		User user = (User) session.getAttribute("user");
		
		// 기록 그룹 찾기
		List <Group> diaryGroupList = diaryService.getDiaryGroupList(user.getNickname());
		
		model.addAttribute("diaryGroupList", diaryGroupList);
		model.addAttribute("diaryNo", diaryNo);
		
		return "forward:/diary/selectDiaryGroup.jsp";
	}
	
//	// selectDiaryGroup.jsp 에서 기록 그룹 이동
//	@RequestMapping(value="updateDiaryGroup", method= RequestMethod.GET)
//	public String updateDiaryGroup(@RequestParam("groupNo") int groupNo, @RequestParam("diaryNo") int diaryNo) throws Exception {
//		
//		Diary diary = new Diary();
//		diary.setGroupNo(groupNo);
//		diary.setDiaryNo(diaryNo);
//		diaryService.updateDiaryGroup(diary);
//		
//		return "forward:/diary/listDiaryByGroup?groupNo="+groupNo;
//	}
	
	@RequestMapping(value="listDeleteDiary", method= RequestMethod.GET)
	public String listDeleteDiary(@ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception {
		
		System.out.println("/diary/listDeleteDiary : GET");
		
		User user = (User) session.getAttribute("user");
		
		// JSP를 거치지 않고 URL을 통해 컨트롤러로 왔을 때 첫 페이지를 1이라고 지정 (사용 안함) 
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(10000); // pageSize 지정 (사용 안하므로 최대한 늘림) 
		
		// Business logic 수행
		Map<String, Object> map = diaryService.getMyDiaryList(search, user.getNickname(), 't');
		
		// Model 과 View 연결
		model.addAttribute("diaryList", map.get("diaryList")); // 기록
		model.addAttribute("totalCount", ((Integer) map.get("totalCount")).intValue());

		return "forward:/diary/diaryBin.jsp";
	}
	
	@RequestMapping(value="updateDiaryStatus", method=RequestMethod.GET)
	public String updateDiaryStatus(@RequestParam("diaryNo") int diaryNo, 
									@RequestParam(value="deleteDate", required=false) Date deleteDate, Model model) throws Exception {
									
		System.out.println("/diary/updateDiaryStatus : GET");
		
		Diary diary = new Diary();
		diary.setDiaryNo(diaryNo);
		diary.setDeleteDate(deleteDate);
		//Business Logic
		diaryService.updateDiaryStatus(diary);
		
		return "forward:/diary/listDeleteDiary"; 
	}
	
	@RequestMapping(value="deleteDiary", method=RequestMethod.GET)
	public String deleteDiary(@RequestParam("diaryNo") int diaryNo, Model model) throws Exception {
		
		System.out.println("/diary/deleteDiary : GET");
		
		diaryService.deleteDiary(diaryNo);
		
		return "forward:/diary/listDeleteDiary"; 
	}
	
	// 통합 검색 (기록 검색) 
	@RequestMapping(value="listTotalDiary", method= {RequestMethod.GET, RequestMethod.POST})
	public String listTotalDiary(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		System.out.println("/diary/listTotalDiary : GET & POST");
		
		// JSP를 거치지 않고 URL을 통해 컨트롤러로 왔을 때 0번 ( 최근 작성 순 ) 으로 정렬되게 지정 
		if (search.getSearchSorting() == null) {
			search.setSearchSorting("0");
		}
		
		System.out.println("보낼 Search " + search);
		
		// Business logic 수행
		Map<String, Object> map = diaryService.getDiaryList(search); 
		
		// Model 과 View 연결
		model.addAttribute("diaryList", map.get("diaryList")); // 기록
		model.addAttribute("totalCount", map.get("totalCount")); // 갯수 
		model.addAttribute("search", search); // 검색 정보가 담겨있음 
		
		return "forward:/search/listTotalDiary.jsp";
	}

}
