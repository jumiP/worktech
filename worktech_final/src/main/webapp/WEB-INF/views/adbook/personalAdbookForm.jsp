<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>연락처 추가</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="resources/dist/assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/dist/assets/modules/fontawesome/css/all.min.css">

  <!-- CSS Libraries -->

  <!-- Template CSS -->
  <link rel="stylesheet" href="resources/dist/assets/css/style.css">
  <link rel="stylesheet" href="resources/dist/assets/css/components.css">
<!-- Start GA -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-94034622-3');
</script>
<!-- /END GA --></head>
<style>
	.card{
		margin: 20px;
	}
</style>
<body>
	<div class="card">
                  <div class="card-header">
                    <h4>연락처 추가</h4>
                  </div>
                  <div class="card-body">
                    <div class="form-group row">
                      <label for="name" class="col-sm-3 col-form-label">이름</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="name" name="name" placeholder="이름">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="phone" class="col-sm-3 col-form-label">전화번호</label>
                      <div class="col-sm-9">
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="전화번호">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="inputPassword3" class="col-sm-3 col-form-label">이메일</label>
                      <div class="col-sm-9">
                        <input type="email" class="form-control" id="inputPassword3" placeholder="이메일">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="company" class="col-sm-3 col-form-label">회사</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="company" name="company" placeholder="회사">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="department" class="col-sm-3 col-form-label">부서</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="department" name="department" placeholder="부서">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="job" class="col-sm-3 col-form-label">직책</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="job" name="job" placeholder="직책">
                      </div>
                    </div>
                    
                  <div class="card-footer text-center">
                  	<button class="btn btn-primary" type="submit">저장</button>
                  	<button class="btn btn-danger" type="button">취소</button>
                  </div>
                </div>
        </div>
  
  <!-- 연락처 중복 확인 -->

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
</body>
</html>