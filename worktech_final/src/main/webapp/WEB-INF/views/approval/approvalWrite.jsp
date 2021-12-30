<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>새 결재 진행</title>
	<style>
		.section-header{
			padding: 20px, 35px;
			margin: -10px, -30px, 30px;
		}
	</style>
</head>

<body>
<c:import url="common/header.jsp" />
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<div class="section-header">
				<h1>결재 작성</h1>
				<div class="section-header-breadcrumb">
					<div class="breadcrumb-item active"><a href="#">전자 결재</a></div>
					<div class="breadcrumb-item">새 결재 작성</div>
				</div>
    		</div>

			<div class="row">
				<div class="col-12 col-md-8 col-lg-8">
					<div class="card">
						<div class="card-header">
							<h4>새 결재 작성</h4>
						</div>
						<div class="card-body">
							<div class="form-group row mb-4">
								<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">문서 제목</label>
								<div class="col-sm-12 col-md-7">
									<input type="text" class="form-control">
								</div>
                    		</div>
	                    	<div class="form-group row mb-4">
	                      		<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">문서 양식</label>
	                      		<div class="col-sm-12 col-md-7">
	                        		<input type="text" class="form-control">
	                      		</div>
	                      		<!-- <div><a href="#myModal" data-toggle="modal" class="btn btn-info">문서선택</a></div> -->
	                      		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">문서선택</button>
	                      		
<!-- 	                      		Modal
	                      		<div class="modal fade" id="myModal"> 사용자 지정 부분① : id명
									<div class="modal-dialog">
										Modal content
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">×</button>
												<p>헤더 부분</p> 사용자 지정 부분② : 타이틀
											</div>
											<div class="modal-body">
												<p>여기에 필요한 텍스트 메시지 넣기</p> 사용자 지정 부분③ : 텍스트 메시지
											</div>		
											<div class="modal-footer">	
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>	
											</div>			
										</div>		
									</div>
								</div> -->
	                    	</div>
	                    	
	                    	<div class="form-group row mb-4">
	                      		<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">결재선</label>
	                      		<div class="col-sm-12 col-md-7">
	                       			<input type="text" class="form-control">
	                     		</div>
	                     		<div><a href="#" class="btn btn-info">찾기</a></div>
	                    	</div>
	                    	<div class="form-group row mb-4">
	                      		<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">수신참조</label>
	                      		<div class="col-sm-12 col-md-7">
	                        		<input type="text" class="form-control">
	                      		</div>
	                      		<div><a href="#" class="btn btn-info">찾기</a></div>
	                    	</div>
	                    	<div class="form-group row mb-4">
	                      		<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">첨부파일</label>
	                      		<div class="col-sm-12 col-md-7">
	                        		<input type="text" class="form-control">
	                      		</div>
	                      		<div><a href="#" class="btn btn-info">찾기</a></div>
	                    	</div>
	                    	<div class="form-group col-md-12 col-12">
	                      		<div>
	                        		<textarea class="summernote"></textarea>
	                      		</div>
	                    	</div>
	                    	<div class="form-group row mb-4">
	                      		<label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
	                      		<div class="col-sm-12 col-md-7">
	                        		<button class="btn btn-primary">Publish</button>
	                      		</div>
	                    	</div>
                  		</div>                  		
					</div>
				</div>
				<div class="col-12 col-md-4 col-lg-4">
					<div class="card">
						<div class="card-header">
							<div class="card-body">
								<ul class="nav nav-pills" id="myTab3" role="tablist">
									<li class="nav-item">
										<a class="nav-link" id="home-tab3" data-toggle="tab" href="#home3" role="tab" aria-controls="home" aria-selected="false">결재선</a>
									</li>
	                     			 <li class="nav-item">
	                        			<a class="nav-link active show" id="profile-tab3" data-toggle="tab" href="#profile3" role="tab" aria-controls="profile" aria-selected="true">참조</a>
	                      			</li>
	                    		</ul>
	                    		<div class="tab-content" id="myTabContent2">
	                      			<div class="tab-pane fade" id="home3" role="tabpanel" aria-labelledby="home-tab3">
	                      				<br>
										<h3 class="card-title pricing-card-title">
							   				<figure class="avatar avatar-xl"><img src="resources/images/propile.png" alt="..."></figure>&nbsp;
							   				OOO 대리
										</h3><br>
	                      			</div>
	                      		<div class="tab-pane fade active show" id="profile3" role="tabpanel" aria-labelledby="profile-tab3"></div>
	                    		</div>
	                  		</div>
	                  	</div>
	                </div>
				</div>   
			</div>
		</section>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal"> <!-- 사용자 지정 부분① : id명 -->
		<div class="modal-dialog">
			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">결재자 지정</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
					 <!-- 사용자 지정 부분② : 타이틀 -->
				</div>
				<div class="modal-body">
					<p>여기에 필요한 텍스트 메시지 넣기</p> <!-- 사용자 지정 부분③ : 텍스트 메시지 -->
				</div>		
				<div class="modal-footer">	
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>	
				</div>			
			</div>		
		</div>
	</div>
	
</body>
</html>