<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>채팅 목록</title>

  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="resources/dist/assets/modules/prism/prism.css">
  <link rel="stylesheet" href="resources/dist/assets/modules/fontawesome/css/all.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
    }

    .container {
      margin-top: 20px;
      margin-bottom: 20px;
    }

    img {
      max-width: 100%;
    }

    .inbox_msg {
      border: 1px solid #c4c4c4;
      clear: both;
      overflow: hidden;
    }

    .recent_heading {
      float: left;
      width: 40%;
    }

    .srch_bar {
      display: inline-block;
      text-align: right;
      width: 65%;
    }

    .headind_srch {
      padding: 10px 0px 10px 20px;
      overflow: hidden;
      background: rgba(0, 0, 0, 0.1);
      border-bottom: 1px solid #c4c4c4;
    }

    .recent_heading h4 {
      color: #666666;
      font-size: 20px;
      margin: auto;
      transform: translateY(35%);
    }

    .srch_bar button {
      background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
      border: medium none;
      padding: 0;
      color: #707070;
      font-size: 18px;
      outline: 0;
    }

    .srch_bar input {
      border: 1px solid #cdcdcd;
      border-width: 0 0 1px 0;
      width: 80%;
      padding: 2px 0 4px 6px;
      background: none;
    }

    .srch_bar  {
      background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
      border: medium none;
      padding: 0;
      color: #707070;
      font-size: 18px;
    }

    .srch_bar {
      margin: 0 0 0 -27px;
    }

    .chat_ib h5 {
      font-size: 15px;
      color: #464646;
      margin: 0 0 8px 0;
    }

    .chat_ib h5 .chat_date {
      font-size: 13px;
      float: right;
    }

    .chat_ib p {
      font-size: 14px;
      color: #989898;
      margin: auto
    }

    .chat_img {
      float: left;
      width: 11%;
    }

    .chat_ib {
      float: left;
      padding: 0 0 0 15px;
      width: 88%;
    }

    .chat_people {
      overflow: hidden;
      clear: both;
    }

    .chat_list {
      border-bottom: 1px solid #c4c4c4;
      margin: 0;
      padding: 18px 16px 10px;
    }
    
    .alarmBadge {
    	display: inline-block;
    	position: relative;
    	top: 25px;
    	right: -265px;
    	background: #FF4848;
    	border-radius: 50%;
    	width: 20px;
    	height: 20px;
    }
    
    .btn {
    	display: inline-block;
    	margin: 0px;
    }
    
    button:hover{
    	cursor: pointer;
    }
    
    #chatNo {
    	display: none;
    }
  </style>
</head>

<body>
	<div class="container">
		<div class="messaging">
			<div class="inbox_msg">
				<div class="headind_srch">
					<div class="recent_heading">
						<h4>채팅 목록</h4>
					</div>
					<div class="srch_bar">
						<div class="stylish-input-group">
							<div class="btn">
								<button type="button">
									<i class="fas fa-cog"></i>
								</button>
							</div>
							<div class="btn">
								<button type="button" id="addChat">
									<i class="fas fa-plus"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<form action="chatDetail.ct" method="post" id="goDetail">
					<input type="hidden" name="chatRoomNo" id="chatRoomNo">
					<div>
						<c:forEach var="ch" items="${ list }">
							<div class="chat_list">
								<div id="chatNo">${ ch.chatRoomNo }</div>
								<div class="chat_people">
									<div class="chat_img">
										<img src="resources/dist/assets/img/avatar/avatar-1.png" class="mr-3 rounded-circle" width="50"
											alt="image">
									</div>
									<div class="chat_ib">
										<h5>
											${ ch.chatTitle } 
											<span class="badge badge-danger alarmBadge">${ ch.notReadCount }</span>
											<span class="chat_date">
												<jsp:useBean id="today" class="java.util.Date" />
												<fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd" />
												
												<c:if test="${ now eq ch.date }">
													${ ch.time }
												</c:if>
												<c:if test="${ now ne ch.date }">
													${ ch.date }
												</c:if>
											</span>
											
										</h5>
										<p>${ ch.recentMsg }</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
    	// 게시글 목록 마우스오버 이벤트
	    $(function() {
			$('.chat_list').mouseover(function() {
				$(this).css({'background':'rgba(0, 0, 0, 0.04)', 'font-weight':'bold', 'cursor':'pointer'});
			}).mouseout(function() {
				$(this).css({'background':'white', 'font-weight':'normal'});
			}).click(function() {
				var chatRoomNo = $(this).find('#chatNo').text();
				$('#chatRoomNo').val(chatRoomNo);
				$('#goDetail').submit();
			});
		
	    	$('#addChat').click(function() {
	    		location.href='addChatView.ct';
			});
	    });
	    
	</script>
	
	<!-- General JS Scripts -->
	<script src="assets/modules/jquery.min.js"></script>
	<script src="assets/modules/popper.js"></script>
	<script src="assets/modules/tooltip.js"></script>
	<script src="assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="assets/modules/moment.min.js"></script>
	<script src="assets/js/stisla.js"></script>
	
	<!-- JS Libraies -->
	<script src="assets/modules/prism/prism.js"></script>
	
	<!-- Page Specific JS File -->
	<script src="assets/js/page/bootstrap-modal.js"></script>
	
	<!-- Template JS File -->
	<script src="assets/js/scripts.js"></script>
	<script src="assets/js/custom.js"></script>
</body>


</html>