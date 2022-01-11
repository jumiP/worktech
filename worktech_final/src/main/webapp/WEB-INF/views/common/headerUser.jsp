<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>관리자 예약 자산 관리</title>

    <!-- General CSS Files -->
    <link rel="stylesheet" href="resources/dist/assets/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/dist/assets/modules/fontawesome/css/all.min.css">

    <!-- CSS Libraries -->

    <!-- Template CSS -->
    <link rel="stylesheet" href="resources/dist/assets/css/style.css">
    <link rel="stylesheet" href="resources/dist/assets/css/components.css">
    
    <!-- jstree -->
<!-- 	<link rel="stylesheet" href="resources/dist/themes/default/style.min.css" /> -->
    
    <!-- Start GA -->
    <script async="async" src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
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
    
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
</head>
<style>
	.dropdown-item-icon{
		display: flex;
        justify-content: center;
	}
	
	.alarmIcon{
 		align-self: center;
		font-size: 18px;
	}
</style>
<body>
    <div id="app">
        <div class="main-wrapper main-wrapper-1">
            <div class="navbar-bg"></div>
            <nav class="navbar navbar-expand-lg main-navbar">
                <form class="form-inline mr-auto" id="searchItem">
                    <ul class="navbar-nav mr-3">
                        <li>
                            <a href="#" data-toggle="sidebar" class="nav-link nav-link-lg">
                                <i class="fas fa-bars"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none">
                                <i class="fas fa-search"></i>
                            </a>
                        </li>
                    </ul>
                    <div class="search-element">
                        <input class="form-control" type="search" placeholder="Search" aria-label="Search"
                            data-width="250">
                        <button class="btn" type="submit" id="searchIcon">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>
                <ul class="navbar-nav navbar-right">
                    <li>
                        <a href="#" class="nav-link nav-link-lg message-toggle">
                            <i class="far fa-envelope"></i>
                        </a> <!-- href에 메일 url 삽입 -->
                    </li>
                    <li class="dropdown dropdown-list-toggle">
                        <a href="#" data-toggle="dropdown" class="nav-link notification-toggle nav-link-lg beep">
                            <i class="far fa-bell"></i>
                        </a>
                        <div class="dropdown-menu dropdown-list dropdown-menu-right">
                            <div class="dropdown-header">Notifications
                                <div class="float-right">
                                    <a href="#">5개</a>
                                </div>
                            </div>
							<div class="dropdown-list-content dropdown-list-icons" id="notiDiv">
