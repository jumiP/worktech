package com.groupware.worktech.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.groupware.worktech.chat.model.dao.ChatDAO;
import com.groupware.worktech.chat.model.vo.ChatRoom;

@Service("cService")
public class ChatService {
	
	@Autowired
	private ChatDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<ChatRoom> selectChatList(String mNo) {
		return cDAO.selectChatList(sqlSession, mNo);
	}
}
