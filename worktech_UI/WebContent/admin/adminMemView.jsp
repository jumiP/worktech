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
	<title>사원정보 확인</title>
</head>

<body>
	<c:import url="common/header.jsp" />
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<div class="section-header">
				<h1>사원 정보 확인</h1>
				<div class="section-header-breadcrumb">
					<div class="breadcrumb-item active">
						<a href="#">사원관리</a>
					</div>
					<div class="breadcrumb-item">사원 정보 확인</div>
				</div>
			</div>
			
			
			<div class="section-body">
				<h2 class="section-title">김대리의 정보</h2>
				<div class="row">
					<div class="col-12 col-md-12 col-lg-12">
						<div class="card">
							<div class="card-body">
							
<!-- 			                    <div class="form-group">
			                    	<label>프로필 사진</label>
			                    </div>
			                    
			                    <!-- 프로필 이미지 영역 -->
			                    <!-- Basic avatar examples : https://picturepan2.github.io/spectre/components/avatars.html-->
				                <figure class="avatar avatar-xl" id="titleImgArea">
									<img id="titleImg" src="./resources/assets/img/avatar/avatar-3.png" >
								</figure> <br><br><br>

			                    
			                    <div class="form-group">
			                    	<label>사번</label>
			                     	<input type="text" id="id" name="m_no"  class="form-control" readonly style="background : white;">
			                    </div>
			                    
			                    <div class="form-group">
			                    	<label>이름</label>
			                     	<input type="text" id="name" name="name" class="form-control" readonly style="background : white;">
			                    </div>
			                    
			                    <div class="form-group">
			                    	<label>회사</label>
			                     	<input type="text" id="company" name="company" class="form-control" value="KH" readonly style="background : white;">
			                    </div>
			                    
			                    <div class="form-group">
			                      <label>부서</label>
			                      <input type="text" id="d_name" name="d_name" class="form-control" value="영업부" readonly style="background : white;">
			                    </div>
			                    
			                    <div class="form-group">
			                      <label>직급</label>
			                      <input type="text" id="job_grade" name="job_grade" class="form-control" value="대리" readonly style="background : white;">
			                    </div>
			                    
			                    <div class="form-group">
			                      <label>Email</label>
			                      <input type="email" class="form-control" id="email" name="email" readonly style="background : white;">
			                    </div>
			                       
			                    
<!-- 			                    <div class="form-group"> -->
<!-- 			                      <label>전화번호</label> -->
<!-- 			                      <input type="tel" class="form-control" id="phone" name="phone" placeholder="'-'을 제외하고 입력해주세요"> -->
<!-- 			                    </div> -->
			                   
			                  
			                  <div class="card-footer text-right">
			                    <button class="btn btn-primary mr-1" onclick="location.href=''">비밀정보 변경</button>
			                    <button class="btn btn-primary mr-1" onclick="location.href=''">사원 정보 변경</button>
			                    <button class="btn btn-secondary" onclick="location.href='mdelete.do'">사원 삭제</button>
<!-- 			                    삭제시 url에 쿼리스트링 사용X, 페이지로 이동할것 -> 임으로 mdelete.do로 적어뒀음 -->
			                  </div>
												
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<c:import url="common/footer.jsp" />


	
</body>

</html>