<!-- 								<a href="#" class="dropdown-item dropdown-item-unread"> -->
<!-- 									<div class="dropdown-item-icon bg-primary text-white"> -->
<!-- 										<i class="far fa-calendar-alt alarmIcon"></i> -->
<!-- 									</div> -->
<!-- 									<div class="dropdown-item-desc"> -->
<!-- 										캘린더 알림 -->
<!-- 										<div class="time text-primary">2 Min Ago</div> -->
<!-- 									</div> -->
<!-- 								</a> -->
<!-- 								<a href="#" class="dropdown-item"> -->
<!-- 									<div class="dropdown-item-icon bg-info text-white"> -->
<!-- 										<i class="fas fa-clipboard-list alarmIcon"></i> -->
<!-- 									</div> -->
<!-- 									<div class="dropdown-item-desc"> -->
<!-- 										게시판 알림 -->
<!-- 										<div class="time">10 Hours Ago</div> -->
<!-- 									</div> -->
<!-- 								</a> -->
<!-- 								<a href="#" class="dropdown-item"> -->
<!-- 									<div class="dropdown-item-icon bg-success text-white"> -->
<!-- 										<i class="fas fa-user-friends alarmIcon"></i> -->
<!-- 									</div> -->
<!-- 									<div class="dropdown-item-desc"> -->
<!-- 										전자결재 알림 -->
<!-- 										<div class="time">12 Hours Ago</div> -->
<!-- 									</div> -->
<!-- 								</a> -->
							</div>
							<div class="dropdown-footer text-center">
                            </div>
                        </div>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                            <img alt="image" src="resources/dist/assets/img/avatar/avatar-1.png" class="rounded-circle mr-1">
                            <div class="d-sm-none d-lg-inline-block">${ loginUser.name } ${ loginUser.jobGrade }</div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <div class="dropdown-title">${ loginUser.name } 님 환영합니다!</div>
                            <a href="features-profile.html" class="dropdown-item has-icon">
                                <i class="far fa-user"></i>
                                마이 페이지
                            </a>
                            <a href="features-activities.html" class="dropdown-item has-icon">
                                <i class="fas fa-bolt"></i>
                                전자결재
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="logout.me" class="dropdown-item has-icon text-danger">
                                <i class="fas fa-sign-out-alt"></i>
                                Logout
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>
            <div class="main-sidebar sidebar-style-2">
                <aside id="sidebar-wrapper">
                    <div class="sidebar-brand">
                        <a href="home.do"><img src="resources/dist/assets/img/logo.png" width="60%" height="auto"></a>
                    </div>
                    <div class="sidebar-brand sidebar-brand-sm">
                        <a href="home.do"><img src="resources/dist/assets/img/logo_small.png" width="45%" height="auto" style="padding-top: 30%;"></a>
                    </div>
                    <ul class="sidebar-menu">
                        <li class="menu-header">User Menu</li>
                        <li class="dropdown">
                            <a href="#" class="nav-link has-dropdown">
                                <i class="fas fa-user-friends"></i>
                                <span>전자 결재</span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="nav-link" href="bootstrap-breadcrumb.html">새 결재 진행</a>
                                    </li>
                                    <li>
                                        <a class="nav-link" href="bootstrap-alert.html">결재 대기함</a>
                                    </li>
                                    <li>
                                        <a class="nav-link" href="bootstrap-badge.html">결재 진행함</a>
                                    </li>
                                    <li>
                                        <a class="nav-link" href="bootstrap-badge.html">완료 문서함</a>
                                    </li>
                                </ul>
                        </li>
                        <li>
                            <a class="nav-link" href="blank.html">
                                <i class="fas fa-clock"></i>
                                <span>근태 관리</span></a>
                        </li>
                        <li class="dropdown">
                            <a href="alllist.mail" class="nav-link">
                                <i class="fas fa-envelope-open-text"></i>
                                <span>메일</span></a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link has-dropdown">
                                <i class="fas fa-th"></i>
                                <span>주소록</span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="nav-link" href="adbookList.ab">사내 주소록</a>
                                    </li>
                                    <li>
                                        <a class="nav-link" href="pAdbookList.ab">개인 주소록</a>
                                    </li>
                                </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link has-dropdown">
                                <i class="fas fa-history"></i>
                                <span>예약</span></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="nav-link" href="rvMeetingRoomView.rv">회의실 예약</a>
                                </li>
                                <li class="dropdown">
                                    <a class="nav-link has-dropdown" href="components-avatar.html">
                                        <span>기타 예약</span></a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a class="nav-link" href="components-article.html">나의 예약 목록</a>
                                            </li>
                                            <li>
                                                <a class="nav-link" href="components-avatar.html">기타 예약 목록</a>
                                            </li>
                                        </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link has-dropdown">
                                <i class="fas fa-align-justify"></i>
                                <span>게시판</span></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="nav-link" href="noticeList.ad">공지사항 게시판</a>
                                </li>
                                <li>
                                    <a class="nav-link" href="commonList.bo">일반 게시판</a>
                                </li>
                                <li>
                                    <a class="nav-link" href="components-chat-box.html">익명 게시판</a>
                                </li>
                                <li>
                                    <a class="nav-link" href="components-chat-box.html">화상 회의</a>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link has-dropdown">
                                <i class="fas fa-th"></i>
                                <span>캘린더</span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="nav-link" href="myCal.cr">개인 캘린더</a>
                                    </li>
                                    <li>
                                        <a class="nav-link" href="teamCal.cr">팀 캘린더</a>
                                    </li>
                                </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link">
                                <i class="fas fa-user-lock"></i>
                                <span>마이 페이지</span></a>
                        </li>
                    </ul>

                    <div class="mt-4 mb-4 p-3 hide-sidebar-mini">
                        <a href="#" onclick="chatOpen();" class="btn btn-primary btn-lg btn-block btn-icon-split">
                            <i class="fas fa-comments"></i>
                            CHAT
                        </a>
                    </div>
                </aside>
            </div>
            </div>
            </div>

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

    <!-- Template JS File -->
    <script src="resources/dist/assets/js/scripts.js"></script>
    <script src="resources/dist/assets/js/custom.js"></script>
    
    <!-- jstree -->
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script> -->
<!-- 	<script src="resources/dist/jstree.min.js"></script> -->


	
	<script>
		function chatOpen() {
			window.open('chatView.ct', '채팅', 'width=500px, height=600px, resizable=no, toolbar=1');
		}
		
		$(document).ready(function(){
			connectWs();
			alarmList();
		});
	
		// 실시간 알림을 위한 웹소켓
		var socket = null;
		
		function connectWs() {
			// SockJS 라이브러리를 이용하여 서버에 연결
			var sock = new SockJS('http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/alarm');
			socket = sock;

			// 이벤트 리스터(커넥션이 연결되었을 때 서버 호출된다)
			sock.onopen = function() {
				console.log('info: connection opened.');
			}
			
			// 서버에 메시지를 보내주며 함수가 호출된다.
			// 메세지를 보냈을 때 호출
			sock.onmessage = function(evt){
				console.log('info: connection onmessage');
				var data = evt.data;
				
				const arr = data.split(",");
				
				var today = new Date();
				var month = ('0' + (today.getMonth() + 1)).slice(-2);
				var day = ('0' + today.getDate()).slice(-2);
				var hours = ('0' + today.getHours()).slice(-2);
				var minutes = ('0' + today.getMinutes()).slice(-2);
				
				var $a = $('<a class="dropdown-item">');
				var $icon = $('<div class="dropdown-item-icon bg-info text-white"><i class="fas fa-clipboard-list alarmIcon"></i>');
				var $desc = $('<div class="dropdown-item-desc">')
							.html(arr[1] + " 님이 " + "<a href='cdetail.bo?bNo=" + arr[3] + "'>[" + arr[4] + "]</a> 게시글에 댓글을 남겼습니다.");
				var $time = $('<div class="time">')
							.html(month + "월 " + day + "일 " + hours + ":" + minutes);
				
				$desc.append($time);
				$a.append($icon);
				$a.append($desc);
				
				$($a).prependTo('#notiDiv');
			}
			
			// 서버가 끊겼을 때 호출
			sock.onclose = function(){
				console.log('info: connect close');
			};
			
			// 에러가 발생했을 때 호출
			sock.onerror = function(err){
				console.log('Errors : ', err);
			}
		}
		
		function alarmList() {
			var mNo = '${ loginUser.mNo }';
			
			$.ajax({
				url: 'alarmList.al',
				data: {mNo:mNo},
				dataType: 'json',
				success: function(data){
					for(var i in data){
						var $a = $('<a class="dropdown-item">');
						var $icon = $('<div class="dropdown-item-icon bg-info text-white"><i class="fas fa-clipboard-list alarmIcon"></i>');
						var $desc = $('<div class="dropdown-item-desc">')
									.html(data[i].senderName + " 님이 " + "<a href='cdetail.bo?bNo=" + data[i].bNo + "'>[" + data[i].bTitle + "]</a> 게시글에 댓글을 남겼습니다.");
						var $time = $('<div class="time">').html(data[i].alarmDate);
						
						$desc.append($time);
						$a.append($icon);
						$a.append($desc);
						
						$($a).appendTo('#notiDiv');
					}
				},
				error: function(data){
					console.log(data);
				}
			});
		}
		
	</script>
</body>

</html>