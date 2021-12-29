<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<style>
 	table { text-align : center; } 

/* 	span.guide{display: none; font-size: 12px; top: 12px; right: 10px;} */
/* 	span.ok{color: green;} */
/* 	span.error{color: red;} */
	

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
								<form action="minsert.me" method="post" id="joinForm">
				                    <div class="form-group">
				                    	<label>사번</label>
				                     	<input type="text" id="mNo" name="mNo" class="form-control" required placeholder="숫자 6자리를 입력해주세요">
				                     	<!-- 아이디 중복확인 -->
				                     	<span class="valid-feedback">사용할 수 있는 사번입니다.</span>
				                     	<span class="invalid-feedback">사용할 수 없는 사번입니다.</span>
				                     	<input type="hidden" id="idDuplicateCheck" value='0'>
				                    </div>
				                    
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
				                      <select class="form-control" name="dNo" id="dNo" required="true">
				                        <option value="">부서를 선택해주세요</option>
				                        <!-- value자리에 dNo를 전체자리에 dName을 적기 -->
				                        <option value="1">전체</option>
				                        <option value="2">영업부</option>
				                      </select>
				                    </div>
				                    
				                    <div class="form-group">
				                      <label>직급</label>
				                      <select class="form-control" name="jobGrade" id="jobGrade" required>
				                        <option value="">직급을 선택해주세요</option>
				                        <option value="사원" >사원</option>
										<option value="주임">주임</option>
										<option value="대리">대리</option>
										<option value="과장">과장</option>
										<option value="부장">부장</option>
										<option value="팀장">팀장</option>
										<option value="사장">사장</option>
				                      </select>
				                    </div>
				                    
				                    <!-- 
				                    	selectbox에 required가 안먹힌 이유
				                    	: disabled를 사용했기때문에
				                     -->
				                    
				                    <div class="form-group">
				                      <label>Email</label>
				                      <input type="email" class="form-control" id="email" name="email" required>
				                    </div>
	
				                  <div class="card-footer text-right">
				                  	<button class="btn btn-primary mr-1" onclick="return validate();">등록</button>
<!-- 				                  	<button class="btn btn-primary mr-1" type="submit">등록</button> -->
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

	<script type="text/javascript">
	
	// ajax : 사번 중복체크
	$('#mNo').on('keyup', function(){
			var mNo = $(this).val().trim();
			
			if(mNo.length < 6){
				// 가이드가 안보이도록 숨기기
				$('.valid-feedback').hide();
				$('.invalid-feedback').hide();
				$('#idDubplicateCheck').val(0);
				
				return; 
			} 
			
			$.ajax({
				url : 'dupId.me',
				data : {mNo:mNo},
				success : function(data){
					console.log(data);
					data = data.trim();
					if(data == 'NoDup'){
						$('.invalid-feedback').hide();
						$('.valid-feedback').show();
						$('#idDuplicateCheck').val(1);
					} else if(data == 'Dup'){
						$('.invalid-feedback').show();
						$('.valid-feedback').hide();
						$('#idDuplicateCheck').val(0);
					}
					
				},
				error : function(data){
					console.log(data);
				}
			});
			
		});
	
		function validate(){
			if($('#idDuplicateCheck').val() == 0 ){
				alert('사용가능한 사번을 입력해주세요');
				$('#mNo').focus();
				return false;
			} else {
				$('#joinForm').submit();
			}
			
			
		}

	
		
		// 사번 : 숫자 6자리 
		
// 		if ( $(dNo).val().length==0) {
// 			  alert("경고문구");
// 			  return;
// 			}
	
		
	
	
	
	
	
	
	</script>

</body>

</html>