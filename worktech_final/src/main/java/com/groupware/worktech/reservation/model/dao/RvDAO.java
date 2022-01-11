package com.groupware.worktech.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.groupware.worktech.reservation.model.vo.Reservation;

@Repository("rvDAO")
public class RvDAO {

	public ArrayList<Reservation> getRvMeetingRoomList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.getRvMeetingRoomList");
	}

	public int insertReservation(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.insert("reservationMapper.insertReservation", r);
	}

	public Reservation selectReservation(SqlSessionTemplate sqlSession, int rvNo) {
		return sqlSession.selectOne("reservationMapper.selectReservation", rvNo);
	}

	public int deleteReservation(SqlSessionTemplate sqlSession, int rvNo) {
		return sqlSession.update("reservationMapper.deleteReservation", rvNo);
	}


}
