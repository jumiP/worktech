package com.groupware.worktech.member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.groupware.worktech.admin.model.service.AdminService;
import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.board.model.vo.BoardFile;
import com.groupware.worktech.common.PageInfo;
import com.groupware.worktech.common.Pagination;
import com.groupware.worktech.member.model.exception.MemberException;
import com.groupware.worktech.member.model.service.MemberService;
import com.groupware.worktech.member.model.vo.Member;
import com.groupware.worktech.member.model.vo.Profile;

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
//			logger.info(loginMember.getmNo());
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
		
<<<<<<< HEAD
=======
>>>>>>> 0e27498090a37826a33b608f09523268495be7ae
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
		
<<<<<<< HEAD
=======
		// 검색 조건 :  searchCondition | 검색 내용 : searchValue
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("value", value);
>>>>>>> 0e27498090a37826a33b608f09523268495be7ae
		
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
		
	}

	
	// 사원 삭제(선택)
	@RequestMapping("selectDelete.me")
	@ResponseBody
	public void deleteSelectMember(@RequestParam(value="valueArr") String valueArr ) {

		// valueArr값 받아온것 확인
		System.out.println(valueArr);
		// 여러개의 값들이 하나의 String으로 들어옴 → split을 이용해서 나누기
		String[] selectList = valueArr.split(" ");
		for(int i = 0; i < selectList.length; i++) {
			int result = mService.deleteSelectMember(selectList[i]);
		}

	}

	
	// 사원정보 상세보기 페이지로 이동
	@RequestMapping("mdetail.me")
	public String detailMemView(@RequestParam("mNo") String mNo, @RequestParam("page") int page, Model model) {
		
		Member m = mService.selectMember(mNo);
		
		if(m != null) {
			model.addAttribute("member", m);
			model.addAttribute("page", page);
		} else {
			throw new MemberException("사원 정보 상세보기에 실패하였습니다.");
		}
		
		return "adminMemView";
	}
	
	// 사원정보 상세보기 페이지에서 사원 삭제
	@RequestMapping("delete.me")
	public String deleteDetailMember(@RequestParam("mNo" ) String mNo) {
		
//		System.out.println(mNo);
		
		int result = mService.deleteDetailMem(mNo);
		
		if(result > 0) {
			return "redirect:mList.me";
		} else {
			throw new MemberException("사원 삭제에 실패하였습니다.");
		}

	}
	
	// 관리자 사원 정보 수정 페이지로 이동
	@RequestMapping("adminUpdateMem.me")
	public String adminUpdateMemview(@RequestParam("mNo") String mNo, @RequestParam("page") int page, Model model){
		Member m = mService.selectMember(mNo);
		model.addAttribute("member", m).addAttribute("page", page);
		
		// 부서 목록
		ArrayList<Department> list = aService.selectDepList();
		if(list != null) {
			model.addAttribute("list", list);
		}
		
		return "adminUpdateMem";
	}
	
	
	// 관리자 : 사원 정보 수정 
	@RequestMapping("AdminUdateMem.me")
	public String adminUpdateMem(@ModelAttribute Member m, @RequestParam("page") int page, Model model) {
		int result = mService.adminUpdateMem(m);
		
		if(result > 0) {
			model.addAttribute("page", page);
		} else {
			throw new MemberException("사원 정보 수정에 실패하였습니다.");
		}
		return "redirect:mdetail.me?mNo=" + m.getmNo();
	}
	
	
	// 관리자 : 사원 비밀번호 수정페이지로 이동
	@RequestMapping("updateMemPwdView.me")
	public String updateMemberPwdView(@ModelAttribute Member m) {
		return "adminUpdateMemPwd";
	}
	
	
	// 관리자 비밀번호 페이지로 이동
	@RequestMapping("adminPwdView.me")
	public String adminPwdView(@RequestParam("adminMNo") String mNo, @RequestParam("adminName") String name, Model model) {
//		System.out.println(mNo);
//		System.out.println(name);
		
		model.addAttribute("mNo", mNo);
		model.addAttribute("name", name);
		return "adminUpdatePwd";
	}
	
	// 관리자 비밀번호 변경
	@RequestMapping("adminPwd.me")
	public String adminPwd(@RequestParam("pwd") String oldPwd, @RequestParam("newPwd") String Pwd, Model model) {
		// 비밀번호 받아오기
//		System.out.println(oldPwd); // 기존 비밀번호
//		System.out.println(Pwd); // 새로운 비밀번호 리스트
		String[] pwdList = Pwd.split(",");
		String newPwd = pwdList[1]; // 새로운 비밀번호
		
		// 아이디 받아오기 
		Member m = (Member)model.getAttribute("loginUser");
//		System.out.println(m); 
		Member dbMember = mService.memberLogin(m);
		
		int result = 0;
		
		if(bcrypt.matches(oldPwd, dbMember.getPwd())) {
			HashMap<String, String> map = new HashMap<String, String> ();
			map.put("mNo", m.getmNo());
			map.put("newPwd", bcrypt.encode(newPwd));
			
			result = mService.updatePassword(map);
		}
		
		if(result > 0) {
			return "redirect:mList.me";
		} else {
			throw new MemberException("비밀번호 수정에 실패하였습니다.");
		}
	}

	// 마이페이지로 이동
	@RequestMapping("myPage.me")
	public String myPageView() {
		return "mypage";
	}
	
	// 마이페이지 : 비밀번호 변경 페이지로 이동
	@RequestMapping("updatePwdView.me")
	public String myPagePwdView() {
		return "updatePwd";
	}

	
	// 관리자 비밀번호 변경
	@RequestMapping("updatePwd.me")
	public String memPwd(@RequestParam("pwd") String oldPwd, @RequestParam("newPwd") String Pwd, Model model) {
		// 비밀번호 받아오기
//		System.out.println(oldPwd); // 기존 비밀번호
//		System.out.println(Pwd); // 새로운 비밀번호 리스트
		String[] pwdList = Pwd.split(",");
		String newPwd = pwdList[1]; // 새로운 비밀번호
			
		// 아이디 받아오기 
		Member m = (Member)model.getAttribute("loginUser");
//		System.out.println(m); 
		Member dbMember = mService.memberLogin(m);
		
		int result = 0;
			
		if(bcrypt.matches(oldPwd, dbMember.getPwd())) {
			HashMap<String, String> map = new HashMap<String, String> ();
			map.put("mNo", m.getmNo());
			map.put("newPwd", bcrypt.encode(newPwd));
			
			result = mService.updatePassword(map);
		}
			
		if(result > 0) {
			return "redirect:myPage.me";
		} else {
			throw new MemberException("비밀번호 수정에 실패하였습니다.");
		}
	}
	
	// 내정보 수정 페이지로 이동
	@RequestMapping("detailMyPage.me")
	public String updateMyPageView() {
		return "updateMypage";
	}
	
	
	// 내 정보 수정
	@RequestMapping("mUpdate.me")
	public String updateMember(@ModelAttribute Member m, Model model,
								@RequestParam("post") String post, 
								@RequestParam("address1") String address1, @RequestParam("address2") String address2, @RequestParam("address3") String address3, 
								@RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("date") int date, 
								@RequestParam("proImg") MultipartFile proImg, MultipartHttpServletRequest request) {
		
		/*------------------------------ 주소 ------------------------------*/
		m.setAddress(post + "/" + address1 + "/" + address2 + "/" + address3);
		
		/*------------------------------ 생년월일 ------------------------------*/
		Date birthDay = new Date(new GregorianCalendar(year, month-1, date).getTimeInMillis());
		m.setBirthDay(birthDay);
		
		/*------------------------------ 프로필 사진------------------------------*/
		Profile profile = new Profile();
		
		if( proImg != null && !proImg.isEmpty() ) {
		
			HashMap<String, String> profileInfo = saveFile(proImg, request); 
			
			if(profileInfo.get("renameFileName") != null) {
				profile.setpName(proImg.getOriginalFilename());
				profile.setpReName(profileInfo.get("renameFileName"));
				profile.setpUrl(profileInfo.get("renamePath"));
				profile.setmNo(m.getmNo());
				
				// 프로필 insert 및 update
				int result = mService.updateProfile(profile);
				if(result > 0) {
//					System.out.println("프로필 사진 등록 성공");
				} else {
					throw new MemberException("프로필 사진 등록에 실패하였습니다.");
				}
			}
			
		}
		// 프로필 사진 경로
		m.setProfile(profile);
		
		// 수정된 내용 확인
//		System.out.println(profile);
//		System.out.println(m);
		
		// 수정된 내용 저장
		int result  = mService.updateMemberInfo(m);
		if(result>0) {
			model.addAttribute("loginUser", m);
			return "redirect:myPage.me";
		} else {
			throw new MemberException("내 정보 수정에 실패하였습니다.");
		}

	}
	
	
	public HashMap<String, String> saveFile(MultipartFile file, HttpServletRequest request) {
		// 저장경로 : profileUploadFiles
		String root = request.getSession().getServletContext().getRealPath("resources"); // 작은 resources
		System.out.println(root);
		String savePath = root + "/profileUploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs(); 
		}
		
		// 이름 변경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String pName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." + pName.substring(pName.lastIndexOf(".") + 1); 
		
		String renamePath = folder + "/" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		HashMap<String, String> profileInfo = new HashMap<String, String>();
		profileInfo.put("renameFileName", renameFileName);
		profileInfo.put("renamePath", renamePath);
		
		return profileInfo;
		
	}
	
	
	// 임시비밀번호 발급? 페이지로 이동?
		@RequestMapping("findPwd.me")
		public String findPwdView() {
			return "findPwd";
		}

	
	
	
	
	
	
	
	
	
	
	
}