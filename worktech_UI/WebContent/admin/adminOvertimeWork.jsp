<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<style> table{text-align : center;}</style>
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>연장 근무 관리</title>
</head>

<body>
	<c:import url="common/header.jsp" />
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<div class="section-header">
				<h1>연장 근무 관리</h1>
				<div class="section-header-breadcrumb">
					<div class="breadcrumb-item active">
						<a href="#">연장 근무 관리</a>
					</div>
					<div class="breadcrumb-item">연장 근무 관리</div>
				</div>
			</div>
			
			
			<div class="section-body">
				<h2 class="section-title">연장 근무 관리</h2>
				<div class="section-body">
           
		            <div class="card">
		              <div class="card-header">
		         
		                <div class="table-responsive">
											<table class="table table-striped">
			                        <tr>
			                          <th>신청번호</th>
			                          <th>일자</th>
			                          <th>사원 명</th>
			                          <th>연장근무 시간</th>
			                          <th>초과 시간</th>
			                        </tr>
			                        <tr>
			                          <td>1</td>
			                          <td>2021-12-25</td>
			                          <td>김사원</td>
			                          <td>18:00 ~ 21:00</td>
			                          <td>3시간</td>
			                        </tr>
			                        
			                      </table>
			                      
			                      <!-- 페이딩처리 수정 필요 : 수업중 boardListView 참고 -->
			                      <div class="card-footer text-center">
				                    <nav class="d-inline-block">
				                      <ul class="pagination mb-0">
				                        <li class="page-item disabled">
				                          <a class="page-link" href="#" tabindex="-1"><i class="fas fa-chevron-left"></i></a>
				                        </li>
				                        <li class="page-item active"><a class="page-link" href="#">1 <span class="sr-only">(current)</span></a></li>
				                        <li class="page-item">
				                          <a class="page-link" href="#">2</a>
				                        </li>
				                        <li class="page-item"><a class="page-link" href="#">3</a></li>
				                        <li class="page-item">
				                          <a class="page-link" href="#"><i class="fas fa-chevron-right"></i></a>
				                        </li>
				                      </ul>
				                    </nav>
			                 	</div>       
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