package com.teulda.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.teulda.service.user.UserService;

@RestController
@RequestMapping("/user/*")


public class UserRestController {
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	/*
	 * @RestController public class MemberRController {
	 * 
	 * @Autowired private MemberService memberService;
	 * 
	 * @Autowired private MailSendService mss;
	 * 
	 * 
	 * @RequestMapping("/member/signUp") public void signUp(@ModelAttribute
	 * MemberDTO memberDTO){ // DB에 기본정보 insert memberService.signUp(memberDTO);
	 * 
	 * //임의의 authKey 생성 & 이메일 발송 String authKey =
	 * mss.sendAuthMail(memberDTO.getEmail()); memberDTO.setAuthKey(authKey);
	 * 
	 * Map<String, String> map = new HashMap<String, String>(); map.put("email",
	 * memberDTO.getEmail()); map.put("authKey", memberDTO.getAuthKey());
	 * System.out.println(map);
	 * 
	 * //DB에 authKey 업데이트 memberService.updateAuthKey(map);
	 * 
	 * } }
	 */

}
