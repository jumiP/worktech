package com.groupware.worktech.commut.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.groupware.worktech.commut.model.exception.CommutException;
import com.groupware.worktech.commut.model.service.CommutService;
import com.groupware.worktech.commut.model.vo.QRCode;
import com.groupware.worktech.commut.qrutil.QrUtil;
import com.groupware.worktech.member.model.vo.Member;

@SessionAttributes("qr")
@Controller
public class CommutController {
	
	@Autowired
	private CommutService coService; 
	
	@RequestMapping("qrMake.co")
	public String qrqode(HttpServletRequest request, HttpSession session, Model model) {
		
		String id = ((Member)session.getAttribute("loginUser")).getmNo();
		
		String url = "gowork.co?mNo="+id;
		int width = 150;
		int height = 150;
		
		// 어디에 저장할 건지 위치 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/qrcode";
		
		String file_name = id+".png";
		String file_path = savePath + "/" + file_name;
		
		QrUtil.makeQR(url, width, height, savePath, file_name);
		
		QRCode qr = new QRCode(0, file_name, file_path, id);
		
		int result = coService.insertQRCode(qr);
		
		if(result > 0) {
			QRCode newQR = coService.getinfo(id);
			if(newQR != null) {
				model.addAttribute("qr", newQR);
			}
			return "redirect:home.do";
		} else {
			throw new CommutException("QRCode 저장에 실패하였습니다.");
		}
		

		
	}
	
	@RequestMapping("qrcode.co")
	public String checkQRCode() {
		return "commut";
	}
	
	@RequestMapping("qrSelect.co")
	public String selectQRCode(HttpServletRequest request, HttpSession session, Model model) {
		String m_no = ((Member)session.getAttribute("loginUser")).getmNo();
		
		QRCode qr = new QRCode();
		qr.setM_no(m_no);
		
		qr = coService.selectQr(qr);
		
//		System.out.println(qr);
		
		if(qr != null) {
			model.addAttribute("QRCode", qr);	
		} else {
			throw new CommutException("QRCode 불러오기에 실패하였습니다.");
		}
		
		return "qrcode";
	}
	
	@RequestMapping("goWork.co")
	public String goWork() {
		
		System.out.println("여기에 들어왔나요?");
		
		return "redirect:home.do";
	}
		
}
