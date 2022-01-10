package com.groupware.worktech.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {
	
	@RequestMapping("rvMeetingRoomView.rv")
	public String rvMeetingRoomView() {
		return "rvMeetingRoomView";
	}
	
	@RequestMapping("insertRvMeetingRoom.rv")
	public String rvAddForm() {
		return "insertRvMeetingRoom";
	}
}
