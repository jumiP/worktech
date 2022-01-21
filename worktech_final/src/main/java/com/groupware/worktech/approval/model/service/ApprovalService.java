package com.groupware.worktech.approval.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.approval.model.dao.ApprovalDAO;
import com.groupware.worktech.approval.model.vo.Approval;
import com.groupware.worktech.common.PageInfo;

@Service("AppService")
public class ApprovalService {
	
	@Autowired
	private ApprovalDAO AppDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Approval> selectMainList(String mNo) {
		return AppDAO.selectMainList(sqlSession, mNo);
	}

	public List<Department> approvallinelist() {
		return AppDAO.approvallinelist(sqlSession);
	}

	public ArrayList<Approval> selectWaitList(PageInfo pi, String mNo) {
		return AppDAO.selectWaitList(sqlSession, pi, mNo);
	}

	public ArrayList<Approval> selectProgressList(PageInfo pi, String mNo) {
		return AppDAO.selectProgressList(sqlSession, pi, mNo);
	}

	public ArrayList<Approval> selectCompleteList(PageInfo pi, String mNo) {
		return AppDAO.selectCompleteList(sqlSession, pi, mNo);
	}

	public int getListCountWait() {
		return AppDAO.getListCountWait(sqlSession);
	}

	public int getListCountProgress() {
		return AppDAO.getListCountProgress(sqlSession);
	}

	public int getListCountComplete() {
		return AppDAO.getListCountComplete(sqlSession);
	}


}
