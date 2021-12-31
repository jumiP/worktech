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
</style>
</head>
<body>
	<c:import url="common/headerUser.jsp" />
	
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
          	<div>
              <h2 class="section-title">사내 주소록</h2>
            </div>
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4 class="section-title">사내 주소록</h4>
                    <div class="card-header-form">
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
                        <tr>
                          <th>이름</th>
                          <th>전화번호</th>
                          <th>이메일</th>
                          <th>부서</th>
                          <th>직책</th>
                          <th>입사일</th>
                        </tr>
                        <tr>
                          <td><img alt="image" src="resources/dist/assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="tooltip" title="Wildan Ahdian">&nbsp;&nbsp;&nbsp;&nbsp;이사원</td>
                          <td>010-2222-3333</td>
                          <td>lee@work.tech</td>
                          <td>기획부</td>
                          <td>사원</td>
                          <td>2020-11-10</td>
                        </tr>
                        <tr>
                          <td><img alt="image" src="resources/dist/assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="tooltip" title="Wildan Ahdian">&nbsp;&nbsp;&nbsp;&nbsp;이사원</td>
                          <td>010-2222-3333</td>
                          <td>lee@work.tech</td>
                          <td>기획부</td>
                          <td>사원</td>
                          <td>2020-11-10</td>
                        </tr>
                        <tr>
                          <td><img alt="image" src="resources/dist/assets/img/avatar/avatar-5.png" class="rounded-circle" width="35" data-toggle="tooltip" title="Wildan Ahdian">&nbsp;&nbsp;&nbsp;&nbsp;이사원</td>
                          <td>010-2222-3333</td>
                          <td>lee@work.tech</td>
                          <td>기획부</td>
                          <td>사원</td>
                          <td>2020-11-10</td>
                        </tr>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      
      <c:import url="common/footer.jsp" />
</body>
</html>