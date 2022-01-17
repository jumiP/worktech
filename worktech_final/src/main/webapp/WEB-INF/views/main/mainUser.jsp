<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>main</title>

<style>
   .memCard{
      display: flex;
      height: 150px;
   }
   
   #memImg{
      width: 90px;
   }
   
   .memItem{
      flex-basis: 33%;
       align-self: center;
   }
   
   #comTable{
      width: 100%;
      text-align: center;
   }
   
   #comTable td{
      border: none;
   }
   
   .comBtn{
      margin-right: 10%;
   }
   
   #tableCard{
      height: 330px;
   }
   
   .boardTable {
      width: 100%;
        border-collapse: collapse;
        background: white;
    }
    
    .boardTable th, td {
        border-bottom: 1px solid #e3e3e3;
       vertical-align: middle;
       text-align: center;
       font-size: 13px;
       height: 40px;
   }

    .boardTable th {
       border-bottom: none;
        background-color: rgba(0, 0, 0, 0.04);
       color: #666;
    }

   .boardBtn{
      border: none;
      border-bottom: 1px solid #e3e3e3;
      background: none;
   }
   
   .boardBtn:focus{
		outline: none;
   }
   
   .boardBtn:hover{
		cursor: pointer;
   }
   
   #searchIcon {
      padding: 15px;
   }
   
   #searchItem {
      margin-top: 12px;
   }
   
</style>

