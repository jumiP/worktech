<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
	name="viewport">
<title>개인 주소록 상세</title>

<!-- General CSS Files -->
<link rel="stylesheet"
	href="resources/dist/assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/dist/assets/modules/fontawesome/css/all.min.css">

<!-- CSS Libraries -->

<!-- Template CSS -->
<link rel="stylesheet" href="resources/dist/assets/css/style.css">
<link rel="stylesheet" href="resources/dist/assets/css/components.css">
<!-- Start GA -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-94034622-3');
</script>
<!-- /END GA -->
</head>
<style>
.card {
	margin: 20px;
}
</style>
<body>
	<div class="card">
		<div class="card-header">
			<h4>개인 주소록 상세</h4>
		</div>
		<div class="card-body">
			<form action="pAdbookUpdateView.ab" method="POST">
				<input type="hidden" name="adNo" value="${ a.adNo }"> 
				<div class="form-group row">
					<label for="name" class="col-sm-3 col-form-label">이름</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="adName" value="${ a.adName }" readonly>
					</div>
				</div>
				<div class="form-group row">
					<label for="phone" class="col-sm-3 col-form-label">전화번호</label>
					<div class="col-sm-9">
						<input type="tel" class="form-control" name="adPhone" value="${ a.adPhone }" readonly>
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword3" class="col-sm-3 col-form-label">이메일</label>
					<div class="col-sm-9">
						<input type="email" class="form-control" name="adEmail" value="${ a.adEmail }" readonly>
					</div>
				</div>
				<div class="form-group row">
					<label for="company" class="col-sm-3 col-form-label">회사</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="adCompany" value="${ a.adCompany }" readonly>
					</div>
				</div>
				<div class="form-group row">
					<label for="department" class="col-sm-3 col-form-label">부서</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="adDept" value="${ a.adDept }" readonly>
					</div>
				</div>
				<div class="form-group row">
					<label for="job" class="col-sm-3 col-form-label">직책</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="adJob" value="${ a.adJob }" readonly>
					</div>
				</div>
	
				<div class="card-footer text-center">
					<button class="btn btn-primary">수정</button>
					<button class="btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</div>
	</div>

	<!-- General JS Scripts -->
	<script src="resources/dist/assets/modules/jquery.min.js"></script>
	<script src="resources/dist/assets/modules/popper.js"></script>
	<script src="resources/dist/assets/modules/tooltip.js"></script>
	<script
		src="resources/dist/assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="resources/dist/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="resources/dist/assets/modules/moment.min.js"></script>
	<script src="resources/dist/assets/js/stisla.js"></script>

	<!-- JS Libraies -->

	<!-- Page Specific JS File -->

	<!-- Template JS File -->
	<script src="resources/dist/assets/js/scripts.js"></script>
	<script src="resources/dist/assets/js/custom.js"></script>

</body>
</html>