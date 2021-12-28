<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<style> table{text-align : center;}</style>
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>사원 관리</title>
</head>

<body>
	<c:import url="common/header.jsp" />
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<div class="section-header">
				<h1>사원관리</h1>
				<div class="section-header-breadcrumb">
					<div class="breadcrumb-item active">
						<a href="#">사원관리</a>
					</div>
					<div class="breadcrumb-item">사원목록</div>
				</div>
			</div>
			
			
			<div class="section-body">
				<h2 class="section-title">사원 목록</h2>
				
				
				 <div class="row">
	              <div class="col-12">
	                <div class="card">
	                  <div class="card-header">
	                    <h4></h4>
	                    <div class="card-header-form">
	                      <form>
	                        <div class="input-group">
	                          <input type="text" class="form-control" placeholder="Search">
	                          <div class="input-group-btn">
	                            <button class="btn btn-primary"><i class="fas fa-search"></i></button>
	                          </div>
	                        </div>
	                      </form>
	                    </div>
	                  </div>
	                  <div class="card-body p-0">
	                    <div class="table-responsive">
	                    
	                    <!-- 목록 있을때 없을때 : 수업중 boardListView 참고 -->
	                      <table class="table table-striped">
	                        <tr>
	                          <th width="30px;"></th>
	                          <th  class="p-0 text-center">
	                          	<!-- 가운데 정렬 필요 -->
	                            <div class="custom-checkbox custom-control" >
	                              <input type="checkbox" data-checkboxes="mygroup" data-checkbox-role="dad" class="custom-control-input" id="checkbox-all" onclick="selectAll();">
	                              <label for="checkbox-all" class="custom-control-label">&nbsp;</label>
	                            </div>
	                          </th>
<!-- 	                          <th></th> -->
	                          <th>사원 번호</th>
	                          <th>사원 명</th>
	                          <th>부서</th>
	                          <th>직급</th>
	                          <th></th>
	                        </tr>
	                        <tr>
	                          <td></td>
	                          <td class="p-0 text-center">
	                          		<!-- 원본 -->
<!-- 	                          	   <div class="custom-checkbox custom-control"> -->
<!-- 		                              <input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-1"> -->
<!-- 		                              <label for="checkbox-1" class="custom-control-label">&nbsp;</label> -->
<!-- 		                           </div> -->
		                           
		                           <!-- 수정 -->
	                          	   <div class="custom-checkbox custom-control">
		                              <input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-1" name="checkB">
		                              <label for="checkbox-1" class="custom-control-label">&nbsp;</label>
		                           </div>
	                          
	                          </td>
<!-- 	                          <td></td> -->
	                          <td>123456</td>
	                          <td class="align-middle">김사원</td>
	                          <td>영업부</td>
	                          <td>사원</td>
	                          <td><a href="#" class="btn btn-secondary">삭제</a></td>
	                        </tr>
	                        
	                      </table>
	                      
	                      <!-- 페이딩처리 : : 수업중 boardListView 참고 -->
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
                      
                        <!-- 버튼 -->
                        <div class="card-footer text-right">
						    <button class="btn btn-primary mr-1" type="submit">사원 등록</button>
						    <button class="btn btn-secondary" type="reset">전체 삭제</button>
					    </div>
                      
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
	/*------------------------------ 체크박스 선택 ------------------------------*/
	// 전체 체크박스 선택/해제
	var all = document.getElementById("checkbox-all");
	var agree = document.getElementsByName("checkB");
	
	function selectAll() {
		if (all.checked) {
			for (var i = 0; i < agree.length; i++) {
				agree[i].checked = true;
			}
		} else {
			for (var i = 0; i < agree.length; i++) {
				agree[i].checked = false;
			}
		}
	}
	
	// 개별 체크박스 선택시 전체 체크박스 선택 (카운트 수 필요)
// 	function selectOne() {
// 		var count = 0;
// 		for (var i = 0; i < agree.length; i++) {
// 			if (agree[i].checked) {
// 				count++;
// 			}
// 		}
// 		if (count != 1) {
// 			all.checked = false;
// 		} else {
// 			all.checked = true;
// 		}
// 	}
	
	
	/*------------------------------ 클릭할수 있도록 만들기 ------------------------------*/
// 	$(function(){
// 		//table id = tb
// 		$('.content td').mouseenter(function(){
// 			$(this).parent().css({'color':'yellowgreen', 'font-weight':'bold', 'cursor':'pointer'});
// 		}).mouseout(function(){
// 			$(this).parent().css({'color':'black', 'font-weight':'normal'});
// 		}).click(function(){
// 			var bId = $(this).parent().children().eq(0).text();
// 			location.href="bdetail.bo?bId=" + bId + '&page=' + ${pi.currentPage}; 
// 		});
// 	});

	
	
	
	</script>
	
</body>

</html>