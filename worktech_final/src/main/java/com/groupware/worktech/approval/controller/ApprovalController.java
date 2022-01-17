package com.groupware.worktech.approval.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.approval.model.exception.ApprovalException;
import com.groupware.worktech.approval.model.service.ApprovalService;
import com.groupware.worktech.approval.model.vo.Approval;
import com.groupware.worktech.common.PageInfo;
import com.groupware.worktech.common.Pagination;
import com.groupware.worktech.member.model.vo.Member;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService AppService;

	@RequestMapping("approvalmain.ap")
	public ModelAndView approvalList(HttpServletRequest request, ModelAndView mv) {
		
		String mNo = ((Member)request.getSession().getAttribute("loginUser")).getmNo();
		
		ArrayList<Approval> list = AppService.selectMainList(mNo);
		
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("approvalmain");
		} else {
			throw new ApprovalException("전자 결재 메인페이지 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	@RequestMapping("approvalwait.ap")
	public ModelAndView approvalWait(@RequestParam(value="page", required = false) Integer page, HttpServletRequest request, ModelAndView mv) {
		
		String mNo = ((Member)request.getSession().getAttribute("loginUser")).getmNo();
				
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = AppService.getListCountWait();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);	
		
		ArrayList<Approval> list = AppService.selectWaitList(pi, mNo);
		
		
		if(list != null) {
			mv.addObject("pi", pi);
			mv.addObject("list", list);
			mv.setViewName("approvalWait");
		} else {
			throw new ApprovalException("결제 대기함 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("approvalprogress.ap")
	public ModelAndView approvalProgress(@RequestParam(value="page", required = false) Integer page, HttpServletRequest request, ModelAndView mv) {
		
		String mNo = ((Member)request.getSession().getAttribute("loginUser")).getmNo();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = AppService.getListCountProgress();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);		
		ArrayList<Approval> list = AppService.selectProgressList(pi, mNo);
		
		
		if(list != null) {
			mv.addObject("pi", pi);
			mv.addObject("list", list);
			mv.setViewName("approvalProgress");
		} else {
			throw new ApprovalException("결제 대기함 조회에 실패하였습니다.");
		}

		return mv;
	}
	
	@RequestMapping("approvalcomplete.ap")
	public ModelAndView approvalComplete(@RequestParam(value="page", required = false) Integer page, HttpServletRequest request, ModelAndView mv) {
		
		String mNo = ((Member)request.getSession().getAttribute("loginUser")).getmNo();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = AppService.getListCountComplete();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);		
		ArrayList<Approval> list = AppService.selectCompleteList(pi, mNo);
		
		
		if(list != null) {
			mv.addObject("pi", pi);
			mv.addObject("list", list);
			mv.setViewName("approvalComplete");
		} else {
			throw new ApprovalException("결제 대기함 조회에 실패하였습니다.");
		}

		return mv;
	}
	
	@RequestMapping("approvalwrite.ap")
	public String approvalWrite() {
		return "approvalWrite";
	}
	
	@RequestMapping(value="/approvalline.ap", method={RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView approvalLine(ModelAndView mv) {
		mv.setViewName("approvalLine");
		return mv;
	}
	
	@RequestMapping(value="/approvallinelist.ap",method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody 
	public List<Department> approvallinelist(Department d,  Model model) throws Exception {
		List<Department> dataList = AppService.approvallinelist();
		return dataList;
	}
}
