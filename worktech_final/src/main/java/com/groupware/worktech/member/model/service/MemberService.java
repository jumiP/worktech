package com.groupware.worktech.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.groupware.worktech.common.PageInfo;
import com.groupware.worktech.member.model.dao.MemberDAO;
import com.groupware.worktech.member.model.vo.Member;

@Service("mService")
public class MemberService {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;

	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	public int duplicateMNo(String mNo) {
		return mDAO.duplicateMNo(sqlSession, mNo);
	}

	public Member memberLogin(Member m) {
		return mDAO.memberLogin(sqlSession, m);
	}

	// 사원 목록
	public ArrayList<Member> selectMemList(PageInfo pi) {
		return mDAO.selectMemList(sqlSession, pi);
	}

	// 관리자
	public ArrayList<Member> selectAdminList(PageInfo pi) {
		return mDAO.selectAdminList(sqlSession, pi);
	}

	public int getMemListCount() {
		return mDAO.getMemListCount(sqlSession);
	}
	
	// 사원 수
	public int countMember() {
		return mDAO.countMember(sqlSession);
	}

	// 사원 검색 : 사원수
	public int getSearchResultListCount(HashMap<String, String> map) {
		return mDAO.getSearchResultListCount(sqlSession, map);
	}

	// 사원 검색 : 검색 결과 
	public ArrayList<Member> selectSearchResultList(PageInfo pi, HashMap<String, String> map) {
		return mDAO.selectSearchResultList(sqlSession, pi, map);
	}

	// 사원 삭제
	public int deleteMember(String mNo) {
		return mDAO.deleteMember(sqlSession, mNo);
	}

	// 사원 삭제 개별
//	public void deleteSelectMember(String string) {
//		 mDAO.deleteSelectMember(sqlSession, string);
//		
//	}



}
