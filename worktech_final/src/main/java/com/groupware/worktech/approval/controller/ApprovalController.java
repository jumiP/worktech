package com.groupware.worktech.approval.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.approval.model.exception.ApprovalException;
import com.groupware.worktech.approval.model.service.ApprovalService;
import com.groupware.worktech.approval.model.vo.Approval;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService AppService;

	@RequestMapping("approvalmain.ap")
	public ModelAndView approvalList(ModelAndView mv) {
		
		ArrayList<Approval> list = AppService.selectList();
		
		System.out.println(list);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("approvalmain");
			
		} else {
			throw new ApprovalException("전자 결재 메인페이지 접속에 실패하였습니다.");
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
