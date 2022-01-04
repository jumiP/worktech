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
	.section-title{
 		display: inline;
 	}
 	
 	h4.section-title{
 		top: -13px;
 	}
 	
 	#searchBtn{
 		height: 100%;
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
              <div class="breadcrumb-item">개인 주소록</div>
            </div>
          </div>

          <div class="section-body">
            <div>
              <h2 class="section-title">개인 주소록</h2>
              <div class="text-right">
              	<button class="btn btn-icon icon-left btn-primary" onclick="addContact();" type="button"><i class="far fa-edit"></i> 추가</button>
              	<button class="btn btn-icon icon-left btn-danger" type="button"><i class="fas fa-times"></i> 삭제</button>
              </div>
            </div>
            <br>
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                  	<h4 class="section-title">개인 주소록</h4>
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
            
                  <div class="card-body">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>
                            <div class="custom-checkbox custom-control">
                              <input type="checkbox"class="custom-control-input" id="checkbox-all">
                              <label for="checkbox-all" class="custom-control-label">&nbsp;</label>
                            </div>
                          </th>
                          <th scope="col">이름</th>
                          <th scope="col">전화번호</th>
                          <th scope="col">이메일</th>
                          <th scope="col">회사</th>
                          <th scope="col">부서명</th>
                          <th scope="col">직책</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="p-0 text-center">
                            <div class="custom-checkbox custom-control">
                              <input type="checkbox"class="custom-control-input" id="checkbox-1">
                              <label for="checkbox-1" class="custom-control-label">&nbsp;</label>
                            </div>
                          </td>
                          <td>김사원</td>
                          <td>010-1111-2222</td>
                          <td>kim@work.tech</td>
                          <td>워크테크</td>
                          <td>영업부</td>
                          <td>사원</td>
                        </tr>
                        <tr>
                          <td class="p-0 text-center">
                            <div class="custom-checkbox custom-control">
                              <input type="checkbox"class="custom-control-input" id="checkbox-2">
                              <label for="checkbox-2" class="custom-control-label">&nbsp;</label>
                            </div>
                          </td>
                          <td>김사원</td>
                          <td>010-1111-2222</td>
                          <td>kim@work.tech</td>
                          <td>워크테크</td>
                          <td>영업부</td>
                          <td>사원</td>
                        </tr>
                        <tr>
                          <td class="p-0 text-center">
                            <div class="custom-checkbox custom-control">
                              <input type="checkbox"class="custom-control-input" id="checkbox-3">
                              <label for="checkbox-3" class="custom-control-label">&nbsp;</label>
                            </div>
                          </td>
                          <td>김사원</td>
                          <td>010-1111-2222</td>
                          <td>kim@work.tech</td>
                          <td>워크테크</td>
                          <td>영업부</td>
                          <td>사원</td>
                        </tr>
                      </tbody>
                    </table>
                    
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