package com.groupware.worktech.adbook.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.groupware.worktech.adbook.model.exception.AdbookException;
import com.groupware.worktech.adbook.model.service.AdbookService;
import com.groupware.worktech.common.PageInfo;
import com.groupware.worktech.common.Pagination;
import com.groupware.worktech.member.model.vo.Member;

@Controller
public class AdbookController {

	@Autowired
	private AdbookService abService;
	
	@RequestMapping("adbookList.ab")
	public String adbookList(@RequestParam(value="page", required=false) Integer page, Model model) {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = abService.getAdbookListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list = abService.selectAdbookList(pi);

		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		} else {
			throw new AdbookException("사내 주소록 조회에 실패하였습니다.");
		}
		
		return "adbookList";
	}
}
