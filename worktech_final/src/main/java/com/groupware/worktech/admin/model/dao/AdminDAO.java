package com.groupware.worktech.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.admin.model.vo.RvProduct;

@Repository("aDAO")
public class AdminDAO {

	
	// 부서 목록
	public ArrayList<Department> selectDepList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectDepList");
	}
	
	// 부서 구성원 수
	public ArrayList<Integer> depCountList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.depCountList");
	}
	public int depCount(SqlSessionTemplate sqlSession, String dNo) {
		return sqlSession.selectOne("adminMapper.depCount", dNo);
	}
	

	// 부서 등록
	public int insertDepartment(SqlSessionTemplate sqlSession, Department d) {
		return sqlSession.insert("adminMapper.insertDepartment", d);
	}

	// 부서 이름 중복확인
	public int duplicateDName(SqlSessionTemplate sqlSession, String dName) {
		return sqlSession.selectOne("adminMapper.duplicateDName", dName);
	}
	
	
	// 부서 삭제
	public int deleteDep(SqlSessionTemplate sqlSession, String dNo) {
		return sqlSession.update("adminMapper.deleteDep", dNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<Department> getDepartmentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.getDepartmentList");
	}

	public int insertRvProduct(SqlSessionTemplate sqlSession, RvProduct rp) {
		return sqlSession.insert("adminMapper.insertRvProduct", rp);
	}

	public int insertRvRange(SqlSessionTemplate sqlSession, RvProduct rp) {
		
		
		return 0;
	}

	

	



	

	






















































































	

	
}
