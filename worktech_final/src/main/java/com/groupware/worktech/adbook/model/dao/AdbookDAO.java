package com.groupware.worktech.adbook.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.groupware.worktech.common.PageInfo;
import com.groupware.worktech.member.model.vo.Member;

@Repository
public class AdbookDAO {

	public int getAdbookListCount(SqlSessionTemplate sqlSession, HashMap<String, String> selectMap) {
		return sqlSession.selectOne("adbookMapper.getAdbookListCount", selectMap);
	}

	public ArrayList<Member> selectAdbookList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> selectMap) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adbookMapper.selectAdbookList", selectMap, rowBounds);
	}

	public int getSearchAdbookListCount(SqlSessionTemplate sqlSession, String searchValue) {
		return sqlSession.selectOne("adbookMapper.getSearchAdbookListCount", searchValue);
	}
	
	public ArrayList<Member> selectSearchAdbookList(SqlSessionTemplate sqlSession, PageInfo pi, String searchValue) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adbookMapper.selectSearchAdbookList", searchValue, rowBounds);
	}

	

}
