package com.groupware.worktech.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.groupware.worktech.admin.model.vo.Department;
import com.groupware.worktech.chat.model.vo.ChatMessage;
import com.groupware.worktech.chat.model.vo.ChatRoom;
import com.groupware.worktech.member.model.vo.Member;

@Repository("cDAO")
public class ChatDAO {

	public ArrayList<ChatRoom> selectChatList(SqlSessionTemplate sqlSession, String mNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList", mNo);
	}

	public ArrayList<Department> getChatDepartmentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chatMapper.getChatDepartmentList");
	}

	public ArrayList<Member> selectDeptMember(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectDeptMember", map);
	}

	public ArrayList<String> selectMemberName(SqlSessionTemplate sqlSession, ArrayList<String> mNoes) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectMemberName", mNoes);
	}

	public int insertGroupChatroom(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.insert("chatMapper.insertGroupChatroom", map);
	}

	public int insertGroupChatList(SqlSessionTemplate sqlSession, String mNo) {
		return sqlSession.insert("chatMapper.insertGroupChatList", mNo);
	}

	public ChatRoom selectCreateChatRoom(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chatMapper.selectCreateChatRoom");
	}

	public ArrayList<ChatMessage> selectMessageList(SqlSessionTemplate sqlSession, int chatRoomNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectMessageList", chatRoomNo);
	}

	public int getNotReadCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("chatMapper.getNotReadCount", map);
	}

}
