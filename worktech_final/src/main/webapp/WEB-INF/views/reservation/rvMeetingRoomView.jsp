<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<title>회의실 예약</title>

<!-- General CSS Files -->
<link rel="stylesheet" href="resources/dist/assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/dist/assets/modules/fontawesome/css/all.min.css">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

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
			slotMinTime : "07:00:00", // 시작 시간
			slotMaxTime: "19:30:00", // 종료 시간
			hiddenDays: [0, 6], // 주말 숨기기
			allDaySlot: false, // 종일 제거
			customButtons: {
				myCustomButton: {
					text: '예약 추가',
					click: function() {
						window.open('insertRvMeetingRoom.rv', '회의실 예약', 'width=500px, height=550px, resizable=no, toolbar=1');
			        }
				}
			},
			events : [ {
				groupId : 999,
				title : 'Repeating Event',
				start : '2022-01-10T16:00:00'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2022-01-10-16T17:00:00'
			}, {
				title : 'Meeting',
				start : '2022-01-12T10:30:00',
				end : '2022-01-12T12:30:00'
			}, {
				title : 'Click for Google',
				url : 'http://google.com/',
				start : '2022-01-13T10:30:00',
				end : '2022-01-13T12:30:00'
			} ]
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
	
	.fc .fc-view > table {
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