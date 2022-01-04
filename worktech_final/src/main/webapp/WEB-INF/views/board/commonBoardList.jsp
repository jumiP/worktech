<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
<script src="resources/js/jquery-3.6.0.min.js"></script>
    <title>일반 게시판</title>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  
    <style>
        table {
            border-collapse: collapse;
            background: white;
        }

        table th {
            border-bottom: 1px solid #e3e3e3;
            text-align: center;
            font-size: 15px;
        }

        table td {
            border-bottom: 1px solid #e3e3e3;
            text-align: center;
            font-size: 15px;
        }

        .push {
            float: right;
        }

        .search {
            display: flex;
            justify-content: center;
        }

        .Searchbtn {
            margin-left: -70px;
            background-color: transparent !important;
            background-image: none !important;
            border-color: transparent;
            font-weight: bold;
            width: 80px;
        }

        .Searchbtn:hover {
            cursor: pointer;
        }

        .Searchbtn:active,
        .Searchbtn:focus {
            outline: none !important;
            box-shadow: none !important;
        }

        .paging-area {
            display: flex;
            justify-content: center;
        }
        
        .select {
        	border: 1px solid white;
        }
        
        .select:focus{
        	border: 1px solid black;
        }
    </style>
</head>

<body>
	<c:if test="${ loginUser.mGrade eq 'USER' }">
		<c:import url="../common/headerUser.jsp" />
	</c:if>
    <c:if test="${ loginUser.mGrade eq 'ADMIN' }">
    	<c:import url="../common/headerAdmin.jsp" />
    </c:if>
    
    <!-- Main Content -->
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>일반 게시판</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item">게시판</div>
                    <div class="breadcrumb-item">일반 게시판</div>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 style="font-size: 20px;">일반 게시판 목록</h4>
                            </div>
                            <div class="card-body">
                            	<div class="category">
	                            	<i class="fas fa-chevron-circle-down"></i>
	                            	<select class="select" name="categoryNo" onchange="location.href=this.value">
                           				<option>카테고리</option>
                           				<c:url var="all" value="commonList.bo"/>
                            			<option value="${ all }">전체</option>
                            			<c:url var="meeting" value="commonList.bo">
                            				<c:param name="category" value="100" />
                            			</c:url>
	                            		<option value="${ meeting }" <c:if test="${ category == 100 }">selected</c:if>>회의</option>
	                            		<c:url var="businessTrip" value="commonList.bo">
                            				<c:param name="category" value="200" />
                            			</c:url>
	                            		<option value="${ businessTrip }" <c:if test="${ category == 200 }">selected</c:if>>출장</option>
	                            		<c:url var="promotion" value="commonList.bo">
                            				<c:param name="category" value="300" />
                            			</c:url>
	                            		<option value="${ promotion }" <c:if test="${ category == 300 }">selected</c:if>>홍보</option>
	                            		<c:url var="etc" value="commonList.bo">
                            				<c:param name="category" value="400" />
                            			</c:url>
	                            		<option value="${ etc }" <c:if test="${ category == 400 }">selected</c:if>>기타</option>
	                            		<c:url var="materials" value="commonList.bo">
                            				<c:param name="category" value="500" />
                            			</c:url>
	                            		<option value="${ materials }" <c:if test="${ category == 500 }">selected</c:if>>자료</option>
	                            	</select>
                            	</div>
                            	<br>
                                <table class="table" id="tb">
                                    <thead>
                                        <tr>
                                            <th style="width: 150px; height: 45px;">글 번호</th>
                                            <th style="width: 450px;">글 제목</th>
                                            <th style="width: 110px;">작성자</th>
                                            <th style="width: 170px;">작성일</th>
                                            <th style="width: 100px;">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="n" items="${ list }">
	                                        <tr>
	                                            <td style="height: 45px;">${ n.bNo }</td>
												<td>
													[ ${ n.categoryName } ] ${ n.bTitle }
													<c:if test="${ !empty n.fileList.get(0).fName }">
                                    					&nbsp;<i class="fas fa-save"></i>
                                    				</c:if>
												</td>
                                    			<td>${ n.name }</td>
                                    			<td>${ n.bDate }</td>
                                    			<td>${ n.bCount }</td>
                                    		</tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                                <button class="btn btn-primary push" onclick="location.href='cinsertView.bo';">글쓰기</button>
                                <br clear="all">
                                <div class="card-body paging-area">
                                    <div class="buttons">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">

                                            	<c:if test="${ pi.currentPage <= 1 }">
	                                                <li class="page-item disabled">
	                                                	<a class="page-link" aria-label="Previous">
	                                                		<i class="fas fa-angle-double-left"></i>
	                                                	</a>
	                                                </li>
	                                                
	                                                <li class="page-item disabled">
	                                                	<a class="page-link" aria-label="Previous">
                                                        	<i class="fas fa-angle-left"></i>
                                                        </a>
                                                	</li>
	                                            </c:if>
                                            	<c:if test="${ pi.currentPage > 1 }">
                                            		<c:url var="start" value="commonList.bo">
														<c:param name="page" value="1"/>
														<c:param name="category" value="${ category }"/>
													</c:url>
	                                                <li class="page-item">
	                                                    <a class="page-link" href="${ start }" aria-label="Previous">
	                                                        <i class="fas fa-angle-double-left"></i>
	                                                    </a>
	                                                </li>
													<c:url var="before" value="commonList.bo">
														<c:param name="page" value="${ pi.currentPage - 1 }"/>
														<c:param name="category" value="${ category }"/>
													</c:url>
	                                                <li class="page-item">
	                                                    <a class="page-link" href="${ before }" aria-label="Previous">
	                                                        <i class="fas fa-angle-left"></i>
	                                                    </a>
	                                                </li>
	                                            </c:if>
	                                            
	                                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                                            	<c:if test="${ p eq pi.currentPage }">
	                                            		<li class="page-item disabled"><a class="page-link">${ p }</a></li>
	                                            	</c:if>
	                                            
	                                            	<c:if test="${ p ne pi.currentPage }">
		                                            	<c:url var="pagination" value="commonList.bo">
															<c:param name="page" value="${ p }"/>
															<c:param name="category" value="${ category }"/>
														</c:url>
	                                            		<li class="page-item">
	                                            			<a class="page-link" href="${ pagination }">${ p }</a>
	                                            		</li>
	                                            	</c:if>
	                                            </c:forEach>

												<c:if test="${ pi.currentPage >= pi.maxPage }">
	                                                <li class="page-item disabled">
	                                                	<a class="page-link" aria-label="Next">
	                                                		<i class="fas fa-angle-right"></i>
	                                                	</a>
	                                                </li>
	                                                
	                                                <li class="page-item disabled">
	                                                	<a class="page-link" aria-label="Next">
	                                                		<i class="fas fa-angle-double-right"></i>
	                                                	</a>
	                                                </li>
												</c:if>

												<c:if test="${ pi.currentPage < pi.maxPage }">
													<c:url var="after" value="commonList.bo">
														<c:param name="page" value="${ pi.currentPage + 1 }"/>
														<c:param name="category" value="${ category }"/>
													</c:url>
	                                                <li class="page-item">
	                                                    <a class="page-link" href="${ after }" aria-label="Next">
	                                                        <i class="fas fa-angle-right"></i>
	                                                    </a>
	                                                </li>
													
													<c:url var="end" value="commonList.bo">
														<c:param name="page" value="${ pi.maxPage }"/>
														<c:param name="category" value="${ category }"/>
													</c:url>
	                                                <li class="page-item">
	                                                    <a class="page-link" href="${ end }" aria-label="Next">
	                                                        <i class="fas fa-angle-double-right"></i>
	                                                    </a>
	                                                </li>
												</c:if>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                                <div class="search">
                                	<c:url var="search" value="searchCommon.bo"/>
                                	<form action="${ search }">
                                		<input type="hidden" name="page" value="${ pi.currentPage }">
                                		<input type="hidden" name="category" value="${ category }">
	                                    <select name="searchCategory" style="height: 30px; width: 80px; border: 1px solid #e3e3e3;">
	                                        <option value="title">제목</option>
	                                        <option value="content">내용</option>
	                                        <option value="writer">작성자</option>
	                                    </select>
	                                    <input name="searchValue" type="text" style="height: 30px; width: 200px; border: 1px solid #e3e3e3;">
	                                    <button class="Searchbtn">검색</button>
                                	</form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <c:import url="../common/footer.jsp" />
    
    <script>
    	var category = '${category}';
    	var searchCategory = '${searchCategory}';
    	var searchValue = '${searchValue}';
    	
	    $(function() {
			$('#tb tbody td').mouseenter(function() {
				$(this).parent().css({'background':'rgba(0, 0, 0, 0.04)', 'font-weight':'bold', 'cursor':'pointer'});
			}).mouseout(function() {
				$(this).parent().css({'background':'white', 'font-weight':'normal'});
			}).click(function() {
				var bNo = $(this).parent().children().eq(0).text();
				
				location.href="cdetail.bo?bNo=" + bNo + "&page=" + ${pi.currentPage} + "&category=" + category
							  + "&searchCategory=" + searchCategory + "&searchValue=" + searchValue;
			});
		});
	    
    </script>


</body>

</html>