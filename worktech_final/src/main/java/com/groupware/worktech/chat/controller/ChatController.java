package com.groupware.worktech.chat.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.worktech.member.model.vo.Member;

@Controller
public class ChatController {
	
	@RequestMapping(value="/chat.ct", method=RequestMethod.GET)
	public ModelAndView chat(ModelAndView mv) {
		
		mv.setViewName("chatMessage");
		
		Member user = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		mv.addObject("name", user.getName());
		
		return mv;
	}
}
