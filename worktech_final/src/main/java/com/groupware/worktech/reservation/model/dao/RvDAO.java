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

	public RvProduct selectFormOrvList(SqlSessionTemplate sqlSession, int pdNo) {
		return sqlSession.selectOne("reservationMapper.selectFormOrvList", pdNo);
	}

	public int insertOtherReservation(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.insert("reservationMapper.insertOtherReservation", r);
	}

	public ArrayList<Reservation> getOrvList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.getOrvList");
	}

	public int getCountUpdate(SqlSessionTemplate sqlSession, Reservation rvp) {
		return sqlSession.update("reservationMapper.getCountUpdate", rvp);
	}

	public ArrayList<Reservation> selectMyOrvList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectMyOrvList");
	}

	public Reservation myOrvDetail(SqlSessionTemplate sqlSession, int rvNo) {
		return sqlSession.selectOne("reservationMapper.myOrvDetail", rvNo);
	}

	public int myOrvListDelete(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.update("reservationMapper.myOrvListDelete", r);
	}

	public int getCountDelete(SqlSessionTemplate sqlSession, Reservation rvp) {
		return sqlSession.update("reservationMapper.getCountDelete", rvp);
	}




}
