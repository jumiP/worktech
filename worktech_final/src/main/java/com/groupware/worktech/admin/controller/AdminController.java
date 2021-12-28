package com.groupware.worktech.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.groupware.worktech.admin.model.service.AdminService;
import com.groupware.worktech.board.model.exception.BoardException;
import com.groupware.worktech.board.model.service.BoardService;
import com.groupware.worktech.board.model.vo.Board;
import com.groupware.worktech.board.model.vo.BoardFile;
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
								MultipartHttpServletRequest request) {
		
		ArrayList<BoardFile> fileList = new ArrayList<BoardFile>();

		if(uploadFile != null && !uploadFile[0].isEmpty()) {
			
			for(int i=0; i<uploadFile.length; i++) {
				HashMap<String, String> fileInfo = saveFile(uploadFile[i], request); 
				
				if(fileInfo.get("renameFileName") != null) {
					BoardFile f = new BoardFile();
					f.setfName(uploadFile[i].getOriginalFilename());
					f.setfRname(fileInfo.get("renameFileName"));
					f.setfURL(fileInfo.get("renamePath"));
					f.setRefBNo(b.getbNo());
					
					fileList.add(f);

				}
			}
		}
		
		b.setFileList(fileList);
		
		int result = bService.insertNotice(b);
		
		if(result >= b.getFileList().size() + 1) {
			return "redirect:noticeList.ad";
		} else {
			throw new BoardException("공지글 등록에 실패하였습니다.");
		}
		
	}
	
	public HashMap<String, String> saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		// buploadFiles 폴더에 저장
		String savePath = root + "/buploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originFileName = file.getOriginalFilename();
		String renameFileName = randomStr(2) + sdf.format(new Date(System.currentTimeMillis())) + randomStr(3) + "." 
								+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "/" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		HashMap<String, String> fileInfo = new HashMap<String, String>();
		fileInfo.put("renameFileName", renameFileName);
		fileInfo.put("renamePath", renamePath);
		
		return fileInfo;
	}
	
	public String randomStr(int length) {
		int leftLimit = 48; // numeral '0'
		int rightLimit = 122; // letter 'z'
		int targetStringLength = length;
		Random random = new Random();

		String generatedString = random.ints(leftLimit,rightLimit + 1)
		  .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
		  .limit(targetStringLength)
		  .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
		  .toString();

		return generatedString;
	}
	
	@RequestMapping("ndetail.ad")
	public String noticeDetail(@RequestParam("page") int page, @RequestParam("bNo") int bNo, @RequestParam(value = "upd", required = false) String upd,
								Model model) {
		Board b = bService.selectNotice(bNo, upd);
		
		model.addAttribute("b", b).addAttribute("page", page); 
		
		return "adminNoticeDetail";
	}
	
	@RequestMapping("nupdateView.ad")
	public String updateNoticeView(@RequestParam("page") int page, @RequestParam("bNo") int bNo, @RequestParam(value = "upd", required = false) String upd, Model model) {
		Board b = bService.selectNotice(bNo, upd);
		
		model.addAttribute("b", b).addAttribute("page", page); 
		
		return "adminNoticeUpdate";
	}
	
	@RequestMapping("nupdate.ad")
	public String updateNotice(@ModelAttribute Board b, @RequestParam("reloadFile") MultipartFile[] reloadFile,
							   @RequestParam(value="fNo",required=false) ArrayList<Integer> fNoes, @RequestParam("page") int page, 
							  HttpServletRequest request, Model model) {
		// 저장되어 있는 파일 삭제
		if(fNoes != null && !fNoes.isEmpty()) { 
			ArrayList<BoardFile> fileList = bService.selectNotice(b.getbNo(), "Y").getFileList();
			
			for(int i = 0; i < fileList.size(); i++) {
				int fNo = fileList.get(i).getfNo();
				
				if(!fNoes.contains(fNo)) {
					
					deleteFile(fileList.get(i).getfRname(), request);
					
					int result = bService.deleteNoticeFile(fNo);
					
					if(result <= 0) {
						throw new BoardException("첨부 파일 삭제에 실패하였습니다."); 
					}
				}
				
			}
		}
		
		// 새로 추가한 파일 등록
		ArrayList<BoardFile> fileList = new ArrayList<BoardFile>();
		if(reloadFile != null && reloadFile[0].getOriginalFilename() != null) {
			for(int i=0; i<reloadFile.length; i++) {
				HashMap<String, String> fileInfo = saveFile(reloadFile[i], request); 
				
				if(fileInfo.get("renameFileName") != null) {
					BoardFile f = new BoardFile();
					f.setfName(reloadFile[i].getOriginalFilename());
					f.setfRname(fileInfo.get("renameFileName"));
					f.setfURL(fileInfo.get("renamePath"));
					f.setRefBNo(b.getbNo());
					
					fileList.add(f);
				}
			}
		}
		
		b.setFileList(fileList);
		
		int result = bService.updateNotice(b);
		
		if(result >= b.getFileList().size() + 1) {
			model.addAttribute("page", page);
			return "redirect:ndetail.ad?bNo=" + b.getbNo() + "&upd=Y";
		} else {
			throw new BoardException("공지글 수정에 실패하였습니다.");
		}
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/buploadFiles";
		
		File f = new File(savePath + "/" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("noticeDelete.ad")
	public String deleteBoard(@RequestParam("bNo") int bNo, HttpServletRequest request) {
		Board b = bService.selectNotice(bNo, "Y");
		
		ArrayList<BoardFile> bfList = b.getFileList();
		if(bfList != null && bfList.get(0).getfName() != null) { // 첨부파일이 존재하면 첨부파일 삭제
			for(BoardFile bf : bfList) {
				deleteFile(bf.getfRname(), request);
				
				int result = bService.deleteNoticeFile(bf.getfNo());
				
				if(result <= 0) {
					throw new BoardException("첨부 파일 삭제에 실패하였습니다."); 
				}
			}
		}
		
		int result = bService.deleteNotice(bNo);
		
		if(result > 0) {
			return "redirect:noticeList.ad";
		} else {
			throw new BoardException("공지글 삭제에 실패하였습니다."); 
		}
	}
	
	
//	ajax를 이용한 파일 삭제
//	@RequestMapping("deleteNoticeFile.ad")
//	@ResponseBody
//	public String deleteNoticeFile(@RequestParam("fNo") int fNo, HttpServletRequest request) {
//		BoardFile bf = bService.selectFile(fNo);
//		
//		String root = request.getSession().getServletContext().getRealPath("resources");
//		String savePath = root + "/buploadFiles";
//		
//		File f = new File(savePath + "/" + bf.getfRname());
//		
//		if(f.exists()) {
//			f.delete();
//		}
//		
//		int result = bService.deleteNoticeFile(fNo);
//		
//		if(result > 0) {
//			return "success";
//		} else {
//			throw new BoardException("첨부 파일 삭제에 실패하였습니다."); 
//		}
//	}
	
}
