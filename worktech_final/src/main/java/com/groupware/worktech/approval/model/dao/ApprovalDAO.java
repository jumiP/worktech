package com.groupware.worktech.approval.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.approval.model.vo.Approval;

@Repository("AppDAO")
public class ApprovalDAO {

	public ArrayList<Approval> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApproval");
	}

	public List<Department> approvallinelist(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("approvalMapper.approvallinelist");
	}
	
}
