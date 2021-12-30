<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>관리자 예약 자산 추가</title>
	<style>
		.section-header{
			padding: 20px, 35px;
			margin: -10px, -30px, 30px;
		}
	</style>
</head>

<body>
	<c:import url="../common/headerAdmin.jsp" />
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<div class="section-header">
				<h1>예약 자산 추가</h1>
				<div class="section-header-breadcrumb">
					<div class="breadcrumb-item active">
						<a href="#">예약 관리</a>
					</div>
					<div class="breadcrumb-item">예약 자산 추가</div>
				</div>
			</div>

			<div class="section-body">
				<h2 class="section-title">예약 자산 추가</h2>
				<div class="row">
					<div class="col-12 col-md-12 col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="form-group">
									<label>예약 자산 카테고리</label> <input type="text" class="form-control" required>
								</div>
								<div class="form-group">
									<label>예약 자산명</label> <input type="text" class="form-control" required>
								</div>
								<div class="form-group">
									<label>추가 일자</label> <input type="date" class="form-control" id="addDate" required>
								</div>
								<div class="form-group">
									<label class="d-block">사용 범위</label>
									<c:set var="i" value="1"/>
									<c:forEach var="d" items="${ list }">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="defaultCheck${ i }" name="department">
											<label class="form-check-label" for="defaultCheck${ i }">${ d.dName }</label>
										</div>
										<c:set var="i" value="${ i + 1 }"/>
									</c:forEach>
								</div>
								<div class="form-group">
									<label>예약 가능 수량</label> <input type="number" min="1" class="form-control" required value="1">
								</div>
							</div>
							<div class="card-footer text-right">
								<button class="btn btn-primary mr-1" type="submit">등록</button>
								<button class="btn btn-secondary" type="reset">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<c:import url="../common/footer.jsp" />

	<script>
		document.getElementById('addDate').value = new Date().toISOString().substring(0, 10);;
		
		// 전체 선택
		function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('department');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  });
		}
		
		$('#defaultCheck1').on('click', function() {
			selectAll(this);
		});
	</script>
</body>

</html>