package com.groupware.worktech.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.groupware.worktech.admin.model.dao.AdminDAO;
import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.admin.model.vo.RvProduct;
import com.groupware.worktech.admin.model.vo.RvRange;
import com.groupware.worktech.common.PageInfo;

@Service("aService")
public class AdminService {
	
	@Autowired
	private AdminDAO aDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<Department> getDepartmentList() {
		return aDAO.getDepartmentList(sqlSession);
	}
	
	@Transactional
	public int insertRvProduct(RvProduct rp) {
		int result = aDAO.insertRvProduct(sqlSession, rp);
		
		if(result > 0) {
			result += aDAO.insertRvRange(sqlSession, rp.getRvRange());
		}
		
		return result;
	}

	public int getRvListCount() {
		return aDAO.getRvListCount(sqlSession);
	}

	public ArrayList<RvProduct> selectRvProductList(PageInfo pi) {
		return aDAO.selectRvProductList(sqlSession, pi);
	}

	public RvProduct selectRvProduct(int pdNo) {
		return aDAO.selectRvProduct(sqlSession, pdNo);
	}

	public int deleteRvProduct(int pdNo) {
		return aDAO.deleteRvProduct(sqlSession, pdNo);
	}

	public ArrayList<Integer> getOriginRvRangeList(int pdNo) {
		return aDAO.getOriginRvRangeList(sqlSession, pdNo);
	}
	
}
