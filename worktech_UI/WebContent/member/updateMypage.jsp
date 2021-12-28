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
	<title>나의 정보 수정</title>
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
					<div class="breadcrumb-item">나의 정보 수정</div>
				</div>
			</div>
			
			
			<div class="section-body">
				<h2 class="section-title">나의 정보 수정</h2>
				<div class="row">
					<div class="col-12 col-md-12 col-lg-12">
						<div class="card">
							<div class="card-body">
							
							<!-- 파일업로드 필요 : encType="multipart/form-data" 사용 -->
							<form action="" method="post" encType="multipart/form-data" id="updateMypageForm">
			                    <div class="form-group">
			                    	<label>프로필 사진</label>
			                    </div>
			                    
			                    <!-- 프로필 이미지 영역 -->
			                    <!-- Basic avatar examples : https://picturepan2.github.io/spectre/components/avatars.html-->
				                <figure class="avatar avatar-xl" id="titleImgArea">
									<img id="titleImg" src="./resources/assets/img/avatar/avatar-3.png" >
								</figure> <br><br><br>
			                    
			                    <!-- 파일 업로드 하는 부분-->
			                    <div id="fileArea">
			                    	<input type="file" class="form-control" id="proImg" multiple="multiple" name="proImg" onchange="LoadImg(this,1)"> 
			                    </div>
			                    
			                    
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
			                    <!-- Q. 사원이 이메일 변경 가능하도록 설정? -->
			                      <label>Email</label>
			                      <input type="email" class="form-control" id="email" name="email" required>
			                    </div>
			                       
			                    
			                    <div class="form-group">
			                      <label>전화번호</label>
			                      <input type="tel" class="form-control" id="phone" name="phone" placeholder="'-'을 제외하고 입력해주세요">
			                    </div>
			                    
			                    <div class="form-group">
			                      <label>생년월일</label>
<!-- 			                      <input type="text" class="form-control" id="birthDay" name="birthDay" > -->
			                      <table>
			                      	<tr>
			                      		<td>
			                      			<select name="year" class="form-control">
												<!-- option을 원하는 개수만큼 돌리기 : for문 사용 -->
												<c:forEach begin="<%= new GregorianCalendar().get(Calendar.YEAR) - 100 %>" 
															end="<%= new GregorianCalendar().get(Calendar.YEAR) %>" var="i">
													<!-- 시작: 현대 연도에서  100년 전 | 끝 : 올해까지 | 하나하나 받아오는것을 i에 담기-->
													<!-- 
														선택했던 데이터가 바로 나올 수 있도록  내가 선택한 데이터와 for문을 돌렸을 때의 i가 일치할때 i를 출력할수 있도록 설정
														→ <씨:이프>이용 
														생년월일이 String으로 들어가있기때문에 쪼개 줘야 함 : <에프엔 :서브스트링>이용
														→ 앞에서 4번째 자리까지 가져오기
														→ 선택이 된것처럼 만들기 위해 selected 사용
															
														선택한 값이 i와 같다면 ↓
													-->
													<c:if test="${ fn:substring(loginUser.birthDay, 0, 4) == i }">
														<option value="${ i }" selected >${ i }</option>
													</c:if>
													<!-- 선택한 값이 i와 같지 않다면 : i만 출력 -->
													<c:if test="${ fn:substring(loginUser.birthDay, 0, 4) != i }">
														<option value="${ i }" >${ i }</option>
													</c:if>
												</c:forEach>
											</select>
			                      		</td>
			                      		<td>
			                      			<select name="month" class="form-control">
												<c:forEach begin="1" end="12" var="i">
													<c:if test="${ fn:substring(loginUser.birthDay, 5, 7) == i }">
														<option value="${ i }" selected >${ i }</option>
													</c:if>
													<c:if test="${ fn:substring(loginUser.birthDay, 5, 7) != i }">
														<option value="${ i }" >${ i }</option>
													</c:if>
												</c:forEach>
											</select>
			                      		</td>
			                      		<td>
			                      			<select name="date" class="form-control">
												<!-- 
													날짜같은 경우는 몇월을 선택했냐에 따라 마지막 일이 달라짐(28일 / 30일 / 31일 / 29일)
													→ 그걸 다 하고 싶다하면 조건문추가
													요즘에는 귀찮기때문에 아예 캘린더를 제공 多 
												-->
												<c:forEach begin="1" end="31" var="i"> 
													<c:if test="${ fn:substring(loginUser.birthDay, 8, 10) == i }">
														<option value="${ i }" selected >${ i }</option>
													</c:if>
													<c:if test="${ fn:substring(loginUser.birthDay, 8, 10) != i }">
														<option value="${ i }" >${ i }</option>
													</c:if>
												</c:forEach>
											</select>
			                      		</td>
			                      	</tr>
			                      </table>
			                    </div>
			                    
			                    
			                    <div class="form-group">
			                      <label>주소</label>
			                      <!-- id="address" name="address" -->
			                      <!-- https://postcode.map.daum.net/guide : 2. 사용자가 선택한 값 이용하기 -->
			                      	<table>
			                      		<tr>
			                      			<td>
			                      				 <input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control">
			                      			</td>
			                      			<td align="left">
			                      				 &nbsp;&nbsp;&nbsp;<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary mr-1"><br>
			                      			</td>
			                      		</tr>
			                      		<tr>
			                      			<td colspan="2">
			                      				 <input type="text" id="sample6_address" placeholder="주소" class="form-control">
			                      			</td>
			                      		</tr>
			                      		<tr>
			                      			<td>
			                      				<input type="text" id="sample6_detailAddress" placeholder="상세주소" class="form-control">
			                      			</td>
			                      			<td>
			                      				<input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
			                      			</td>
			                      		</tr>
			                      	</table>
			                    </div>
			                   
			                  
			                  <div class="card-footer text-right">
			                    <button class="btn btn-primary mr-1" type="submit">수정하기</button>
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
		
		/*------------------------------ 프로필 이미지 ------------------------------*/
		
		// 내용작성 부분의 공간을 클릭할때 파일 첨부 창이 뜨도록 설정
		$(function(){
			$("#fileArea").hide(); // 올리는 버튼 숨기기
			
			$("#titleImgArea").click(function(){
				$("#proImg").click();
			});
		});
		
		
		// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		function LoadImg(value, num){
			if(value.files && value.files[0]){ // 파일이 들어왔다고 했을때 
				var reader = new FileReader();
				
				reader.onload = function(e){								
					switch(num){
					case 1: 
						$("#titleImg").attr("src", e.target.result); // 파일에 대한 경로값 집어넣기
						break;
								
					}
				}
							
				reader.readAsDataURL(value.files[0]);  // 여러개 선택시 가장 앞에 있는 파일만 넣기
			}
		}
	
		
		/*------------------------------ daum 주소 API ------------------------------*/
		 function sample6_execDaumPostcode() {
	       	 new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
		}
		
		
	
	</script>
</body>

</html>