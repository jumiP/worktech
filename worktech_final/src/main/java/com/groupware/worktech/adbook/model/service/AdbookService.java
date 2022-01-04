package com.groupware.worktech.adbook.model.service;

import java.util.ArrayList;

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

	public int getAdbookListCount() {
		return abDAO.getAdbookListCount(sqlSession);
	}

	public ArrayList<Member> selectAdbookList(PageInfo pi) {
		return abDAO.selectAdbookList(sqlSession, pi);
	}
}
