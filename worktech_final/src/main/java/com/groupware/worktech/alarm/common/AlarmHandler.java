package com.groupware.worktech.alarm.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.groupware.worktech.member.model.vo.Member;

@Repository
public class AlarmHandler extends TextWebSocketHandler {

	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("Socket 연결");
		sessionList.add(session);
		
		String mNo = getmNo(session);
		System.out.println(mNo);
		userSessionsMap.put(mNo, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("받음: " + message);
		String sender = getmNo(session);
		
		String msg = message.getPayload();
		String[] strs = msg.split(",");
		
		if(strs != null && strs.length == 5) {
			String type = strs[0];
			String rName = strs[1];
			String receiver = strs[2];
			String bNo = strs[3];
			String bTitle = strs[4];
			
			WebSocketSession bWriterSession = userSessionsMap.get(receiver);
			
			// 일반 게시판 글 작성자가 로그인 중이라면
			if("cReply".equals(type) && bWriterSession != null) {
//				TextMessage tmpMsg = new TextMessage(rName + " 님이 " 
//						+ "<a href='cdetail.bo?bNo=" + bNo + "'>[" + bTitle + "]</a>" + "번 게시글에 댓글을 남겼습니다.");
//				bWriterSession.sendMessage(tmpMsg);
				
				TextMessage tmpMsg = new TextMessage(msg);
				bWriterSession.sendMessage(tmpMsg);
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("Socket 끊김");
		sessionList.remove(session);
	}

	private String getmNo(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member m = (Member)httpSession.get("loginUser");
		String mNo = m.getmNo();
		return mNo;
	}
}
