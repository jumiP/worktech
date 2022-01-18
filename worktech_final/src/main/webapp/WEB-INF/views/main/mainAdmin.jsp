<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
table {
	text-align: center;
}
</style>
<head>

<meta charset="UTF-8">
<title>main</title>

<style>
.memCard {
	display: flex;
	height: 150px;
}

#memImg {
	width: 90px;
}

.memItem {
	flex-basis: 33%;
	align-self: center;
}

#comTable {
	width: 100%;
	text-align: center;
}

#comTable td {
	border: none;
}

.comBtn {
	margin-right: 10%;
}

#tableCard {
	height: 330px;
}

.boardTable {
	width: 100%;
	border-collapse: collapse;
	background: white;
}

.boardTable th, td {
	border-bottom: 1px solid #e3e3e3;
	vertical-align: middle;
	text-align: center;
	font-size: 13px;
	height: 40px;
}

.boardTable th {
	border-bottom: none;
	background-color: rgba(0, 0, 0, 0.04);
	color: #666;
}

.boardBtn {
	border: none;
	border-bottom: 1px solid #e3e3e3;
	background: none;
}

.boardBtn:focus {
	outline: none;
}

.boardBtn:hover {
	cursor: pointer;
}

#searchIcon {
	padding: 15px;
}

#searchItem {
	margin-top: 12px;
}
</style>

</head>

<body>
	<c:import url="common/headerAdmin.jsp" />
	<!-- Main Content -->
	<div class="main-content">
	<section class="section">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body" id="tableCard">
						<div>
							<h5>
								총 사원의 수는 <span style="color: #6ED7F9">${ memCount }</span>명 입니다.
							</h5>
						</div>
						<br>
						<div id="memberBoard">
							<table class="table table-striped" id="memberTable">
								<thead>
									<tr>
										<th width="30px;"></th>
										<th>사원 번호</th>
										<th>사원 명</th>
										<th>부서</th>
										<th>직급</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<c:import url="common/footer.jsp" />

<script>
	function getMemList() {
		
		$.ajax({
			url: 'mListMain.me',
			success: function(data) {
				console.log(data);
				
// 				$tableBody = $('#memberTable tbody');
// 				$tableBody.html(''); // 위에 있던 부분이 중복되지 않게 지워줌
				
// 				var $tr;
// 				var $writer;
// 				var $content;
// 				var $date;
				
// 				$('#rCount').text('댓글 (' + data.length + ")");
				
// 				if(data.length > 0){
// 					for(var i in data){
// 						$tr = $('<tr>');
// 						$writer = $('<td width="100">').text(data[i].nickName);
// 						$content = $('<td>').text(data[i].replyContent);
// 						$date = $('<td width="100">').text(data[i].replyCreateDate);
						
// 						$tr.append($writer);
// 						$tr.append($content);
// 						$tr.append($date);
						
// 						$tableBody.append($tr);
// 					}
// 				}else{
// 						$tr = $('<tr>');
// 						$content = $('<td colspan="5">').text("사원이 존재하지 않습니다.");
						
// 						$tr.append($content);
// 						$tableBody.append($tr);
// 				}
			},
			error: function(request, error) {
				console.log(request.status);
				console.log(request.responseText);
				console.log(error);
			}
		})
	}

	$(function() {
		getMemList();
	});

</script>
</body>

</html>