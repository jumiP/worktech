package com.groupware.worktech.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.groupware.worktech.member.model.exception.MemberException;
import com.groupware.worktech.member.model.service.MemberService;
import com.groupware.worktech.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService; 
	
	
	@RequestMapping("minsert.me")
	public String insertMember(@ModelAttribute Member m/* , @RequestParam("dName") String dName */) {
		
		// 비밀번호 : 등록한 이메일 앞자리
		// 비밀번호 암호화 => 나중에
		String pwd = m.getEmail().substring(0, m.getEmail().indexOf("@"));
		m.setPwd(pwd);
		
		
		System.out.println(m);
		
		
		int result = mService.insertMember(m);

		if(result > 0) {
			return "redirect:home.do";
		} else {
			throw new MemberException("사원 등록에 실패하였습니다.");
		}
		
	}
	
	
	// 사번 중복 확인
	@RequestMapping("dupId.me")
	public void duplicateId(@RequestParam("mNo") String mNo, HttpServletResponse response) {
		
		// 삼항연산자 사용 : 일치하면(중복되면) Dup / 일치하지 않으면(중복되지 않으면) NoDup
		String result = mService.duplicateMNo(mNo) == 0 ? "NoDup" : "Dup";
		
		try {
			// 반환값 그대로 void로 하고싶으면 PrintWriter 사용 : HttpServletResponse 추가
			response.getWriter().println(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
	
	
	
	
	
	
	
}
