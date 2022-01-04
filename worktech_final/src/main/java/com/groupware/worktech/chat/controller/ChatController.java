package com.groupware.worktech.chat.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.worktech.chat.model.exception.ChatException;
import com.groupware.worktech.chat.model.service.ChatService;
import com.groupware.worktech.chat.model.vo.ChatRoom;
import com.groupware.worktech.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	@RequestMapping("chatView.ct")
	public String chatView(Model model, HttpSession session) {
		String mNo = ((Member)session.getAttribute("loginUser")).getmNo();
		
		ArrayList<ChatRoom> list = cService.selectChatList(mNo);
		
		if(list != null) {
			for(ChatRoom c : list) {
				String date = new SimpleDateFormat("yyyy-MM-dd").format(c.getSendTime());
				String time = new SimpleDateFormat("HH:mm").format(c.getSendTime());
				
				c.setDate(date);
				c.setTime(time);
			}
			
			model.addAttribute("list", list);
			return "chatList";
		} else {
			throw new ChatException("채팅 목록 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("chatDetail.ct")
	public String chatDetail(Model model) {
		
		return "chatMessage";
	}
	
	@RequestMapping("addChatView.ct")
	public String addChatView() {
		return "insertChatView";
	}
}
