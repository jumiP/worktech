package com.groupware.worktech.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.groupware.worktech.board.model.dao.BoardDAO;
import com.groupware.worktech.board.model.vo.Board;
import com.groupware.worktech.board.model.vo.BoardFile;
import com.groupware.worktech.board.model.vo.Reply;
import com.groupware.worktech.common.PageInfo;

@Service("bService")
public class BoardService {

	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(String bType) {
		return bDAO.getListCount(sqlSession, bType);
	}

	public ArrayList<Board> selectNoticeList(PageInfo pi) {
		return bDAO.selectNoticeList(sqlSession, pi);
	}
	
	@Transactional
	public int insertNotice(Board b) {
		int result = bDAO.insertNotice(sqlSession, b);
		
		if(result > 0 && !b.getFileList().isEmpty()) {
			for(int i = 0; i < b.getFileList().size(); i++) {
				result += bDAO.insertNoticeFile(sqlSession, b.getFileList().get(i));
			}
		}
		
		return result;
	}

	@Transactional
	public Board selectNotice(int bNo, String upd) {
		Board b = null;
		
		if(upd != null && upd.equals("Y")) {
			b = bDAO.selectNotice(sqlSession, bNo);
		} else {
			int result = bDAO.addReadCount(sqlSession, bNo);
			
			if(result > 0) {
				b = bDAO.selectNotice(sqlSession, bNo);
			} 
			
		}
		
		return b;
	}

	public BoardFile selectFile(int fNo) {
		return bDAO.selectFile(sqlSession, fNo);
	}

	public int deleteNoticeFile(int fNo) {
		return bDAO.deleteNoticeFile(sqlSession, fNo);
	}
	
	@Transactional
	public int updateNotice(Board b) {
		int result = bDAO.updateNotice(sqlSession, b);
		
		if(result > 0 && !b.getFileList().isEmpty()) {
			for(int i = 0; i < b.getFileList().size(); i++) {
				result += bDAO.updateNoticeFile(sqlSession, b.getFileList().get(i));
			}
		}
		
		return result;
	}
	
	public int deleteNotice(int bNo) {
		return bDAO.deleteNotice(sqlSession, bNo);
	}
	
	public int getNoticeSearchListCount(HashMap<String, String> search) {
		return bDAO.getNoticeSearchListCount(sqlSession, search);
	}
	
	public ArrayList<Board> selectNoticeSearchList(PageInfo pi, HashMap<String, String> search) {
		return bDAO.selectNoticeSearchList(sqlSession, pi, search);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int insertCommonBoard(Board b) {
		int result = bDAO.insertCommonBoard(sqlSession, b);
		
		if(result > 0 && !b.getFileList().isEmpty()) {
			for(int i = 0; i < b.getFileList().size(); i++) {
				result += bDAO.insertNoticeFile(sqlSession, b.getFileList().get(i));
			}
		}
		return result;

	}

	public ArrayList<Board> selectCommonList(PageInfo pi) {
		return bDAO.selectCommonList(sqlSession, pi);
	}
	
	public ArrayList<Board> selectCommonList(PageInfo pi, Integer category) {
		return bDAO.selectCommonList(sqlSession, pi, category);
	}

	public int getCategoryListCount(Integer category) {
		return bDAO.getCategoryListCount(sqlSession, category);
	}

	public Board selectCommonBoard(int bNo, String upd) {
		Board b = null;
		if(upd != null && upd.equals("Y")) {
			b = bDAO.selectCommonBoard(sqlSession, bNo);
		} else {
			int result = bDAO.addReadCount(sqlSession, bNo);
			
			if(result > 0) {
				b = bDAO.selectCommonBoard(sqlSession, bNo);
			}
		}
		
		return b;
	}

	public int updateCommonBoard(Board b) {
		int result = bDAO.updateCommonBoard(sqlSession, b);
		
		if(result > 0 && !b.getFileList().isEmpty()) {
			for(int i = 0; i < b.getFileList().size(); i++) {
				result += bDAO.updateNoticeFile(sqlSession, b.getFileList().get(i));
			}
		}
			
		return result;
	}

	public int getCommonSearchListCount(HashMap<String, Object> searchMap) {
		return bDAO.getCommonSearchListCount(sqlSession, searchMap);
	}

	public ArrayList<Board> selectCommonSearchList(HashMap<String, Object> searchListMap) {
		return bDAO.selectCommonSearchList(sqlSession, searchListMap);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 화상 회의
	public int getZListCount() {
		return bDAO.getZListCount(sqlSession);
	}

	public ArrayList<Board> selectZList(PageInfo pi) {
		return bDAO.selectZList(sqlSession, pi);
	}
	
	public int insertCommonReply(Reply r) {
		return bDAO.insertCommonReply(sqlSession, r);
	}

	public ArrayList<Reply> selectCommonReplyList(int bNo) {
		return bDAO.selectCommonReplyList(sqlSession, bNo);
	}

	public int deleteCommonReply(int rNo) {
		return bDAO.deleteCommonReply(sqlSession, rNo);
	}




	

	

	

	




}
