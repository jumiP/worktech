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
	<c:import url="common/header.jsp" />
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
<!-- 					<div class="col-12 col-md-6 col-lg-6" > -->
<!-- 						<div class="card"> -->
						<div class="Card .card-light" >
<!-- 							<div class="card-header" > -->
<!-- 	                    		<h4>Simple Table</h4> -->
<!-- 	                  		</div> -->
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
<!-- 		                </div> -->
		                </div>
					
					<!-- 모니터 길이에따라 변경되는것 확인 필요 -->
					<div class="col-12 col-md-6 col-lg-6">
						<div class="card" style="width:950px;">
<!-- 	                  		<div class="card-header"> -->
<!-- 	                    		<h4>Simple Table</h4> -->
<!-- 	                  		</div> -->
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
					                        <tr>
					                          <td>경영 전략실</td>
					                          <!-- class="align-middle" -->
					                          <td>a0000</td>
					                          <td>10</td>
					                          <td><a href="#" class="btn btn-secondary">삭제</a></td>
					                        </tr>
					                        <tr>
					                          <td>경영 전략 기획팀</td>
					                          <td>a0001</td>
					                          <td>10</td>
					                          <td><a href="#" class="btn btn-secondary">삭제</a></td>
					                        </tr>
									</table>
			                      
		                        	<!-- 버튼 -->
			                        <div class="card-footer text-right">
									    <button class="btn btn-primary mr-1" type="submit">부서 등록</button>
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
	
	<script type="text/javascript">
	
	/* 
		treeview 사용 : https://github.com/jzaefferer/jquery-treeview/tree/master/demo 
		다른 방법 ) fancytree : https://github.com/mar10/fancytree/
		→ ajax를 사용해야하는데 아직 어떻게 해야할지 모르겠습니다...
	*/
	
	function initTrees() {
		$("#black").treeview({
			url: "source.php"
		})

		$("#mixed").treeview({
			url: "source.php",
			// add some additional, dynamic data and request with POST
			ajax: {
				data: {
					"additional": function() {
						return "yeah: " + new Date;
					}
				},
				type: "post"
			}
		});
	}
	$(document).ready(function(){
		initTrees();
		$("#refresh").click(function() {
			$("#black").empty();
			$("#mixed").empty();
			initTrees();
		});
	});

  </script>




	
</body>

</html>