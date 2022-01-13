package com.groupware.worktech.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.groupware.worktech.admin.model.vo.RvProduct;
import com.groupware.worktech.reservation.model.vo.Reservation;

@Repository("rvDAO")
public class RvDAO {

	public ArrayList<Reservation> getRvMeetingRoomList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.getRvMeetingRoomList");
	}

	public int insertReservation(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.insert("reservationMapper.insertReservation", r);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	public ArrayList<RvProduct> selectOrvList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectOrvList");
	}


}
