package com.groupware.worktech.alarm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.groupware.worktech.alarm.model.service.AlarmService;
import com.groupware.worktech.alarm.model.vo.Alarm;

@Controller
public class AlarmController {

	@Autowired
	private AlarmService alService;
	
	@RequestMapping("alarmList.al")
	public void alarmList(@RequestParam("mNo") String mNo, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<Alarm> list = alService.selectAlarmList(mNo);
		
		GsonBuilder gb = new GsonBuilder().setDateFormat("MM월 dd일 HH:mm");
		
		Gson gson = gb.create();
		
		if(list != null) {
			try {
				gson.toJson(list, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
