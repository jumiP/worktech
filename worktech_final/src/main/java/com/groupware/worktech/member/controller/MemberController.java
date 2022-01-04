package com.groupware.worktech.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.groupware.worktech.admin.model.service.AdminService;
import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.member.model.exception.MemberException;
import com.groupware.worktech.member.model.service.MemberService;
import com.groupware.worktech.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService mService; 
	
	@Autowired
	private AdminService aService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	
	// 로그인(암호화) --> DB에 Spring 콘솔에 입력된 비밀번호(암호화)를 넣고 저장 후 로그인!
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String login(Member m, Model model) {	
		
//		System.out.println(bcrypt.encode(m.getPwd()));
		
		Member loginMember = mService.memberLogin(m);
		
		if(bcrypt.matches(m.getPwd(), loginMember.getPwd())) {
			model.addAttribute("loginUser", loginMember);
			logger.info(loginMember.getmNo());
			return "redirect:home.do";
		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
	}
	
	//로그아웃
	@RequestMapping("logout.me")
	public String logout(SessionStatus session) {
		session.setComplete();
		
		return "redirect:index.jsp";
	}
	
	
	

	











































































	

// 사원 등록페이지로 이동
@RequestMapping("enrollView.me")
public String enrollView(Model model, @ModelAttribute Department d) {
	
	// 부서 등록
	ArrayList<Department> list = aService.selectDepList();
			
	if(list != null) {
		model.addAttribute("list", list);
	}
	
	return "adminMemAddForm";
}

// 사원 등록
@RequestMapping("minsert.me")
public String insertMember(@ModelAttribute Member m) {
	
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
		response.getWriter().println(result);
	} catch (IOException e) {
		e.printStackTrace();
	}
}	


}
