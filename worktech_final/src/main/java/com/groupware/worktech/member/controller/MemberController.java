package com.groupware.worktech.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.groupware.worktech.admin.model.service.AdminService;
import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.common.PageInfo;
import com.groupware.worktech.common.Pagination;
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
		
		System.out.println(bcrypt.encode(m.getPwd()));
		
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
	
	// 사원 등록 (& 비밀번호 암호화) → 사원목록 페이지로 이동
	@RequestMapping("minsert.me")
	public String insertMember(@ModelAttribute Member m,
								Model model, @RequestParam(value="page", required=false) Integer page) {
		// 비밀번호 : 등록한 이메일 앞자리
		String pwd = m.getEmail().substring(0, m.getEmail().indexOf("@"));
		m.setPwd(pwd);
	
		// 비밀번호 암호화 
		String encPwd = bcrypt.encode(m.getPwd());
		m.setPwd(encPwd); 
		
	//	System.out.println(m);
			
		int result = mService.insertMember(m);
		
		// 사원목록 페이지로 이동 : 페이징 처리
		// 페이징 처리
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = mService.getMemListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		// 사원 목록 : 관리자 제외
		ArrayList<Member> mList = mService.selectMemList(pi);
		// 총 사원의 수
		int memCount = mService.countMember();
		// 관리자
		ArrayList<Member> aList = mService.selectAdminList(pi);
		
		if(result > 0) {
			model.addAttribute("mList", mList);
			model.addAttribute("aList", aList);
			model.addAttribute("pi", pi);
			model.addAttribute("memCount", memCount);
		} else {
			throw new MemberException("사원 등록에 실패하였습니다.");
		}
		return "adminMemList";
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

	// 사원목록 페이지로 이동 + 페이징
	@RequestMapping("mList.me")
	public String mListView(Model model, @RequestParam(value="page", required=false) Integer page) {
		
		// 페이징 처리
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getMemListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		// 사원 목록 : 관리자 제외
		ArrayList<Member> mList = mService.selectMemList(pi);
		// 총 사원의 수
		int memCount = mService.countMember();
		// 관리자
		ArrayList<Member> aList = mService.selectAdminList(pi);
		
		if(mList != null) {
			model.addAttribute("mList", mList);
			model.addAttribute("aList", aList);
			model.addAttribute("pi", pi);
			model.addAttribute("memCount", memCount);
		} else {
			throw new MemberException("사원 목록 조회에 실패하였습니다.");
		}
		return "adminMemList";
	}

	
	// member 검색
	@RequestMapping("searchMem.me")
	public String searchMember(@RequestParam("searchCondition") String condition,
							   @RequestParam("searchValue") String value,
							   @RequestParam(value="page", required=false) Integer page, Model model ) {
		
		// 검색 조건 :  searchCondition | 검색 내용 : searchValue
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("value", value);
		
		// 페이징 처리
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		// 기존 : 총 사원의 수
		int memCount = mService.countMember();
		
		// 검색한 사원의  수
		int listCount = mService.getSearchResultListCount(map);
		// 페이딩 처리 계산
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		// 검색 결과
		ArrayList<Member> mList = mService.selectSearchResultList(pi, map);
		
		if( mList != null ) {
			model.addAttribute("mList", mList);
			model.addAttribute("pi", pi);
			model.addAttribute("searchCondition", condition);
			model.addAttribute("searchValue", value);
			model.addAttribute("memCount", memCount);
		} else {
			throw new MemberException("사원 목록 검색에 실패하였습니다.");
		}
		
		return "adminMemList";
	}

	
	// 사원 삭제 (개별)
	@RequestMapping("mdelete.me")
	@ResponseBody
	public void deleteMember(@RequestParam("mNo") String mNo) {
		
		System.out.println(mNo);
		
		int result = mService.deleteMember(mNo);
		
//		if( result > 0 ) {
//			
//		} else {
//			throw new MemberException("사원 삭제를 실패하였습니다.");
//		}
		
//		return null;
	}

	
	// 사원 삭제(선택)
	@RequestMapping("selectDelete.me")
	@ResponseBody
	public void deleteSelectMember(HttpServletRequest request, 
									@RequestParam(value="valueArr", required=false) String[] valueArr ) {
		
//		String[] ajaxMsg = request.getParameterValues("valueArr");
//		int size = ajaxMsg.length; // NullPointerException
//		for(int i = 0; i < size; i++) {
//			mService.deleteSelectMember(ajaxMsg[i]);
//		}
		
		
//		int size = valueArr.length;
		System.out.println(valueArr);
		
	}


}