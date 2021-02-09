package com.teulda.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teulda.common.Page;
import com.teulda.common.Search;
import com.teulda.service.domain.Report;
import com.teulda.service.domain.User;
import com.teulda.service.user.UserService;


//==> 회원관리 Controller
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method
		
	public UserController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser() throws Exception{
	
		System.out.println("/user/addUser : GET");
		
		return "redirect:/user/addUser.jsp";
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user ) throws Exception {

		System.out.println("/user/addUser : POST");
		//Business Logic
		userService.addUser(user);
		
		return "redirect:/user/successJoin.jsp";
	}
	

	@RequestMapping( value="getUser", method=RequestMethod.GET  )
	public String getUser( @RequestParam(value="email") String email , Model model, HttpSession session ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(email);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		if(((User) session.getAttribute("user")).getNickname() != null && user.getNickname().equals(((User) session.getAttribute("user")).getNickname())) {
			return "forward:/user/getMyUser.jsp";
		}else {
			return "forward:/user/getUser.jsp";
		}
	}
	

	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("email") String email , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUser(email);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/user/updateUser : POST");
		//Business Logic
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getEmail();
		if(sessionId.equals(user.getEmail())){
			session.setAttribute("user", user);
		}
		
		return "redirect:/user/getUser?email="+user.getEmail();
	}
	
	/*
	 * @RequestMapping( value="updateReportCount", method=RequestMethod.POST )
	 * public String updateReportCount( @ModelAttribute("reportCount") int
	 * reportCount , Model model , HttpSession session) throws Exception{
	 * 
	 * System.out.println("/user/updateReportCount : POST"); //Business Logic
	 * userService.updateReportCount(reportCount);
	 * 
	 * 
	 * 
	 * return "redirect:/"; }
	 */
	
	@RequestMapping(value="deleteUser", method=RequestMethod.GET)
	public String deleteUser(@RequestParam("nickname") String nickname) throws Exception {
		
		
		System.out.println("/user/deleteUser");
		//Business Logic
		userService.deleteUser(nickname);
		
		//return "redirect:/index.jsp";
		return "redirect:/diary/listMainRanking";
	}
	
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "redirect:/user/login.jsp";
	}//로그인 뷰로 이동하는 메소드
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getEmail());
		
		
		
		if( user.getPassword().equals(dbUser.getPassword())){
			if( dbUser.getStatus()=='1'){
				System.out.println("정지유저디버깅"+dbUser.getStatus());
				return "redirect:/user/ban.jsp";	
			}
			else {
			session.setAttribute("user", dbUser);
		}
		
		}
		

		
	
		//return "redirect:/index.jsp";
		return "redirect:/diary/listMainRanking";
	}// 로그인 하고 인덱스
		
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : GET");
		
		session.invalidate();
		
		//return "redirect:/index.jsp";
		return "redirect:/diary/listMainRanking";
	}
	
	
	@RequestMapping( value="checkDuplication", method=RequestMethod.POST )
	public String checkDuplication( @RequestParam("email") String email , Model model ) throws Exception{
		
		System.out.println("/user/checkDuplication : POST");
		//Business Logic
		boolean result=userService.checkEmailDuplication(email);
		// Model 과 View 연결
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("email", email);

		return "forward:/user/checkDuplication.jsp";
	}

	
	@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser :"+"debug");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/user/listUser.jsp";
	}
	
	@RequestMapping( value="listUserPublic" )
	public String listUserPublic( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUserPublic :"+"debug");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=userService.getUserListPublic(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/user/listUserPublic.jsp";
	}
	
	@RequestMapping( value="listUserTotal", method = { RequestMethod.GET, RequestMethod.POST } )
	public String listUserTotal( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUserTotal :"+"debug");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		if (search.getSearchSorting() == null) {
			search.setSearchSorting("0");
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=userService.getUserListTotal(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/search/listTotalUser.jsp";
	}
	
	/*@RequestMapping(value="listUserTotal")
	public String listTotalUser(@ModelAttribute("search") Search search, Model model,  HttpServletRequest request) throws Exception {
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if (search.getSearchSorting() == null) {
			search.setSearchSorting("0");
		}
		
		
		
		
		System.out.println(" Search 디버깅 " + search);
		
		// Business logic 수행
		Map<String, Object> map = userService.getUserListTotal(search); 
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);  
		model.addAttribute("search", search); 
		
		return "forward:/user/listTotalUser.jsp";
	}*/
	
	@RequestMapping( value="listBlacklist" )
	public String listBlacklist( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listBlacklist :"+"debug");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=userService.getUserBlackList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/user/listBlacklist.jsp";
	}
	
	@RequestMapping( value="listReport" )
	public String listReport( @ModelAttribute("search") Search search , Model model ,@RequestParam("targetNick") String targetNick, HttpServletRequest request) throws Exception{
		
		System.out.println("/report/listReport :"+"debug");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=userService.getReportList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("targetNick",targetNick);
		//model.addAttribute("search", search);
		
		return "forward:/user/listReport.jsp";
	}
	
	@RequestMapping( value="addReport", method=RequestMethod.GET )
	public String addReport(@RequestParam("targetNick") String targetNick, Model model) throws Exception{
		
		System.out.println("/user/addReport: GET");
		
		System.out.println(targetNick+"디버그");
		model.addAttribute("targetNick",targetNick);
		return "forward:/user/addReport.jsp";
		
		
	}
	
	/*
	 * @RequestMapping( value="addReport", method=RequestMethod.GET ) public String
	 * addReport() throws Exception{
	 * 
	 * System.out.println("/user/addReport: GET");
	 * 
	 * return "forward:/user/addReport.jsp"; }
	 */
	
	
	@RequestMapping( value="addReport", method=RequestMethod.POST )
	public String addReport( @ModelAttribute("report") Report report , User user, Model model,
			@RequestParam("targetNick") String targetNick, HttpServletRequest request, int reportCount, User status ) throws Exception {

		System.out.println("/user/addReport : POST");
		//Business Logic
		
		
		System.out.println(targetNick+"디버그");
		report.setTargetNick(targetNick);
		user.setReportCount(reportCount);
		
		userService.addReport(report);
		userService.updateReportCount(reportCount);
		userService.updateUserStatusAuto(status);
		//return "redirect:/";
		return "redirect:/diary/listMainRanking";
	}
	
	
	
	
}