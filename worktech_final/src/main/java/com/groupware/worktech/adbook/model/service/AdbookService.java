package com.groupware.worktech.adbook.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.groupware.worktech.adbook.model.dao.AdbookDAO;
import com.groupware.worktech.common.PageInfo;
import com.groupware.worktech.member.model.vo.Member;

@Service
public class AdbookService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdbookDAO abDAO;

	public int getAdbookListCount(HashMap<String, String> selectMap) {
		return abDAO.getAdbookListCount(sqlSession, selectMap);
	}

	public ArrayList<Member> selectAdbookList(PageInfo pi, HashMap<String, String> selectMap) {
		return abDAO.selectAdbookList(sqlSession, pi, selectMap);
	}
	
	public int getSearchAdbookListCount(String searchValue) {
		return abDAO.getSearchAdbookListCount(sqlSession, searchValue);
	}

	public ArrayList<Member> selectSearchAdbookList(PageInfo pi, String searchValue) {
		return abDAO.selectSearchAdbookList(sqlSession, pi, searchValue);
	}

	
}
