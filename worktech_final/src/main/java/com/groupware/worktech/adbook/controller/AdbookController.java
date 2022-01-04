package com.groupware.worktech.adbook.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
	public String adbookList(@RequestParam(value="page", required=false) Integer page,
							 @RequestParam(value="selectCategory", required=false) String selectCategory, 
							 @RequestParam(value="selectValue", required=false) String selectValue,
							 Model model) {
		// 사내 주소록 페이징 처리
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> selectMap = new HashMap<String, String>();
		selectMap.put("selectCategory", selectCategory);
		selectMap.put("selectValue", selectValue);
		
		int listCount = abService.getAdbookListCount(selectMap);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list = abService.selectAdbookList(pi, selectMap);

		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("selectCategory", selectCategory);
			model.addAttribute("selectValue", selectValue);
		} else {
			throw new AdbookException("사내 주소록 조회에 실패하였습니다.");
		}
		
		return "adbookList";
	}
	
	@RequestMapping("searchAdbook.ab")
	public String searchAdbook(@RequestParam("searchValue") String searchValue, @RequestParam(value="page", required=false) Integer page, Model model) {
		// 사내 주소록 검색 결과 페이징 처리
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = abService.getSearchAdbookListCount(searchValue);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list = abService.selectSearchAdbookList(pi, searchValue);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("searchValue", searchValue);
		}
		
		return "adbookList";
	}
	
	@RequestMapping("pAdbookList.ab")
	public String personalAdbookList() {
		return "personalAdbookList";
	}
}
