<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
	name="viewport">
<title>개인 주소록 추가</title>

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

	.dupDiv{
		visibility: hidden;
	}
	
	#dupMsg{
		font-weight: bold;
		color: red;
	}
</style>
<body>
	<div class="card">
		<div class="card-header">
			<h4>개인 주소록 추가</h4>
		</div>
		<div class="card-body">
			<form onsubmit="return validate();">
				<div class="form-group row">
					<label for="name" class="col-sm-3 col-form-label">이름</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="adName" placeholder="이름" required>
					</div>
				</div>
				<div class="form-group row">
					<label for="phone" class="col-sm-3 col-form-label">전화번호</label>
					<div class="col-sm-9">
						<input type="tel" class="form-control" name="adPhone" placeholder="전화번호" onblur="checkDup()" required>
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword3" class="col-sm-3 col-form-label">이메일</label>
					<div class="col-sm-9">
						<input type="email" class="form-control" name="adEmail" placeholder="이메일" onblur="checkDup()" required>
					</div>
				</div>
				<div class="form-group row">
					<label for="company" class="col-sm-3 col-form-label">회사</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="adCompany" placeholder="회사">
					</div>
				</div>
				<div class="form-group row">
					<label for="department" class="col-sm-3 col-form-label">부서</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="adDept" placeholder="부서">
					</div>
				</div>
				<div class="form-group row">
					<label for="job" class="col-sm-3 col-form-label">직책</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="adJob" placeholder="직책">
					</div>
				</div>
				<div class="text-center dupDiv">
					<span id="dupMsg">전화번호 또는 이메일이 일치하는 연락처가 이미 존재합니다</span>
				</div>
				<div class="card-footer text-center">
					<button class="btn btn-primary" id="pAdbookBtn">저장</button>
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
	
	<script>
		var noDup = false;
		
		// 전화번호/이메일 중복 여부 확인
		function checkDup() {
			var adPhone = $('input[name=adPhone]').val();
			var adEmail = $('input[name=adEmail]').val();
			
			$.ajax({
				url: 'checkpAdDup.ab',
				data: {phone:adPhone, email:adEmail},
				success: function(data){
					console.log(data);
					console.log('성공');
					
					if(data > 0){
						$('.dupDiv').css('visibility', 'visible');
						noDup = false;
					} else {
						$('.dupDiv').css('visibility', 'hidden');
						noDup = true;
					}
				},
				error: function(data){
					console.log(data);
					console.log('실패');
				}
			});
		}
		
		function validate(){
			return noDup;
		}
		
// 		$('#pAdbookBtn').on('click', function(){
// 			var adName = $('input[name=name]').val();
// 			var adPhone = $('input[name=phone]').val();
// 			var adEmail = $('input[name=email]').val();
// 			var adCompany = $('input[name=company]').val();
// 			var adDept = $('input[name=dept]').val();
// 			var adJob = $('input[name=job]').val();
			
// 			$.ajax({
// 				url: 'checkpAdDup.ab',
// 				data: {phone:adPhone, email:adEmail},
// 				success: function(data){
// 					console.log(data);
// 					console.log('성공');
					
// 					if(data > 0){
// 						$('.dupDiv').css('visibility', 'visible');
// 						dup = true;
// 					} else {
// 						$('.dupDiv').css('visibility', 'hidden');
// 						dup = false;
// 					}
// 				},
// 				error: function(data){
// 					console.log(data);
// 					console.log('실패');
// 				}
// 			});
			
			
// 			if(dup == false){
// 				$.ajax({
// 					url: 'pAdbookInsert.ab',
// 					type: 'POST',
// 					data: {adName:adName, adPhone:adPhone, adEmail:adEmail, adCompany:adCompany, adDept:adDept, adJob:adJob},
// 					success: function(data){
// 						console.log(data);
						
// 						if(data.trim() == 'success'){
// 							opener.parent.location.reload();
// 							window.close();
// 						}
// 					},
// 					error: function(data){
// 						console.log(data);
// 					}
// 				});
// 			} else {
// 				alert('중복된 연락처가 이미 존재합니다.');
// 			}
// 		});
	</script>
</body>
</html>