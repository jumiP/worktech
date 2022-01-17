<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<style> 

	table{text-align : center;}
	
	#depTree{ float: right;}
</style>
<head>
<script src="resources/js/jquery-3.6.0.min.js"></script>


<!-- treeview -->
<!-- <link rel="stylesheet" href="resources/treeview/css/jquery.treeview.css"/> -->
<!-- <script src="resources/treeview/js/jquery.treeview.sortable.js" type="text/javascript"></script> -->
<!-- <script src="resources/treeview/js/jquery.treeview.edit.js" type="text/javascript"></script> -->
<!-- <script src="resources/treeview/js/jquery.treeview.js" type="text/javascript"></script> -->
<!-- <script src="resources/treeview/js/jquery.treeview.async" type="text/javascript"></script> -->

<script type="text/javascript">

/*------------------------------ 부서 목록 : zTree ------------------------------*/
    $(function() {
    	
//     	$.ajax({
//     		type : "GET",
//     		url : "deTree.ad",
//     		contentType	: "application/json",
//     		data : dataSet,
//     		processData	: true,
    		
//     	});
    	
    	$.ajax({
    		type : "GET",
    		url : "", /* deTree.ad */
    		contentType	: "application/json",
//     		data : dataSet,
    		success : function(data){
    			console.log(typeof data);
//     			data = JSON.parse(data);
    			console.log(data);
    			
    			data.forEach(function(e, i) {
    				var codeNm = e.codeNm;
    				var codeId = e.codeId;
    			  var parentId = e.parentId;
    				var codeLvl = e.codeLvl;
    				var li = '<li id="'+ codeId +'" lvl="' + codeLvl + '"><a class="file code">'+ codeNm +'</a></li>';
    				// 1레벨은 그냥 추가
    				// 다음 레벨부터는 상위 li의 클래스를 폴더로 바꾸고 자기 자신을 추가
    			  if(codeLvl == 1) {
    				lvl0.append(li);
    				} else {
    				var parentLi = $("li[id='"+ parentId +"']");
    				      parentLi.find("a").removeClass("file");
    				      parentLi.find("a").addClass("folder");
    				      var bUl = parentLi.find("ul");
    			   // 하위 그룹이 없으면 li로 추가
    				      // 하위 그룹이 있으면 ul로 추가
    				      if(bUl.length == 0) {
    				          li = "<ul>" + li + "</ul>";
    				          parentLi.append(li);
    				      } else {
    				         bUl.append(li);
    				      }
    			  }
    			});
    		},
    		error : function(data){
    			console.log("실패");
    		}
    	});

//     	data.forEach(function(e, i) {
// 			var codeNm = e.codeNm;
// 			var codeId = e.codeId;
// 		  var parentId = e.parentId;
// 			var codeLvl = e.codeLvl;
// 			var li = '<li id="'+ codeId +'" lvl="' + codeLvl + '"><a class="file code">'+ codeNm +'</a></li>';
// 			// 1레벨은 그냥 추가
// 			// 다음 레벨부터는 상위 li의 클래스를 폴더로 바꾸고 자기 자신을 추가
// 		  if(codeLvl == 1) {
// 			lvl0.append(li);
// 			} else {
// 			var parentLi = $("li[id='"+ parentId +"']");
// 			      parentLi.find("a").removeClass("file");
// 			      parentLi.find("a").addClass("folder");
// 			      var bUl = parentLi.find("ul");
// 		   // 하위 그룹이 없으면 li로 추가
// 			      // 하위 그룹이 있으면 ul로 추가
// 			      if(bUl.length == 0) {
// 			          li = "<ul>" + li + "</ul>";
// 			          parentLi.append(li);
// 			      } else {
// 			         bUl.append(li);
// 			      }
// 		  }
// 		});
    	
//     	$("#codeList").treeview({collapsed: true});

    	
//             $("#tree").treeview({
//                 collapsed: false, // 처음 로딩시 펼쳐지게
//                 animated: "medium",
//                 control:"#sidetreecontrol",
//                 persist: "location"
//             });
        });

</script>
	
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>관리자 부서 관리</title>
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
<!-- 					<div class="col-12 col-md-6 col-lg-6"> -->
<!-- 						<div class="card"> -->
<!-- 		                	<br> -->
<!-- 		                  	<div class="card-body"> -->
<!-- 		                    	<div class="table-responsive"> -->
<!-- 									 해당 treeView가 그려질 부분 -->
<!-- 									 <ul id="codeList"> -->
<!-- 										<li id="0"><a class="folder code">전체</a> -->
<!-- 										<ul>자식 노드가 들어올 공간</ul>  -->
<!-- 										</li> -->
<!-- 									</ul> -->

<!-- 		                    	</div> -->
<!-- 		                  	</div> -->
<!-- 	                	</div> -->
<!-- 	              	</div> -->
					
					<!-- 부서 목록 -->
					<div class="col-12">
<!-- 					<div class="col-12 col-md-6 col-lg-6"> -->
						<div class="card">
<!-- 		                  	<br> -->
		                  	<div class="card-body">
									<a href="#" onclick="treeOpen();" class="btn btn-icon icon-left btn-primary" id="depTree"><i class="fas fa-users"> 부서 구조</i></a>          
	                        	<br><br><br>
		                  		
		                    	<div class="table-responsive">
									<table class="table table-striped">
										<tr>
											<th>부서 명</th>
						                    <th>부서 코드</th>
						                    <th>구성원 수</th>
						                    <th>등록 일자</th>
						                    <th>관리</th>
										</tr>
						                <c:forEach var="d" items="${ list }" varStatus="vs">	
							            	<tr>
												<td>${ d.dName }</td>
								            	<td>${ d.dNo }</td>
	 						                	<td>${ countList[vs.index] }</td>
	 						                	<td>${ d.dDate }</td>
							                	<td>
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
	/*------------------------------ 부서 삭제 ------------------------------*/
	$('.btn-secondary').click(function(){
		var dNo = $(this).parent().parent().children().eq(1).text();
		var bool = confirm("정말 삭제하시겠습니까?");
			
		if(bool){
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

	/*------------------------------ 트리구조 페이지로 이동 ------------------------------*/
	
	function treeOpen() {
		window.open('deTree.ad', '부서 구조', 'width=500px, height=500px, resizable=no, toolbar=1');
	}

  </script>

</body>
</html>