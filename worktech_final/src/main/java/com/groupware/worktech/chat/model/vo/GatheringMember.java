package com.groupware.worktech.chat.model.vo;

public class GatheringMember {
	private int gatheringNo; // 참여자 리스트 번호
	private int chatRoomNo; // 채팅방 번호
	private String gatheringMember; // 참여자 사번
	private String profileUrl; // 프로필 사진 경로
	
	public GatheringMember() {}
	
	public GatheringMember(int gatheringNo, int chatRoomNo, String gatheringMember, String profileUrl) {
		super();
		this.gatheringNo = gatheringNo;
		this.chatRoomNo = chatRoomNo;
		this.gatheringMember = gatheringMember;
		this.profileUrl = profileUrl;
	}

	public int getGatheringNo() {
		return gatheringNo;
	}

	public void setGatheringNo(int gatheringNo) {
		this.gatheringNo = gatheringNo;
	}

	public int getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	public String getGatheringMember() {
		return gatheringMember;
	}

	public void setGatheringMember(String gatheringMember) {
		this.gatheringMember = gatheringMember;
	}
	
	public String getProfileUrl() {
		return profileUrl;
	}

	public void setProfileUrl(String profileUrl) {
		this.profileUrl = profileUrl;
	}

	@Override
	public String toString() {
		return "GatheringMember [gatheringNo=" + gatheringNo + ", chatRoomNo=" + chatRoomNo + ", gatheringMember="
				+ gatheringMember + ", profileUrl=" + profileUrl + "]";
	}
}
