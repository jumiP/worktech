package com.groupware.worktech.adbook.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.groupware.worktech.common.PageInfo;
import com.groupware.worktech.member.model.vo.Member;

@Repository
public class AdbookDAO {

	public int getAdbookListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adbookMapper.getAdbookListCount");
	}

	public ArrayList<Member> selectAdbookList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adbookMapper.selectAdbookList", null, rowBounds);
	}

}