</head>
<body>

   <c:import url="common/headerUser.jsp" />
   
   <!-- Main Content -->
   <div class="main-content">
      <section class="section">
         <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12">
               <div class="card">
                  <div class="card-body text-center memCard">
                     <div class="memItem">
                     	<c:if test="${ loginUser.profile.pUrl eq null }">
	                        <img alt="image" src="resources/dist/assets/img/avatar/avatar-4.png" class="rounded-circle" id="memImg">
                     	</c:if>
                     	<c:if test="${ loginUser.profile.pUrl ne null }">
	                        <img alt="image" src="resources/profileUploadFiles/${ loginUser.profile.pReName }" class="rounded-circle" id="memImg" width="90" height="90">
                     	</c:if>
                     </div>
                     <div class="memItem">
                        <h5>${ loginUser.name }</h5>
                        <label>${ loginUser.dName } ${ loginUser.jobGrade }</label>
                     </div>
                     <div class="memItem">
                        <h5>결재 대기 문서</h5>
                        <label>5개</label>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12">
               <div class="card">
                  <div class="card-body memCard">
                     <table id="comTable" style="width: 100%; text-align: center; border: none;">
                        <tr>
                           <td style="width: 30%;"><h5 style="display: inline-block">근태 관리</h5></td>
                           <td style="width: 50%;">0시간 0분</td>
                           <td>
	                           <c:if test="${ empty qr || qr.file_name eq null }">
	                              <button class="btn btn-warning btn-sm comBtn" onclick="createQR()">QR코드 생성</button>
	                           </c:if>
	                           <c:if test="${ !empty qr && qr.file_name ne null }">
	                              <button class="btn btn-primary btn-sm comBtn" onclick="popup()">QR코드 보기</button>
	                           </c:if>
                           </td>
                        </tr>
                        <tr>
                           <td>출근 시간</td>      
                           <td><div id="test1" name="goWork"></div></td>                     
                           <td style="text-align: right;"><button class="btn btn-primary btn-sm comBtn" onclick="gowork()">출근하기</button></td>
                        </tr>
                        <tr>
                           <td>퇴근 시간</td>
                           <td><div id="test2" name="leaveWork"></div></td>
                           <td style="text-align: right;"><button class="btn btn-primary btn-sm comBtn" onclick="location.href='leavework.co'">퇴근하기</button></td>
                        </tr>
                     </table>
                  </div>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-12">
               <div class="card">
                  <div class="card-body" id="tableCard">
                     <div>
                        <button class="boardBtn" id="noticeBtn" onclick="clickBtn(this);">공지사항</button>&nbsp;
                        <button class="boardBtn" id="generalBtn" onclick="clickBtn(this);">일반 게시판</button>&nbsp;
                        <button class="boardBtn" id="anonymousBtn" onclick="clickBtn(this);">익명 게시판</button>
                     </div>
                     <br>
                     <div id="noticeBoard">
                        <table class="boardTable" id="noticeTable">
                                  <thead>
                                      <tr>
                                          <th style="width: 150px;">글 번호</th>
                                          <th style="width: 450px;">글 제목</th>
                                          <th style="width: 110px;">작성자</th>
                                          <th style="width: 170px;">작성일</th>
                                          <th style="width: 100px;">조회수</th>
                                      </tr>
                                  </thead>
                                  <tbody id="noticeBody">
                                  </tbody>
                              </table>
                           </div>
                           <div id="commonBoard">
							<table class="boardTable" id="commonTable">
	                            <thead>
	                                <tr>
	                                    <th style="width: 150px;">글 번호</th>
	                                    <th style="width: 450px;">글 제목</th>
	                                    <th style="width: 110px;">작성자</th>
	                                    <th style="width: 170px;">작성일</th>
	                                    <th style="width: 100px;">조회수</th>
	                                </tr>
	                            </thead>
	                            <tbody id="commonBody">
	                            </tbody>
	                        </table>
                        </div>
                           <div id="anonymousBoard">
                        <table class="boardTable">
                                  <thead>
                                      <tr>
                                          <th style="width: 150px;">글 번호</th>
                                          <th style="width: 450px;">글 제목</th>
                                          <th style="width: 110px;">작성자</th>
                                          <th style="width: 170px;">작성일</th>
                                          <th style="width: 100px;">조회수</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                      <tr>
                                          <td>1</td>
                                          <td>점심 뭐 드셨나요?</td>
                                          <td>관리자</td>
                                          <td>2021-12-19</td>
                                          <td>1</td>
                                      </tr>
                                      <tr>
                                          <td>2</td>
                                          <td>월요일 출근은 정말 지옥 같네요</td>
                                          <td>관리자</td>
                                          <td>2021-12-19</td>
                                          <td>1</td>
                                      </tr>
                                      <tr>
                                          <td>3</td>
                                          <td>게시판 작성</td>
                                          <td>관리자</td>
                                          <td>2021-12-19</td>
                                          <td>1</td>
                                      </tr>
                                      <tr>
                                          <td>4</td>
                                          <td>게시판 작성</td>
                                          <td>관리자</td>
                                          <td>2021-12-19</td>
                                          <td>1</td>
                                      </tr>
                                      <tr>
                                          <td>5</td>
                                          <td>게시판 작성</td>
                                          <td>관리자</td>
                                          <td>2021-12-19</td>
                                          <td>1</td>
                                      </tr>
                                  </tbody>
                              </table>
                           </div>
                  </div>
               </div>
            </div>
         </div>
         
      </section>
      
      <!-- todo start -->
   <div class="col-md-5 grid-margin stretch-card">
                     <div class="card">
                        <div class="card-body">
                           <h4 class="card-title">To Do Lists</h4>
                           <div class="list-wrapper pt-2">
                              <ul class="d-flex flex-column-reverse todo-list todo-list-custom">
                                 <li>
                                    <div class="form-check form-check-flat">
                                       <label class="form-check-label">
                                          <input class="checkbox" type="checkbox">
                                          Become A Travel Pro In One Easy Lesson
                                       </label>
                                    </div>
                                    <i class="remove ti-trash"></i>
                                 </li>
                                 <li class="completed">
                                    <div class="form-check form-check-flat">
                                       <label class="form-check-label">
                                          <input class="checkbox" type="checkbox" checked>
                                          See The Unmatched Beauty Of The Great Lakes
                                       </label>
                                    </div>
                                    <i class="remove ti-trash"></i>
                                 </li>
                                 <li>
                                    <div class="form-check form-check-flat">
                                       <label class="form-check-label">
                                          <input class="checkbox" type="checkbox">
                                          Copper Canyon
                                       </label>
                                    </div>
                                    <i class="remove ti-trash"></i>
                                 </li>
                                 <li class="completed">
                                    <div class="form-check form-check-flat">
                                       <label class="form-check-label">
                                          <input class="checkbox" type="checkbox" checked>
                                          Top Things To See During A Holiday In Hong Kong
                                       </label>
                                    </div>
                                    <i class="remove ti-trash"></i>
                                 </li>
                                 <li>
                                    <div class="form-check form-check-flat">
                                       <label class="form-check-label">
                                          <input class="checkbox" type="checkbox">
                                          Travelagent India
                                       </label>
                                    </div>
                                    <i class="remove ti-trash"></i>
                                 </li>
                              </ul>
                  </div>
                  <div class="add-items d-flex mb-0 mt-4">
                              <input type="text" class="form-control todo-list-input mr-2"  placeholder="Add new task">
                              <button class="add btn btn-icon text-primary todo-list-add-btn bg-transparent"><i class="ti-location-arrow"></i></button>
                           </div>
                        </div>
                        
                     </div>
            </div>
              <!-- todo end -->
            <!-- calendar start -->
      <div class="col-xl-4 col-md-6 grid-margin stretch-card">
                <!--datepicker-->
                <div class="card">
                  <div class="card-body">
                    <div id="inline-datepicker" class="datepicker table-responsive"></div>
                  </div>
                </div>
                <!--datepicker ends-->
              </div>
         <!-- calendar end -->

   </div>
   
   
   
