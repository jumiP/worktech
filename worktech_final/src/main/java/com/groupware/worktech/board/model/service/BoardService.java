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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int insertCommonBoard(Board b) {
		int result = bDAO.insertCommonBoard(sqlSession, b);
		return result;
	}




}
