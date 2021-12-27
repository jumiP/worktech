<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<style>
 	table { text-align : center; width : 100%;} 
 	#titleImgArea{width:100px; height: 100px;}
</style>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- daum 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>나의 비밀번호 변경</title>
</head>

<body>
	<c:import url="common/header.jsp" />
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<div class="section-header">
				<h1>마이페이지</h1>
				<div class="section-header-breadcrumb">
					<div class="breadcrumb-item active">
						<a href="#">마이페이지</a>
					</div>
					<div class="breadcrumb-item">비밀번호 변경</div>
				</div>
			</div>
			
			
			<div class="section-body">
				<h2 class="section-title">비밀번호 변경</h2>
				<div class="row">
					<div class="col-12 col-md-12 col-lg-12">
						<div class="card">
							<div class="card-body">

								 <div class="card card-primary">
						              <div class="card-header"><h4>비밀번호 변경</h4></div>
						
						              <div class="card-body">
<!-- 						              	<p class="text-muted">We will send a link to reset your password</p> -->
						
						                <form method="POST">
						                  <div class="form-group">
						                    <label for="email">현재 비밀번호</label>
						                    <input id="email" type="email" class="form-control" name="email" tabindex="1" required autofocus>
						                  </div>
						
						                  <div class="form-group">
						                    <label for="password">새로운 비밀번호</label>
						                    <input id="password" type="password" class="form-control pwstrength" data-indicator="pwindicator" name="password" tabindex="2" required>
						                    <div id="pwindicator" class="pwindicator">
						                      <div class="bar"></div>
						                      <div class="label"></div>
						                    </div>
						                  </div>
						
						                  <div class="form-group">
						                    <label for="password-confirm">비밀번호 확인</label>
						                    <input id="password-confirm" type="password" class="form-control" name="confirm-password" tabindex="2" required>
						                  </div>
						
						                  <div class="form-group">
						                    <button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
						                     	수정하기
						                    </button>
						                  </div>
						                </form>
						              </div>
					            </div>
            
         					 </div>
       					 </div>
      				</div>
      			</div>
      		</div>
    </section>
  </div>

  <!-- General JS Scripts -->
  <script src="assets/modules/jquery.min.js"></script>
  <script src="assets/modules/popper.js"></script>
  <script src="assets/modules/tooltip.js"></script>
  <script src="assets/modules/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
  <script src="assets/modules/moment.min.js"></script>
  <script src="assets/js/stisla.js"></script>
  
  <!-- JS Libraies -->

  <!-- Page Specific JS File -->
  
  <!-- Template JS File -->
  <script src="assets/js/scripts.js"></script>
  <script src="assets/js/custom.js"></script>

	<c:import url="common/footer.jsp" />


</body>

</html>