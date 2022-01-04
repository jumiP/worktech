<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

	<div class="menu">
		<a href="noticeList.ad">공지사항 게시판</a>
		<a href="commonList.bo">일반 게시판</a>
		<a href="mainPage.do">메인 페이지</a>
		<a href="chatting.ct">채팅</a>
		<a href="addRvView.ad">관리자 예약자산 추가</a>
		<a href="adbookList.ab">사내 주소록</a>
		<a href="pAdbookList.ab">개인 주소록</a>
	</div>
	<c:import url="../views/chat/chatMessage.jsp" />

	<c:if test="${ loginUser.mGrade eq 'USER' }">
		<c:import url="../views/main/mainUser.jsp" />
	</c:if>
    <c:if test="${ loginUser.mGrade eq 'ADMIN' }">
    	<c:import url="../views/common/headerAdmin.jsp" />
    </c:if>

</body>
</html>
