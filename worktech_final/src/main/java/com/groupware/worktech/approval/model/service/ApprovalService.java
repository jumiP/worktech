package com.groupware.worktech.approval.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.approval.model.dao.ApprovalDAO;
import com.groupware.worktech.approval.model.vo.Approval;

@Service("AppService")
public class ApprovalService {
	
	@Autowired
	private ApprovalDAO AppDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Approval> selectList() {
		return AppDAO.selectList(sqlSession);
	}

	public List<Department> approvallinelist() {
		return AppDAO.approvallinelist(sqlSession);
	}

}
