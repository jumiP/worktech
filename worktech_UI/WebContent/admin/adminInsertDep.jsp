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

<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>부서 등록</title>
</head>

<body>
	<c:import url="common/header.jsp" />
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<div class="section-header">
				<h1>부서 등록</h1>
				<div class="section-header-breadcrumb">
					<div class="breadcrumb-item active">
						<a href="#">부서 관리</a>
					</div>
					<div class="breadcrumb-item">부서 등록</div>
				</div>
			</div>
			
			
			<div class="section-body">
				<h2 class="section-title">부서 등록</h2>
				<div class="row">
					<div class="col-12 col-md-12 col-lg-12">
						<div class="card">
							<div class="card-body">
							    
								<form action="" method="post" id="insertDepForm">
				                    
				                    <div class="form-group">
				                    	<label>부서 이름</label>
				                     	<input type="text" id="depName" name="depName"  class="form-control">
				                    </div>
				                    
				                    <div class="form-group">
				                    	<label>등록 일자</label>
				                     	<input type="text" id="insertDate" name="insertDate" class="form-control">
				                    </div>
				                    
				                    <div class="form-group">
				                      <label>상위 부서</label>
				                      <select class="form-control" name="parentDep" id="parentDep">
				                        <option>----</option>
				                        <option>영업팀</option>
										<option>기획팀</option>
										<option>인사팀</option>
										<option>총무팀</option>
										<option>법무팀</option>
										<option>추가</option>
				                      </select>
				                    </div>
				                    
				                    
				                  <div class="card-footer text-right">
				                    <button class="btn btn-primary mr-1" type="submit">등록</button>
				                    <button class="btn btn-secondary" type="reset">취소</button>
				                  </div>
								
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<c:import url="common/footer.jsp" />


	<script>
		
		
	
	</script>
</body>

</html>