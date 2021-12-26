package com.groupware.worktech.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.groupware.worktech.admin.model.service.AdminService;
import com.groupware.worktech.board.model.exception.BoardException;
import com.groupware.worktech.board.model.service.BoardService;
import com.groupware.worktech.board.model.vo.Board;
import com.groupware.worktech.common.PageInfo;
import com.groupware.worktech.common.Pagination;

@Controller
public class AdminController {

	@Autowired
	private AdminService aService;
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("noticeList.ad")
	public String noticeList(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="boardLimit", required = false) Integer boardLimit,
							 Model model) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getListCount("NOTICE");
		
		PageInfo pi = null;

		if(boardLimit != null) {
			pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		} else {
			pi = Pagination.getPageInfo(currentPage, listCount);
		}
		
		ArrayList<Board> list = bService.selectNoticeList(pi);

		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			
		} else {
			throw new BoardException("공지사항 목록 조회에 실패하였습니다.");
		}
		
		return "adminNoticeList";
	}
	
	@RequestMapping("ninsertView.ad")
	public String noticeInsertView() {
		return "adminNoticeInsertForm";
	}
	
	@RequestMapping("ninsert.ad")
	public String insertNotice(@ModelAttribute Board b, @RequestParam("uploadFile") MultipartFile[] uploadFile, 
								MultipartHttpServletRequest  request) {
		
		if(uploadFile != null && !uploadFile[0].isEmpty()) {
			String fileOriginName = ""; 
			String fileMultiName = "";
		
			for(int i=0; i<uploadFile.length; i++) {
				
			}
		
		}
		
		
		
		return "";
	}
	
	@RequestMapping("ndetail.ad")
	public String noticeDetail(@RequestParam("page") int page, @RequestParam("bNo") int bNo, @RequestParam(value = "upd", required = false) String upd) {
		return null;
	}
	
	
}
