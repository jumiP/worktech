<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기타 예약</title>

	<!-- timepicker -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">


	<script src="resources/js/jquery-3.6.0.min.js"></script>
<style>
	.content{
		margin: 0 auto;
		display: table;
		margin-left: auto;
		margin-top: 40px; 
		argin-right: auto;
		width: 400px;
		border: 1px solid #e3e3e3;
	}
	.title{
		/* margin-top: 8%; */
		margin-left: 10%;
	}
	.table{
		margin-top: 10px;
		margin-left: 10%;
		margin-bottom: 20px;
	}
	.table td{
		height: 40px;
		font-size: 14px;
		/* border: 1px solid #e3e3e3;  */
		
	}
	
	.timepicker:hover{
		cursor: pointer;
		}
		
	.timepicker{
		text-align: center;
		}

	button{
		background-color: #e3e3e3;
		border: none;
		margin-left: 20px;
		margin-top: 10px;
		width: 80px;
		height: 40px;
		border-radius: 5px;
		margin-bottom: 10%;
	}
	button:hover{
		cursor: pointer;
	}
	.btn_class{
		margin-left: 23%;
	}
	.first{
		width: 90px;
		font-weight: bold;
	}
	#inputArea {
			display: none;
		}
</style>
</head>
<body>
<div class="content">
		<div class="title">
			<h3>기타 예약</h3>
		</div>
		<form method="post" name="rvForm">
			<table class="table">
				<tr>
					<td class="first">자원명</td>
					<td>
						<select id="rvName" name="rvName" style="width: 188px; border: 1px solid #e3e3e3;">
							<!-- <option>자원명</option> -->
							<option value="${ rv.pdName }">${ rv.pdName }</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="first">수량</td>
					<td>
						<input type="number" name="rvCount" style="width: 180px; border: 1px solid #e3e3e3;" min="1" max="${ rv.pdCount }" value="1">
					</td>
				</tr>
				<tr>
					<td class="first">날짜</td>
					<td><input type="date" id="rvDate" name="rvDate" style="border: 1px solid #e3e3e3;"></td>
				</tr>
				<tr>
					<td class="first">예약 시간</td>
					<td>
						<input type="text" class="timepicker" name="startTime" id="rvStartTime" style="width: 100px; border: 1px solid #e3e3e3;" readonly="readonly">
								~
						<input type="text" class="timepicker" name="endTime" id="rvEndTime" style="width: 100px; border: 1px solid #e3e3e3;" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td valign="top" style="height: 130px; padding-top: 20px;"  class="first">사용 용도</td>
					<td valign="top" style="padding-top: 20px;">
						<textarea name="rvUsage" style="width: 220px; height: 100px; border: 1px solid #e3e3e3; resize: none;"></textarea>
					</td>
				</tr>
			</table>
			<div id="inputArea">
					<input type="hidden" name="rvType" value="ETC">
					<input type="hidden" name="rvpNo" value="${ rv.pdNo }">
					<input type="hidden" name="rvCategory" value="${ rv.pdCategory }">
				</div>
			<div class="btn_class">
				<button type="submit" onclick="return addOtherReservation();">예약</button><button onclick="window.close();">취소</button>
			</div>
		</form>
	</div>
	
	<script>
		document.getElementById('rvDate').value = new Date().toISOString().substring(0, 10);
	
		function checkDupTime(rvStartTime, rvEndTime) {
			
			$.ajax({
				url: 'checkTime2.rv',
				async: false,
				data: {rvStartTime:rvStartTime, rvEndTime:rvEndTime},
				success: function(data) {
					if(data == 0){
						$('#rvName').prop('disabled', false);
						
						document.rvForm.target = "rvView";
						document.rvForm.action = "otherReservationInsert.rv";
						document.rvForm.method = "POST";
						document.rvForm.submit();
						
						self.close();
					}  
				},
				error: function(data) {
					console.log("error : " + data);
				}
			});
			
			return checkDup;
		}
		
		function addOtherReservation(){
			var startTime = $('#rvStartTime').val();
			var endTime = $('#rvEndTime').val();
			var rvDate = $('#rvDate').val();
			
			// 현재 시간
			var now = new Date();
			var year = now.getFullYear();
			var month = now.getMonth();
			var day = now.getDate();
			var hours = now.getHours();
			var minutes = now.getMinutes();
			
			var today = new Date(year, month, day, hours, minutes);
			
			
			
			if(startTime == '' || endTime == ''){
				alert('예약 시간을 확인해 주세요.');
				return false;
			} else if(startTime == endTime){
				alert("예약 시작 시간과 종료 시간은 동일할 수 없습니다.");
				return false;
			} else{
				// 날짜 합치기
				var rvStartTime = new Date(rvDate + " " + startTime);
				var rvEndTime = new Date(rvDate + " " + endTime);
				
				if(rvStartTime.getTime() > rvEndTime.getTime()){
					alert("예약 종료 시간이 시작 시간보다 빠를 수 없습니다.");
					return false;
				}else if(today.getTime() > rvStartTime.getTime()){
					alert("현재 시간보다 이전 시간으로 예약할 수 없습니다.");
					return false;
				} else {
					checkDupTime(rvStartTime, rvEndTime);
				}
			
			}
		}
		
		$(function() {
		    $(".timepicker").timepicker({
		        timeFormat: 'HH:mm',
		        interval: 30,
		        minTime: '9',
		        maxTime: '19:00',
		        dynamic: false,
		        dropdown: true,
		        scrollbar: true       
		    });
		})
	</script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>