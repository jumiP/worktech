<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <!-- Start GA -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="resources/js/jquery-3.6.0.min.js"></script>
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
    </style>
</head>

<body>
    <div class="main-content">
        <section class="section">
            <div class="col-12 col-sm-6 col-lg-4">
                <div class="card chat-box" id="mychatbox">
                    <div class="card-header">
                        <h4>OOO 대리</h4>
                    </div>
                    <div id="msgArea">
	                    <div class="card-body chat-content" tabindex="1" style="overflow: hidden; outline: none;">
	                        <div class="chat-item chat-left"><img src="assets/img/avatar/avatar-1.png">
	                            <div class="chat-details">
	                                <div class="chat-text">오늘 몇 시에 회의인가요?</div>
	                                <div class="chat-time">09:11</div>
	                            </div>
	                        </div>
	                        <div class="chat-item chat-left"><img src="assets/img/avatar/avatar-1.png">
	                            <div class="chat-details">
	                                <div class="chat-text">답장 바랍니다</div>
	                                <div class="chat-time">09:14</div>
	                            </div>
	                        </div>
	                        <div class="chat-item chat-right"><img src="assets/img/avatar/avatar-2.png">
	                            <div class="chat-details">
	                                <div class="chat-text">6시 회의입니다</div>
	                                <div class="chat-time">09:15</div>
	                            </div>
	                        </div>
	                        <div class="chat-item chat-left"><img src="assets/img/avatar/avatar-1.png">
	                            <div class="chat-details">
	                                <div class="chat-text">감사합니다</div>
	                                <div class="chat-time">09:16</div>
	                            </div>
	                        </div>
	                        <div class="chat-item chat-right"><img src="assets/img/avatar/avatar-2.png">
	                            <div class="chat-details">
	                                <div class="chat-text">늦지 않게 오세요</div>
	                                <div class="chat-time">09:16</div>
	                            </div>
	                        </div>
	                     </div>
                        <div class="chat-item chat-left chat-typing"><img src="assets/img/avatar/avatar-1.png">
                            <div class="chat-details">
                                <div class="chat-text"></div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer chat-form">
                        <form id="chat-form2">
                            <input type="text" id="msg" class="form-control" placeholder="Type a message">
                            <button class="btn btn-primary" id="button-send">
                                <i class="far fa-paper-plane"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
    <script>
	  //전송 버튼 누르는 이벤트
	  $(function() {
	    $("#button-send").on("click", function(e) {
	    	sendMessage();
	    	$('#msg').val('')
	    });
	  });
	  
	    var sock = new SockJS('http://localhost:8080/chatting');
	    sock.onmessage = onMessage;
	    sock.onclose = onClose;
	    sock.onopen = onOpen;
	
	    function sendMessage() {
	    	sock.send($("#msg").val());
	    }
	    
	    //서버에서 메시지를 받았을 때
	    function onMessage(msg) {
	    	
	    	var data = msg.data;
	    	var sessionId = null; //데이터를 보낸 사람
	    	var message = null;
	    	
	    	var arr = data.split(":");
	    	
	    	for(var i=0; i<arr.length; i++){
	    		console.log('arr[' + i + ']: ' + arr[i]);
	    	}
	    	
	    	var cur_session = '${mNo}'; //현재 세션에 로그인 한 사람
	    	console.log("cur_session : " + cur_session);
	    	
	    	sessionId = arr[0];
	    	message = arr[1];
	    	
	        //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
	    	if(sessionId == cur_session){
	    		
	    		var str = "<div class='chat-item chat-right'><img src='assets/img/avatar/avatar-2.png'>";
	    		str += "<div class='chat-details'>";
	    		str += "<div class='chat-text'>" + " : " + message + "</div>";
	    		str += "<div class='chat-time'>09:15</div>";
	    		str += "</div></div>";
	    		
	    		$("#msgArea").append(str);
	    	}
	    	else{
	    		
	    		var str = "<div class='chat-item chat-left'><img src='assets/img/avatar/avatar-2.png'>";
	    		str += "<div class='chat-details'>" + sessionId;
	    		str += "<div class='chat-text'>" + " : " + message + "</div>";
	    		str += "<div class='chat-time'>09:15</div>";
	    		str += "</div></div>";
	    		
	    		$("#msgArea").append(str);
	    	}
	    	
	    }
	    //채팅창에서 나갔을 때
	    function onClose(evt) {
	    	
	    	var user = '${cl.name}';
	    	var str = user + " 님이 퇴장하셨습니다.";
	    	
	    	$("#msgArea").append(str);
	    }
	    //채팅창에 들어왔을 때
	    function onOpen(evt) {
	    	
	    	var user = '${cl.name}';
	    	var str = user + "님이 입장하셨습니다.";
	    	
	    	$("#msgArea").append(str);
	    }
    </script>

	<!-- General JS Scripts -->
	<script src="resources/dist/assets/modules/jquery.min.js"></script>
	<script src="resources/dist/assets/modules/popper.js"></script>
	<script src="resources/dist/assets/modules/tooltip.js"></script>
	<script src="resources/dist/assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/dist/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="resources/dist/assets/modules/moment.min.js"></script>
	<script src="resources/dist/assets/js/stisla.js"></script>
		  
	<!-- JS Libraies -->
		
	<!-- Page Specific JS File -->
	<script src="resources/dist/assets/js/page/components-chat-box.js"></script>
		  
	<!-- Template JS File -->
	<script src="resources/dist/assets/js/scripts.js"></script>
	<script src="resources/dist/assets/js/custom.js"></script>
</body>
</html>