package com.groupware.worktech.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
