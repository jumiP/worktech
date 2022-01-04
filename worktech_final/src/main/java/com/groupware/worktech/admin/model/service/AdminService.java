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

	// 부서 리스트
	public ArrayList<Department> selectDepList() {
		return aDAO.selectDepList(sqlSession);
	}

	
	// 부서 구성원 수
	public ArrayList<Integer> depCountList() {
		return aDAO.depCountList(sqlSession);
	}
	public int depCount(String dNo) {
		return aDAO.depCount(sqlSession, dNo);
	}
	
	// 부서 등록
	public int insertDepartment(Department d) {
		return aDAO.insertDepartment(sqlSession, d);
	}
	
	// 부서 이름 중복 확인
	public int duplicateDName(String dName) {
		return aDAO.duplicateDName(sqlSession, dName);
	}
	
	
	// 부서 삭제
	public int deleteDep(String dNo) {
		return aDAO.deleteDep(sqlSession, dNo);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
