package com.teulda.web.chat;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teulda.service.domain.User;

@Controller
@RequestMapping("/chat/*")
public class ChatController {

	public ChatController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value="chatting", method=RequestMethod.GET)
	public String chattting(HttpSession session, RedirectAttributes redirectInfo) throws Exception{
		
		System.out.println("/chat/chatting : GET");
		
		User user = (User) session.getAttribute("user");
		
		redirectInfo.addFlashAttribute("user", user);
		
//		return "redirect:https://powerful-inlet-24111.herokuapp.com/";
		return "redirect:http://localhost:3000/";
		
	}
}
