<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<style>
 	table { text-align : center; } 
</style>

<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>관리자 사원 등록</title>
</head>

<body>
	<c:import url="common/header.jsp" />
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<div class="section-header">
				<h1>사원 등록</h1>
				<div class="section-header-breadcrumb">
					<div class="breadcrumb-item active">
						<a href="#">사원 관리</a>
					</div>
					<div class="breadcrumb-item">사원 등록</div>
				</div>
			</div>
			
			<!-- 관리자 : 사원 등록 -->
			<div class="section-body">
				<h2 class="section-title">사원 등록</h2>
				<div class="row">
					<div class="col-12 col-md-12 col-lg-12">
						<div class="card">
						
							<div class="card-body">
			                    <div class="form-group">
			                    	<label>사번</label>
			                     	<input type="text" id="id" name="m_no"  class="form-control" required>
			                    </div>
			                    
			                    <!------------- 들어가는 값에 따라 css변경 : ajax 필요할듯 --------->
<!-- 			                    <div class="form-group"> -->
<!-- 			                    	<label>사번</label> -->
<!-- 			                     	<input type="text" id="id" name="m_no"  class="form-control is-valid" required> -->
<!-- 			                     	<div class="valid-feedback"> -->
<!-- 			                          	사용할 수 있는 사번입니다. -->
<!-- 			                        </div> -->
<!-- 			                    </div> -->
			                    
<!-- 								 <div class="form-group"> -->
<!-- 			                    	<label>사번</label> -->
<!-- 			                     	<input type="text" id="id" name="m_no"  class="form-control is-invalid" required> -->
<!-- 			                     	<div class="invalid-feedback"> -->
<!-- 			                          	사용할 수 없는 사번입니다. -->
<!-- 			                        </div> -->
<!-- 			                    </div> -->
			                    
			                    <div class="form-group">
			                    	<label>이름</label>
			                     	<input type="text" id="name" name="name" class="form-control" required>
			                    </div>
			                    
			                    <div class="form-group">
			                    	<label>회사</label>
			                     	<input type="text" id="company" name="company" class="form-control" value="KH" readonly style="background : white;">
			                    </div>
			                    
			                    <div class="form-group">
			                      <label>부서</label>
			                      <select class="form-control" name="d_name" id="d_name">
			                        <option>----</option>
			                        <option>영업팀</option>
									<option>기획팀</option>
									<option>인사팀</option>
									<option>총무팀</option>
									<option>법무팀</option>
									<option>추가</option>
			                      </select>
			                    </div>
			                    
			                    <div class="form-group">
			                      <label>직급</label>
			                      <select class="form-control" name="job_grade" id="job_grade">
			                        <option>----</option>
			                        <option>사원</option>
									<option>주임</option>
									<option>대리</option>
									<option>과장</option>
									<option>부장</option>
									<option>팀장</option>
									<option>사장</option>
			                      </select>
			                    </div>
			                    
			                    <div class="form-group">
			                      <label>Email</label>
			                      <input type="email" class="form-control" id="email" name="email">
			                    </div>

			                  <div class="card-footer text-right">
			                    <button class="btn btn-primary mr-1" type="submit">등록</button>
			                    <button class="btn btn-secondary" type="reset">취소</button>
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