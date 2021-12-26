package com.groupware.worktech.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.groupware.worktech.admin.model.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService aService;
	
	@RequestMapping("noticeList.ad")
	public String noticeList(@RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		
		
		
		
		
		
		return "adminNoticeList";
	}
	
	
}
