<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
	name="viewport">
<title>회의실 예약</title>

<!-- General CSS Files -->
<link rel="stylesheet"
	href="resources/dist/assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/dist/assets/modules/fontawesome/css/all.min.css">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">

<!-- Template CSS -->
<link rel="stylesheet" href="resources/dist/assets/css/style.css">
<link rel="stylesheet" href="resources/dist/assets/css/components.css">
<link href='resources/fullcalendar/lib/main.css' rel='stylesheet' />
<script src='resources/fullcalendar/lib/main.js'></script>
<script src="resources/fullcalendar/lib/locales-all.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialDate : new Date(),
			initialView : 'timeGridWeek',
			nowIndicator : true,
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'timeGridWeek,listWeek myCustomButton'
			},
			locale: "ko",
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			selectable : true,
			selectMirror : true,
			dayMaxEvents : true, // allow "more" link when too many events
			slotMinTime : "09:00:00", // 시작 시간
			slotMaxTime: "19:00:00", // 종료 시간
			hiddenDays: [0, 6], // 주말 숨기기
			allDaySlot: false, // 종일 제거
			customButtons: {
				myCustomButton: {
					text: '예약 추가',
					click: function() {
						window.name = 'rvView';
						window.open('insertGenRvMeetingRoom.rv', '회의실 예약', 'width=500px, height=550px, resizable=no, toolbar=1');
			        }
				}
			},
			events:function(info, successCallback, failureCallback){
	            $.ajax({
	                   url: 'getrvMeetingRoomList.rv',
	                   dataType: 'json',
	                   success: function(data) {
	                	   var events = [];
	                	   
	                	   // 현재 시간
	                	   var now = new Date();
						   var year = now.getFullYear();
						   var month = now.getMonth();
						   var day = now.getDate();
						   var hours = now.getHours();
						   var minutes = now.getMinutes();
							
						   var today = new Date(year, month, day, hours, minutes);
	                	   
						   
	                	   if(data != null){ 
	                		   $.each(data, function(index, element) {
								   var rvStartTime = new Date(element.rvStartTime);
								   var rvEndTime = new Date(element.rvEndTime);
									
								   if (today >= rvEndTime){
										events.push({
										       title: element.rvMemberFullName,
										       start: rvStartTime,
										       end: rvEndTime,
										       url: "meetRoomRvDetail.rv?rvNo="+element.rvNo,
										       color:"#ff827b"                                                   
										    }); 
										}
								   else{
										events.push({
											   title: element.rvMemberFullName,
										       start: rvStartTime,
										       end: rvEndTime,
										       url: "meetRoomRvDetail.rv?rvNo="+element.rvNo,
										       color:"#67d4ef"                                                   
										    }); 
	                                    }
	                               }); 
	                               console.log(events);
	                           }                        
	                          successCallback(events);                               
	                       }                     
	            }); 
	        }, 
		});

		calendar.render();
	});
</script>
<style>
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 14px;
	}
	
	#calendar {
		max-width: 1100px;
		height: 585px;
		margin: 0 auto;
	}
	
	.fc .fc-myCustomButton-button {
		background: #67d4ef;
		border: 1px solid #67d4ef;
		font-weight: 900;
	}
	
	.fc .fc-myCustomButton-button:hover {
		background: #00b9e7;
		border: 1px solid #67d4ef;
		font-weight: 900;
	}
	
	.fc .fc-view>table {
		border: 1px solid #ddd;
	}
</style>
</head>
<body>
	<c:import url="../common/headerUser.jsp" />
	<div class="main-content">
		<section class="section">
			<div class="section-header">
				<h1>예약 자산 추가</h1>
				<div class="section-header-breadcrumb">
					<div class="breadcrumb-item active">
						<a href="#">예약</a>
					</div>
					<div class="breadcrumb-item">회의실 예약</div>
				</div>
			</div>
			<div class="section-body">
				<h2 class="section-title">회의실 예약</h2>
				<div class="row">
					<div class="col-12 col-md-12 col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="card">
									<div class="card-body">
										<div id='calendar'></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>