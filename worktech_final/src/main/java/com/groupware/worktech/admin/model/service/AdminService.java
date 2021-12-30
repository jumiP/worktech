package com.groupware.worktech.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.groupware.worktech.admin.model.dao.AdminDAO;
import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.admin.model.vo.RvProduct;

@Service("aService")
public class AdminService {
	
	@Autowired
	private AdminDAO aDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<Department> getDepartmentList() {
		return aDAO.getDepartmentList(sqlSession);
	}

	public int insertRvProduct(RvProduct rp) {
		int result = aDAO.insertRvProduct(sqlSession, rp);
		
		if(result > 0) {
			result += aDAO.insertRvRange(sqlSession, rp);
		}
		
		return result;
	}
	
}
