<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<style> table{text-align : center;}</style>
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>부서 관리</title>
</head>

<body>
	<c:import url="../common/headerAdmin.jsp" />
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<div class="section-header">
				<h1>부서 관리</h1>
				<div class="section-header-breadcrumb">
					<div class="breadcrumb-item active">
						<a href="#">부서 관리</a>
					</div>
					<div class="breadcrumb-item">부서 목록</div>
				</div>
			</div>
			
			
			<div class="section-body">
			<h2 class="section-title">부서 목록</h2>

	            <div class="row">
					
					<!-- 목록 -->
					<div class="col-12 col-md-6 col-lg-6">
						<div class="card">
	                  	
		                  	<br>
		                  	<div class="card-body">
		                    	<div class="table-responsive">
		                    	
									<!-- 트리구조 : 작업 완료후 display : non으로 변경할것 -->
				                     <div id="tree">
									 	<ul id="mixed">
											<li><span>Item 1</span>
												<ul>
													<li><span>Item 1.0</span>
														<ul>
															<li><span>Item 1.0.0</span></li>
														</ul>
													</li>
													<li><span>Item 1.1</span></li>
												</ul>
											</li>
											<li id="36" class="hasChildren">
												<span>Item 2</span>
												<ul>
													<li><span class="placeholder">&nbsp;13</span></li>
												</ul>
											</li>
											<li>
												<span>Item 3</span>
											</li>
										</ul>
									 </div>
									 
		                    	</div>
		                  	</div>
	                	</div>
	              	</div>
					<!--  -->
					
					<!-- 목록 -->
					<div class="col-12 col-md-6 col-lg-6">
						<div class="card">
	                  	
		                  	<br>
		                  	<div class="card-body">
		                    	<div class="table-responsive">
										<table class="table table-striped">
					                         <tr>
						                          <th>부서 명</th>
						                          <th>부서 코드</th>
						                          <th>구성원 수</th>
						                          <th>관리</th>
						                        </tr>
						                        <c:forEach var="d" items="${ list }" varStatus="vs">	
							                    	<tr>
														<td>${ d.dName }</td>
								                      	<td>${ d.dNo }</td>
	 						                          	<td>${ countList[vs.index] }</td>
							                          	<td>
<!-- 								                          	<button class="btn btn-secondary"  onclick="deleteDep();">삭제</button> -->
								                          	<button class="btn btn-secondary">삭제</button>
							                          	</td>
							                        </tr>
						                        </c:forEach>
										</table>
		                        	<!-- 버튼 -->
			                        <div class="card-footer text-right">
									    <button class="btn btn-primary mr-1" onclick="location.href='addDep.ad'">부서 등록</button>
								    </div>
		                    	</div>
		                  	</div>
		                  	
	                	</div>
	              	</div>
	              	
	             </div>
            </div>
		</section>
	</div>
		
				
	<c:import url="../common/footer.jsp" />
	
	<script type="text/javascript">
	
	// 부서 삭제
	$('.btn-secondary').click(function(){
		var dNo = $(this).parent().parent().children().eq(1).text();
		   
		console.log(dNo);
			
		var bool = confirm("정말 삭제하시겠습니까?");
			
		if(bool){
			// ajax
			$.ajax({
				url : 'deleteDep.ad',
				data : {dNo:dNo},
				success : function(data){
					console.log(data);
					location.reload();
				},
				error : function(data){
					console.log(data);
				}
			});
		}
	});

	
	/* 
		treeview 사용 : https://github.com/jzaefferer/jquery-treeview/tree/master/demo 
		다른 방법 ) fancytree : https://github.com/mar10/fancytree/
		→ ajax를 사용해야하는데 아직 어떻게 해야할지 모르겠습니다...
	*/
	

  </script>




	
</body>
</html>