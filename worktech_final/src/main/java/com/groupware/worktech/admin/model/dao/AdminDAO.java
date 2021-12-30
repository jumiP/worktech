package com.groupware.worktech.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.admin.model.vo.RvProduct;

@Repository("aDAO")
public class AdminDAO {

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
