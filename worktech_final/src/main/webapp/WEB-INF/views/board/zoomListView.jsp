<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>화상 회의 게시판</title>
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    
      <!-- General CSS Files -->
  <link rel="stylesheet" href="../../../resources/dist/assets/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../../resources/dist/assets/modules/fontawesome/css/all.min.css">

  <!-- CSS Libraries -->

  <!-- Template CSS -->
  <link rel="stylesheet" href="../../../resources/dist/assets/css/style.css">
  <link rel="stylesheet" href="../../../resources/dist/assets/css/components.css">
  <!-- Start GA -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
<script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'UA-94034622-3');
    </script>
    <!-- /END GA -->
    <style>
        #searchItem {
            margin-bottom: 0;
        }

        #searchIcon {
            padding: 14.9px;
        }
        .card{
        	
        }
    </style>
</head>
<body>
	<c:if test="${ loginUser.mGrade eq 'USER' }">
		<c:import url="../common/headerUser.jsp" />
	</c:if>
 <!--**********************************
            Content body start
        ***********************************-->
        <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>화상회의</h1>
          </div>

          <div class="section-body">
         <div class="section-body">
        <div class="row">
        <div class="col-12 col-md-12 col-lg-12">
                <div class="card" >
                  <div class="card-header">
                    <h4>화상 대화 게시판</h4>
                  </div>
                  <div class="card-body">
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
                                <button class="btn btn-primary push" onclick="location.href='zinsertView.bo';">글쓰기</button>
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
		                                            	<c:url var="pagination" value="zoom.bo">
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
													<c:url var="after" value="zoom.bo">
														<c:param name="page" value="${ pi.currentPage + 1 }"/>
														<c:param name="category" value="${ category }"/>
													</c:url>
	                                                <li class="page-item">
	                                                    <a class="page-link" href="${ after }" aria-label="Next">
	                                                        <i class="fas fa-angle-right"></i>
	                                                    </a>
	                                                </li>
													
													<c:url var="end" value="zoom.bo">
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
	
<!--                     <div id="accordion"> -->
<!--                       <div class="accordion"> -->
<!--                         <div class="accordion-header" role="button" data-toggle="collapse" data-target="#panel-body-1" aria-expanded="true"> -->
<!--                           <h4>2021-12-27</h4> -->
<!--                         </div> -->
<!--                         <div class="accordion-body collapse show" id="panel-body-1" data-parent="#accordion"> -->
<!--                           <p class="mb-0">오늘 회의는 화상으로 진행합니다. 반드시 참석해주세요.</p> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <div class="accordion"> -->
<!--                         <div class="accordion-header" role="button" data-toggle="collapse" data-target="#panel-body-2"> -->
<!--                           <h4>2021-12-17</h4> -->
<!--                         </div> -->
<!--                         <div class="accordion-body collapse" id="panel-body-2" data-parent="#accordion"> -->
<!--                           <p class="mb-0">퇴사하고 싶어요...</p> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <div class="accordion"> -->
<!--                         <div class="accordion-header" role="button" data-toggle="collapse" data-target="#panel-body-3"> -->
<!--                           <h4>2021-12-14</h4> -->
<!--                         </div> -->
<!--                         <div class="accordion-body collapse" id="panel-body-2" data-parent="#accordion"> -->
<!--                           <p class="mb-0">회의 불참합니다.</p> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <div class="accordion"> -->
<!--                         <div class="accordion-header" role="button" data-toggle="collapse" data-target="#panel-body-4"> -->
<!--                           <h4>2021-12-07</h4> -->
<!--                         </div> -->
<!--                         <div class="accordion-body collapse" id="panel-body-3" data-parent="#accordion"> -->
<!--                           <p class="mb-0">Zoom 회의 참가 -->
<!-- https://zoom.us/j/97669409222?pwd=NUFDVFVKRWN1eW41OU5wN1E2bURrZz09 -->
<!--                           </p> -->
<!--                         </div> -->
<!--                       </div> -->
                      
<!--                     </div> -->
                  </div>
                </div>
              </div>
        </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
<!--         <div class="float-center"> -->
<!--                       <nav> -->
<!--                         <ul class="pagination"> -->
<!--                           <li class="page-item disabled"> -->
<!--                             <a class="page-link" href="#" aria-label="Previous"> -->
<!--                               <span aria-hidden="true">&laquo;</span> -->
<!--                               <span class="sr-only">Previous</span> -->
<!--                             </a> -->
<!--                           </li> -->
<!--                           <li class="page-item active"> -->
<!--                             <a class="page-link" href="#">1</a> -->
<!--                           </li> -->
<!--                           <li class="page-item"> -->
<!--                             <a class="page-link" href="#">2</a> -->
<!--                           </li> -->
<!--                           <li class="page-item"> -->
<!--                             <a class="page-link" href="#">3</a> -->
<!--                           </li> -->
<!--                           <li class="page-item"> -->
<!--                             <a class="page-link" href="#">4</a> -->
<!--                           </li> -->
<!--                           <li class="page-item"> -->
<!--                             <a class="page-link" href="#">5</a> -->
<!--                           </li> -->
<!--                           <li class="page-item"> -->
<!--                             <a class="page-link" href="#" aria-label="Next"> -->
<!--                               <span aria-hidden="true">&raquo;</span> -->
<!--                               <span class="sr-only">Next</span> -->
<!--                             </a> -->
<!--                           </li> -->
<!--                         </ul> -->
<!--                       </nav> -->
<!--                     </div> -->
                    
                    
                    
                    
                    
                    
                    
                    

            <!-- General JS Scripts -->
            <script src="../../../resources/dist/assets/modules/jquery.min.js"></script>
            <script src="../../../resources/dist/assets/modules/popper.js"></script>
            <script src="../../../resources/dist/assets/modules/tooltip.js"></script>
            <script src="../../../resources/dist/assets/modules/bootstrap/js/bootstrap.min.js"></script>
            <script src="../../../resources/dist/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
            <script src="../../../resources/dist/assets/modules/moment.min.js"></script>
            <script src="../../../resources/dist/assets/js/stisla.js"></script>

            <!-- JS Libraies -->

            <!-- Page Specific JS File -->

            <!-- Template JS File -->
            <script src="../../../resources/dist/assets/js/scripts.js"></script>
            <script src="../../../resources/dist/assets/js/custom.js"></script>
            
            <script src="../../vendor/global/global.min.js"></script>
	    <script src="../../js/quixnav-init.js"></script>
	    <script src="../../js/custom.min.js"></script>
	    
	    <!-- General JS Scripts -->
  <script src="../../../resources/dist/assets/modules/jquery.min.js"></script>
  <script src="../../../resources/dist/assets/modules/popper.js"></script>
  <script src="../../../resources/dist/assets/modules/tooltip.js"></script>
  <script src="../../../resources/dist/assets/modules/bootstrap/js/bootstrap.min.js"></script>
  <script src="../../../resources/dist/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
  <script src="../../../resources/dist/assets/modules/moment.min.js"></script>
  <script src="../../../resources/dist/assets/js/stisla.js"></script>
  
  <!-- JS Libraies -->

  <!-- Page Specific JS File -->
  
  <!-- Template JS File -->
<!--   <script src="../../../resources/dist/assets/js/scripts.js"></script> -->
<!--   <script src="../../../resources/dist/assets/js/custom.js"></script> -->
</body>
</html>