package com.groupware.worktech.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.groupware.worktech.common.PageInfo;
import com.groupware.worktech.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int duplicateMNo(SqlSessionTemplate sqlSession, String mNo) {
		return sqlSession.selectOne("memberMapper.duplicateMNo", mNo);
	}

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.memberLogin", m);
	}

	// 사원목록
	public ArrayList<Member> selectMemList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemList", null, rowBounds);
	}

	// 관리자
	public ArrayList<Member> selectAdminList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectAdminList", null, rowBounds);
	}

	public int getMemListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.getMemListCount");
	}

	// 사원 수
	public int countMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.countMember");
	}

	// 사원 검색 : 사원 수
	public int getSearchResultListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.getSearchResultListCount", map);
	}

	// 사원 검색 : 검색 결과 
	public ArrayList<Member> selectSearchResultList(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, String> map) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchResultList", map, rowBounds);
	}

	// 사원 삭제
	public int deleteMember(SqlSessionTemplate sqlSession, String mNo) {
		return sqlSession.update("memberMapper.deleteMember", mNo);
	}

	// 사원 개별 삭제
	public int deleteSelectMember(SqlSessionTemplate sqlSession, String selectList) {
		return sqlSession.update("memberMapper.deleteSelectMember", selectList);
	}

	// 사원 상세보기
	public Member selectMember(SqlSessionTemplate sqlSession, String mNo) {
		return sqlSession.selectOne("memberMapper.selectMember", mNo);
	}

	
	

}