<script>
		$(function(){
			$('#commonBoard').css('display', 'none');
			$('#anonymousBoard').css('display', 'none');
		});
		
		function clickBtn(btn) {
			if(btn.id == 'noticeBtn'){
				
				$.ajax({
					url: 'noticeRecentList.ad',
					dataType: 'json',
					success: function(data){
						$nTable = $('#noticeBody');
						$nTable.html('');
						console.log(data);
						for(var i in data){
							$tr = $('<tr>');
							$bNo = $('<td>').html(data[i].bNo);
							$bTitle = $('<td>').html(data[i].bTitle);
							$bWriter = $('<td>').html(data[i].name);
							$bDate = $('<td>').html(data[i].bDate);
							$bCount = $('<td>').html(data[i].bCount);
							
							$tr.append($bNo);
							$tr.append($bTitle);
							$tr.append($bWriter);
							$tr.append($bDate);
							$tr.append($bCount);
							
							$nTable.append($tr);
						}
						
					},
					error: function(data){
						console.log(data);
					}
				});
				
				$(btn).html('<b>공지사항</b>');
				$('#generalBtn').html('일반 게시판');
				$('#anonymousBtn').html('익명 게시판');
				$('#noticeBoard').css('display', 'block');
				$('#commonBoard').css('display', 'none');
				$('#anonymousBoard').css('display', 'none');

			} else if(btn.id == 'generalBtn'){
				$.ajax({
					url: 'commonTopList.bo',
					dataType: 'json',
					success: function(data){
						console.log(data);
						
						$cTable = $('#commonBody');
						$cTable.html('');
						
						for(var i in data){
							$tr = $('<tr>');
							$bNo = $('<td>').html(data[i].bNo);
							$bTitle = $('<td>').html("[ " + data[i].categoryName + " ] " + data[i].bTitle);
							$bWriter = $('<td>').html(data[i].name);
							$bDate = $('<td>').html(data[i].bDate);
							$bCount = $('<td>').html(data[i].bCount);
							
							$tr.append($bNo);
							$tr.append($bTitle);
							$tr.append($bWriter);
							$tr.append($bDate);
							$tr.append($bCount);
							
							$cTable.append($tr);
						}
						
					},
					error: function(data){
						console.log(data);
					}
				});
				
				$(btn).html('<b>일반 게시판</b>');
				$('#noticeBtn').html('공지사항');
				$('#anonymousBtn').html('익명 게시판');
				$('#noticeBoard').css('display', 'none');
				$('#commonBoard').css('display', 'block');
				$('#anonymousBoard').css('display', 'none');
			} else if(btn.id == 'anonymousBtn'){
				$(btn).html('<b>익명 게시판</b>');
				$('#noticeBtn').html('공지사항');
				$('#generalBtn').html('일반 게시판');
				$('#noticeBoard').css('display', 'none');
				$('#commonBoard').css('display', 'none');
				$('#anonymousBoard').css('display', 'block');
			}
		}
		
		$(function(){
			$.ajax({
				url: 'noticeRecentList.ad',
				dataType: 'json',
				success: function(data){
					$nTable = $('#noticeBody');
					$nTable.html('');
					console.log(data);
					for(var i in data){
						$tr = $('<tr>');
						$bNo = $('<td>').html(data[i].bNo);
						$bTitle = $('<td>').html(data[i].bTitle);
						$bWriter = $('<td>').html(data[i].name);
						$bDate = $('<td>').html(data[i].bDate);
						$bCount = $('<td>').html(data[i].bCount);
						
						$tr.append($bNo);
						$tr.append($bTitle);
						$tr.append($bWriter);
						$tr.append($bDate);
						$tr.append($bCount);
						
						$nTable.append($tr);
					}
					
				},
				error: function(data){
					console.log(data);
				}
			});
		});
		
		// 게시글 목록 마우스오버, 클릭 이벤트
		$(document).on({
			mouseenter: function() {
				$(this).parent().css({'background':'rgba(0, 0, 0, 0.04)', 'font-weight':'bold', 'cursor':'pointer'});
			},
			mouseout: function() {
				$(this).parent().css({'background':'white', 'font-weight':'normal'});
			},
			click: function() {
				var bNo = $(this).parent().children().eq(0).text();
				var tableID = $(this).closest('table').attr('id');
				
				if(tableID == 'noticeTable'){
					location.href= "ndetail.ad?bNo=" + bNo + '&page=1';
				} else if (tableID == 'commonTable'){
					// 일반 게시판 디테일 이동 작성
					location.href= "cdetail.bo?bNo=" + bNo;
				}
				
			}
		}, '.boardTable tbody td');
		
	</script>
    <script src="resources/dist/assets/vendors/js/vendor.bundle.base.js"></script>
    
        <script>
       function nowTime(){
          var today = new Date();
          var h = today.getHours(); // date의 시 추출
          var m = today.getMinutes(); //date의 분 추출
          h = dasi(h);
          m = dasi(m);
          
          document.getElementById('test1').innerHTML = h+":"+m;
          document.getElementById('test2').innerHTML = h+":"+m;
          var t = setTimeout(function(){nowTime()},1000); // 1초마다 페이지 로드
       }
       
       function dasi(i){
          if(i < 10) {
             i = "0" + i;
          };
          return i;
          // 10보다 작으면 앞자리에 0 추가
       }
       
       
    </script>
    
     <script type="text/javascript">
       function popup(){
          var popup = window.open('qrSelect.co', 'QRCode', 'width=300px,height=300px,scrollbars=yes');
       }
       
       	function createQR() {
    	   alert("QR코드 생성에 성공했습니다.");
    	   location.href='qrMake.co';
		}
       	
       	function gowork() {
       		window.name = "mainPage";
       		var qrURL = window.open('qrcode.co', 'goToWork', 'width=500px,height=500px,scrollbars=yes');
//        		location.href='qrcode.co';
		}
    </script>


  <script src="resources/vendors/chart.js/Chart.min.js"></script>

  <script src="resources/vendors/js/off-canvas.js"></script>
  <script src="resources/vendors/js/hoverable-collapse.js"></script>
  <script src="resources/vendors/js/template.js"></script>
  <script src="resources/vendors/js/todolist.js"></script>

  <script src="resources/vendors/js/dashboard.js"></script>

 
   <c:import url="common/footer.jsp" />
</body>
</html>