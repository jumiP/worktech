package com.groupware.worktech.commut.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.groupware.worktech.commut.qrutil.QrUtil;
import com.groupware.worktech.member.model.vo.Member;

@Controller
public class CommutController {
	
	@RequestMapping("gowork.do")
	public String qrqode(HttpServletRequest request, HttpSession session) {
		
		String id = ((Member)session.getAttribute("loginUser")).getmNo();
		
		String url = "http://localhost:1280/worktech/noticeList.ad";
		int width = 150;
		int height = 150;
		
		String file_path = "C:\\Users\\user1\\Desktop"+File.separator+"qr"+File.separator;
		String file_name = id+".png";
		QrUtil.makeQR(url, width, height, file_path, file_name);
		
		return "redirect:mainPage.do";
	}
	
	@RequestMapping("qrcode.do")
	public String checkQRcode() {
		return "commut";
	}
		
}
