<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>캘린더 </title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../images/favicon.png">

    <link href="../../vendor/fullcalendar/css/fullcalendar.min.css" rel="stylesheet">
    <link href="../../css/style.css" rel="stylesheet">
<meta charset="UTF-8">
<title>개인 캘린더</title>
</head>
<body>
<c:import url="common/headerUser.jsp" />

<!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>CALENDAR</h4>
                            <p class="mb-0">일정 관리</p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Calendar</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-intro-title">카테고리</h4>

                                <div class="">
                                    <div id="external-events" class="my-3">
                                        <div class="external-event" data-class="bg-primary"><i class="fa fa-move"></i>회의</div>
                                        <div class="external-event" data-class="bg-success"><i class="fa fa-move"></i>기념일</div>
                                        <div class="external-event" data-class="bg-warning"><i class="fa fa-move"></i>업무</div>
                                        <div class="external-event" data-class="bg-dark"><i class="fa fa-move"></i>프로젝트</div>
                                    </div>
                                    <!-- checkbox -->
                                    <div class="checkbox checkbox-event pt-3 pb-5">
                                        <input id="drop-remove" class="styled-checkbox" type="checkbox">
                                        <label class="ml-2 mb-0" for="drop-remove">삭제하기</label>
                                    </div>
                                    <a href="javascript:void()" data-toggle="modal" data-target="#add-category" class="btn btn-primary btn-event w-100">
                                        <span class="align-middle"><i class="ti-plus"></i></span> 추가하기
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="card">
                            <div class="card-body">
                                <div id="calendar" class="app-fullcalendar"></div>
                            </div>
                        </div>
                    </div>
                    <!-- BEGIN MODAL -->
                    <div class="modal fade none-border" id="event-modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title"><strong>Add New Event</strong></h4>
                                </div>
                                <div class="modal-body"></div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-success save-event waves-effect waves-light">Create
                                        event</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Add Category -->
                    <div class="modal fade none-border" id="add-category">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title"><strong>카테고리 추가</strong></h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Category</label>
                                                <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name">
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">Color</label>
                                                <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                                    <option value="success">Success</option>
                                                    <option value="danger">Danger</option>
                                                    <option value="info">Info</option>
                                                    <option value="pink">Pink</option>
                                                    <option value="primary">Primary</option>
                                                    <option value="warning">Warning</option>
                                                </select>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div><br><br>
            <!-- todo -->
            <div>
            <p style="font-size:28px; font-weight:bold;">TO DO LIST</p>
        	<form>
        	<div class="form-group">
                   <div class="input-group mb-3">
                      <input type="text" class="form-control" placeholder="" aria-label="">
                      <div class="input-group-append">
                      <button class="btn btn-primary" type="button">추가</button>
                      </div>
                    </div>
             </div>
        	</form>
        	<div>
        		<ul>
        			<li>
                      <div class="row gutters-xs">
                        <div class="col-auto" >
                          <label class="colorinput">
                            <input name="color" type="checkbox" value="primary" class="colorinput-input" />
                            <span class="colorinput-color bg-primary"></span>
                          </label>
                        </div><input type="text" maxlength=30 size="100" placeholder="메모 입력하세요" class="todolist">
                         <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button><br>
        				</div>
        				<div class="row gutters-xs">
        				 <div class="col-auto">
                          <label class="colorinput">
                            <input name="color" type="checkbox" value="primary" class="colorinput-input" />
                            <span class="colorinput-color bg-primary"></span>
                          </label>
                        </div><input type="text" maxlength=30 size="100" placeholder="메모 입력하세요" class="todolist"><br>
                         <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button><br>
        			</div>
        			<div class="row gutters-xs">
        				 <div class="col-auto">
                          <label class="colorinput">
                            <input name="color" type="checkbox" value="primary" class="colorinput-input" />
                            <span class="colorinput-color bg-primary"></span>
                          </label>
                        </div><input type="text" maxlength=30 size="100" placeholder="메모 입력하세요" class="todolist"><br>
                         <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button><br>
        			</div>
        			<div class="row gutters-xs">
        				 <div class="col-auto">
                          <label class="colorinput">
                            <input name="color" type="checkbox" value="primary" class="colorinput-input" />
                            <span class="colorinput-color bg-primary"></span>
                          </label>
                        </div><input type="text" maxlength=30 size="100" placeholder="메모 입력하세요" class="todolist"><br>
                         <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button><br>
        			</div>
        			<div class="row gutters-xs">
        				 <div class="col-auto">
                          <label class="colorinput">
                            <input name="color" type="checkbox" value="primary" class="colorinput-input" />
                            <span class="colorinput-color bg-primary"></span>
                          </label>
                        </div><input type="text" maxlength=30 size="100" placeholder="메모 입력하세요" class="todolist"><br>
                         <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button><br>
        			</div>
        			<div class="row gutters-xs">
        				 <div class="col-auto">
                          <label class="colorinput">
                            <input name="color" type="checkbox" value="primary" class="colorinput-input" />
                            <span class="colorinput-color bg-primary"></span>
                          </label>
                        </div><input type="text" maxlength=30 size="100" placeholder="메모 입력하세요" class="todolist"><br>
                         <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button><br>
        			</div>
        			<div class="row gutters-xs">
        				 <div class="col-auto">
                          <label class="colorinput">
                            <input name="color" type="checkbox" value="primary" class="colorinput-input" />
                            <span class="colorinput-color bg-primary"></span>
                          </label>
                        </div><input type="text" maxlength=30 size="100" placeholder="메모 입력하세요" class="todolist"><br>
                         <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button><br>
        			</div>
        			</li>
        		</ul>
        	</div>
        </div>
        </div>
       
        
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a> 2019</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->

        


    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="../../vendor/global/global.min.js"></script>
    <script src="../../js/quixnav-init.js"></script>
    <script src="../../js/custom.min.js"></script>
    <!--removeIf(production)-->
    <!-- Demo scripts -->
    <script src="../../js/styleSwitcher.js"></script>



    <script src="../../vendor/jqueryui/js/jquery-ui.min.js"></script>
    <script src="../../vendor/moment/moment.min.js"></script>

    <script src="../../vendor/fullcalendar/js/fullcalendar.min.js"></script>
    <script src="../../js/fullcalendar-init.js"></script>


</body>
</html>