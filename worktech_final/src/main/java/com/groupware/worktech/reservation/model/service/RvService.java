package com.groupware.worktech.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.groupware.worktech.reservation.model.dao.RvDAO;
import com.groupware.worktech.reservation.model.vo.Reservation;

@Service("rvService")
public class RvService {

	@Autowired
	private RvDAO rvDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Reservation> getRvMeetingRoomList() {
		return rvDAO.getRvMeetingRoomList(sqlSession);
	}
	
	public int insertReservation(Reservation r) {
		return rvDAO.insertReservation(sqlSession, r);
	}

	public Reservation selectReservation(int rvNo) {
		return rvDAO.selectReservation(sqlSession, rvNo);
	}

	public int deleteReservation(int rvNo) {
		return rvDAO.deleteReservation(sqlSession, rvNo);
	}

	
}
