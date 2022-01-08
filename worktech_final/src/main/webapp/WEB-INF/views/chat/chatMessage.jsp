<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>채팅 메시지</title>

    <!-- General CSS Files -->
    <link rel="stylesheet" href="resources/dist/assets/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/dist/assets/modules/fontawesome/css/all.min.css">

    <!-- CSS Libraries -->

    <!-- Template CSS -->
    <link rel="stylesheet" href="resources/dist/assets/css/style.css">
    <link rel="stylesheet" href="resources/dist/assets/css/components.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
    <script src="resources/js/jquery-3.6.0.min.js"></script>
    <!-- Start GA -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'UA-94034622-3');
    </script>
    <!-- /END GA -->

    <style>
        body{
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        #chatMsgBody{
        	height: 380px;
        }
    </style>
</head>

<body>
    <div class="main-content">
        <section class="section">
            <div class="col-12 col-sm-6 col-lg-4">
                <div class="card chat-box" id="mychatbox">
                    <div class="card-header">
                    	<h4>
	                    	<c:if test="${ cr.chatTitle eq 'Personal' }">
								<c:forEach var="gl" items="${ memberList }">
									<c:if test="${ gl.gatheringMember != loginUser.mNo }">
										${ gl.gatheringMemberDName } ${ gl.gatheringMemberName } ${ gl.gatheringMemberJobGrade }
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${ cr.chatTitle ne 'Personal' }">
								${ cr.chatTitle } <b>(${ fn:length(memberList) })</b>
							</c:if>
							<c:if test="${ ch.notReadCount != 0 }">
								<span class="alarmBadge">${ ch.notReadCount }</span>
							</c:if>
                    	</h4>
                    </div>
                    <jsp:useBean id="today" class="java.util.Date" />
					<fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd" />
                    <div class="card-body chat-content" tabindex="1" style="overflow: hidden; outline: none;" id="chatMsgBody">
	                    <c:forEach var="msg" items="${ messageList }">
	                    	<c:if test="${ loginUser.mNo != msg.sendMember }">
	                    		<div class="chat-item chat-left">
	                    		${ msg.sendMemberName }
	                    			<c:if test="${ msg.profileUrl != null }">
	                    				<img src="${ msg.profileUrl }">
	                    			</c:if>
	                    			<c:if test="${ msg.profileUrl == null }">
	                    				<img src="resources/dist/assets/img/avatar/avatar-1.png">
	                    			</c:if>
	                    			<div class="chat-details">
		                    			<div class="chat-text">${ msg.msgContent }</div>
	                                	<div class="chat-time">
	                                		<c:if test="${ now eq msg.date }">
												${ ch.time }
											</c:if>
											<c:if test="${ now ne msg.date }">
												${ ch.date }
											</c:if>
	                                	</div>
	                                </div>
	                    		</div>
	                    	</c:if>
	                    	<c:if test="${ loginUser.mNo == msg.sendMember }">
	                    		<div class="chat-item chat-right">
	                    			<c:if test="${ msg.profileUrl != null }">
	                    				<img src="${ msg.profileUrl }">
	                    			</c:if>
	                    			<c:if test="${ msg.profileUrl == null }">
	                    				<img src="resources/dist/assets/img/avatar/avatar-1.png">
	                    			</c:if>
	                    			<div class="chat-details">
		                    			<div class="chat-text">${ msg.msgContent }</div>
		                    			<div class="chat-time">
	                                		<c:if test="${ now eq msg.date }">
												${ ch.time }
											</c:if>
											<c:if test="${ now ne msg.date }">
												${ ch.date }
											</c:if>
	                                	</div>
                                	</div>
	                    		</div>
	                    	</c:if>
	                    </c:forEach>
                    </div>
                    <div class="card-footer chat-form">
<!--                         <form id="chat-form2"> -->
                            <input type="text" id="msg" class="form-control" placeholder="메시지를 입력하세요">
                            <button class="btn btn-primary" id="button-send">
                                <i class="far fa-paper-plane"></i>
                            </button>
