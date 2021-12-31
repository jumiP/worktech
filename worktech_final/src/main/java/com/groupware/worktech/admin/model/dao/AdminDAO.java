package com.groupware.worktech.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.admin.model.vo.RvProduct;
import com.groupware.worktech.admin.model.vo.RvRange;
import com.groupware.worktech.common.PageInfo;

@Repository("aDAO")
public class AdminDAO {

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<Department> getDepartmentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.getDepartmentList");
	}

	public int insertRvProduct(SqlSessionTemplate sqlSession, RvProduct rp) {
		return sqlSession.insert("adminMapper.insertRvProduct", rp);
	}

	public int insertRvRange(SqlSessionTemplate sqlSession, ArrayList<RvRange> rrList) {
		int result = 0;
		
		for(RvRange r: rrList) {
			result += sqlSession.insert("adminMapper.insertRvRange", r);
		}
		
		return result;
	}

	public int getRvListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getRvListCount");
	}

	public ArrayList<RvProduct> selectRvProductList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectRvProductList", null, rowBounds);
	}

	public RvProduct selectRvProduct(SqlSessionTemplate sqlSession, int pdNo) {
		return sqlSession.selectOne("adminMapper.selectRvProduct", pdNo);
	}

	public int deleteRvProduct(SqlSessionTemplate sqlSession, int pdNo) {
		return sqlSession.update("adminMapper.deleteRvProduct", pdNo);
	}

	public ArrayList<Integer> getOriginRvRangeList(SqlSessionTemplate sqlSession, int pdNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.getOriginRvRangeList", pdNo);
	}

	public int updateRvRange(SqlSessionTemplate sqlSession, RvRange rr) {
		return sqlSession.insert("adminMapper.updateRvRange", rr);
	}

	public int deleteRvRange(SqlSessionTemplate sqlSession, RvRange rr) {
		return sqlSession.delete("adminMapper.deleteRvRange", rr);
	}

}
