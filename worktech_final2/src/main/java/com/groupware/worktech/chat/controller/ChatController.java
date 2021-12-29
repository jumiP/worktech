package com.groupware.worktech.chat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.worktech.member.model.vo.Member;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {
	
	private Logger log = LoggerFactory.getLogger(ChatController.class);
	
	@RequestMapping(value="/chatting.ct", method=RequestMethod.GET)
	public ModelAndView chat(ModelAndView mv) {
		
		mv.setViewName("chatMessage");
		
//		Member user = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Member user = new Member("100000", "ww.worktech", "강건강", "0000", "사원", null, null, null, "USRR", 100, null, "Y");
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + user.getName());
		
		mv.addObject("name", user.getName());
		
		return mv;
	}
}