<!--                         </form> -->
                    </div>
                </div>
            </div>
        </section>
    </div>
    
    <script type="text/javascript">
		var sock = new SockJS("http://localhost:8081/worktech/chat");
		
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		sock.onopen = onOpen;
	
		function sendMessage() {
			// 내 메시지 서버로 보내기
			var message = $("#msg").val();
			
			var data = {
					"msgContent" : message,
					"chatRoomNo" : "${ cr.chatRoomNo }",
	                "sendMember" : "${ loginUser.mNo }"
	            };
			
	        var jsonData = JSON.stringify(data);
	        
	        // 메시지 추가
	        var chatMsgBody = $('#chatMsgBody');
	        var innerDiv = '';
	        
	        innerDiv += '<div class="chat-item chat-right">';
	        
	        if("${ loginUser.pUrl }" != '' && "${ loginUser.pUrl }" != null ){
	        	innerDiv += '<img src="' + ${ loginUser.pUrl } + '">';	
	        	console.log('${ loginUser.pUrl }');
	        } else {
	        	innerDiv += '<img src="resources/dist/assets/img/avatar/avatar-1.png">';
	        }
	        
	        // 현재 시간 구하기
	        var today = new Date();   

	        var hours = today.getHours(); // 시
	        var minutes = today.getMinutes();  // 분
	        
	        var now = hours + ":" + minutes;
	        
	        innerDiv += '<div class="chat-details">'
	        			+ '<div class="chat-text">' + message + '</div>'
	        			+ '<div class="chat-time">' + now + '</div></div></div>';
	        
	        chatMsgBody.append(innerDiv);
	        
	        sock.send(jsonData);
		}
		
		//서버에서 메시지를 받았을 때
		function onMessage(msg) {
			
			console.log(msg);
			
			var data = msg.data;
			var sessionId = null; //데이터를 보낸 사람
			var message = null;
			
			var arr = data.split(":");
			
			for(var i=0; i<arr.length; i++){
				console.log('arr[' + i + ']: ' + arr[i]);
			}
			
			var cur_session = '${userid}'; //현재 세션에 로그인 한 사람
			console.log("cur_session : " + cur_session);
			
			sessionId = arr[0];
			message = arr[1];
			
		    //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
			if(sessionId == cur_session){
				
				var str = "<div class='col-6'>";
				str += "<div class='alert alert-secondary'>";
				str += "<b>" + sessionId + " : " + message + "</b>";
				str += "</div></div>";
				
				$("#msgArea").append(str);
			}
			else{
				
				var str = "<div class='col-6'>";
				str += "<div class='alert alert-warning'>";
				str += "<b>" + sessionId + " : " + message + "</b>";
				str += "</div></div>";
				
				$("#msgArea").append(str);
			}
			
		}
		//채팅창에서 나갔을 때
		function onClose(evt) {
			
			var user = '${pr.username}';
			var str = user + " 님이 퇴장하셨습니다.";
			
			$("#msgArea").append(str);
		}
		//채팅창에 들어왔을 때
		function onOpen(evt) {
			
			var user = '${loginUser.name}';
			var str = user + "님이 입장하셨습니다.";
			
			$("#msgArea").append(str);
		}
	
		
		$('#button-send').on('click', function(e) {
			sendMessage();
			$('#msg').val('');
		});
	</script>

    <!-- General JS Scripts -->
    <script src="resources/dist/assets/modules/jquery.min.js"></script>
    <script src="resources/dist/assets/modules/bootstrap/js/bootstrap.min.js"></script>
    <script src="resources/dist/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
<!--     <script src="resources/dist/assets/js/stisla.js"></script> -->

    <!-- JS Libraies -->

    <!-- Page Specific JS File -->
<!--     <script src="resources/dist/assets/js/page/components-chat-box.js"></script> -->

    <!-- Template JS File -->
    <script src="resources/dist/assets/js/scripts.js"></script>
    <script src="resources/dist/assets/js/custom.js"></script>
</body>
</html>