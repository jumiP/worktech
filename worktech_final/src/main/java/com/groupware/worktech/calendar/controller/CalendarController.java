package com.groupware.worktech.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {
	
	@RequestMapping("myCal.cr")
	public String myCalendar() {
		return "pCalendar";
	}
	
	

}
