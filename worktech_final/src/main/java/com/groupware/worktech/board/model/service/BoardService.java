package com.groupware.worktech.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.groupware.worktech.board.model.dao.BoardDAO;
import com.groupware.worktech.board.model.vo.Board;
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

	public int insertNotice(Board b) {
		int result = bDAO.insertNotice(sqlSession, b);
		
		if(result > 0 && !b.getFileList().isEmpty()) {
			for(int i = 0; i < b.getFileList().size(); i++) {
				result += bDAO.insertNoticeFile(sqlSession, b.getFileList().get(i));
			}
		}
		
		return result;
	}

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

	




}
