package com.groupware.worktech.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.groupware.worktech.chat.model.vo.ChatRoom;

@Repository("cDAO")
public class ChatDAO {

	public ArrayList<ChatRoom> selectChatList(SqlSessionTemplate sqlSession, String mNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList", mNo);
	}

}
