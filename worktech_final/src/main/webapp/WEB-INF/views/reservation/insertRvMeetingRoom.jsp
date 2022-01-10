<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>회의실 예약</title>
<link rel="stylesheet" href="resources/dist/assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/dist/assets/modules/fontawesome/css/all.min.css">
<link rel="stylesheet" href="resources/dist/assets/css/style.css">
<link rel="stylesheet" href="resources/dist/assets/css/components.css">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<style>
	body{
		background-color: white;
	}

	.content{
		margin: 0 auto;
		margin-top: 35px; 
		width: 400px;
		border: 1px solid #e3e3e3;
	}
	.title{
		margin-top: 8%;
		margin-left: 5%;
	}
	.table{
		margin-top: 40px;
		margin-left: 20px;
	}
	.table td{
		height: 40px;
		padding: 10px !important;
		font-size: 14px;
		
	}

	.btn_class{
		text-align: center;
		margin-bottom: 20px;
	}
	
	.first{
		width: 90px;
		font-weight: bold;
	}
	
	.tableDiv{
		text-align: center;
	}
</style>
</head>
<body>
	<div class="content">
		<div class="title">
			<h5>회의실 예약</h5>
		</div>
		<form action="rvMeetingRoomInsert.rv" method="post">
			<div class="tableDiv">
				<table class="table">
					<tr>
						<td class="first">자원명</td>
						<td>
							<select name="resources" style="width: 220px; border: 1px solid #e3e3e3;" disabled>
								<option selected>회의실</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="first">날짜</td>
						<td><input id="rvDate" type="date" style="width: 220px; border: 1px solid #e3e3e3;"></td>
					</tr>
					<tr>
						<td class="first">예약 시간</td>
						<td>
							<select id="rvStartTime" name="rvStartTime" style="width: 100px; border: 1px solid #e3e3e3;">
								<c:set var="breakPoint" value="0" />
								<c:forEach var="i" begin="7" end="19">
								    <c:forEach var="j" begin="0" end="1">
								        <c:if test="${(i == 19) && (j == 1)}">    
								            <c:set var="breakPoint" value="1" />                                    
								        </c:if>
								        <c:if test="${breakPoint == 0}">    
								            <option value="${i}:<fmt:formatNumber pattern="00" value="${j*30}" />">${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></option>                                                                            
								        </c:if>
								    </c:forEach>
								</c:forEach>
							</select> ~
							<select id="rvEndTime" name="rvEndTime" style="width: 100px; border: 1px solid #e3e3e3;">
								<c:forEach var="i" begin="7" end="19">
								    <c:forEach var="j" begin="0" end="1">
								    	<option value="${i}:<fmt:formatNumber pattern="00" value="${j*30}" />">${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></option>                                                                            
								    </c:forEach>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td valign="top" style="height: 130px; padding-top: 20px;"  class="first">사용 용도</td>
						<td valign="top" style="padding-top: 20px;">
							<textarea style="width: 220px; height: 100px; border: 1px solid #e3e3e3; resize: none;">사용 인원(또는 부서) : 
사용 목적 : </textarea>
						</td>
					</tr>
				</table>
			</div>
			<div class="btn_class">
				 <button class="btn btn-primary mr-1" type="button" onclick="return addMeetingRoom();">예약</button>
				 <input class="btn btn-danger mr-1" type="button" value="취소" onclick="close()">
			</div>
		</form>
	</div>
	
	<script>
		document.getElementById('rvDate').value = new Date().toISOString().substring(0, 10);
		
		function close() {
			window.close();
		}
		
		function addMeetingRoom() {
			var startTime = $("#rvStartTime").val();
			var endTime = $("#rvEndTime").val();
			
			if(startTime == endTime){
				
			}
			
			console.log(startTime);
			console.log(endTime);
			
			return false;
		}
		
	</script>
</body>
</html>