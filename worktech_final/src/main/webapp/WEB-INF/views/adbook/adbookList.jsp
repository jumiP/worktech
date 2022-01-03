<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<title>사내 주소록</title>
<style>
	h4.section-title{
		top: -13px;
	}
	
	#searchBtn{
		height: 100%;
	}
	
	.paging-area {
            display: flex;
            justify-content: center;
    }
</style>
</head>
<body>
	<c:import url="../common/headerUser.jsp" />
	
	<!-- Main Content -->
	<div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>주소록</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="#">주소록</a></div>
              <div class="breadcrumb-item">사내 주소록</div>
            </div>
          </div>

          <div class="section-body">
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4 class="section-title">사내 주소록</h4>
                    <div class="card-header-form">
                      
                      <!-- 사내 주소록 검색 -->
                      <form>
                        <div class="input-group">
                          <input type="text" class="form-control" placeholder="Search">
                          <div class="input-group-btn">
                            <button class="btn btn-primary" id="searchBtn"><i class="fas fa-search"></i></button>
                          </div>
                        </div>
                      </form>
                      
                    </div>
                  </div>
                  <div class="card-body p-0">
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
	                        <tr>
	                          <th>이름</th>
	                          <th>전화번호</th>
	                          <th>이메일</th>
	                          <th>부서</th>
	                          <th>직책</th>
	                          <th>입사일</th>
	                        </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="a" items="${ list }">
                        		<tr>
                        			<td><img alt="image" src="resources/dist/assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="tooltip" title="Wildan Ahdian">&nbsp;&nbsp;&nbsp;${ a.name }</td>
                        			<td>${ a.phone }</td>
                        			<td>${ a.email }</td>
                        			<td>${ a.dName }</td>
                        			<td>${ a.jobGrade }</td>
                        			<td>${ a.hireDate }</td>
                        		</tr>
                        	</c:forEach>
                        </tbody>
                      </table>
					  <br clear="all">                      
                      <!-- 주소록 페이지 이동 버튼 -->
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
                      					<c:url var="start" value="adbookList.ab">
                      						<c:param name="page" value="1"/>
                      					</c:url>
                      					<li class="page-item">
                      						<a class="page-link" href="${ start }" aria-label="Previous">
                      							<i class="fas fa-angle-double-left"></i>
                      						</a>
                      					</li>
                      					<c:url var="before" value="adbookList.ab">
                      						<c:param name="page" value="${ pi.currentPage - 1 }"/>
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
                      						<c:url var="pagination" value="adbookList.ab">
                      							<c:param name="page" value="${ p }"/>
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
                      					<c:url var="after" value="adbookList.ab">
                      						<c:param name="page" value="${ pi.currentPage + 1 }"/>
                      					</c:url>
                      					<li class="page-item">
                      						<a class="page-link" href="${ after }" aria-label="Next">
                      							<i class="fas fa-angle-right"></i>
                      						</a>
                      					</li>
                      					<c:url var="end" value="adbookList.ab">
                      						<c:param name="page" value="${ pi.maxPage }"/>
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
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      
      <c:import url="../common/footer.jsp" />
</body>
</html>