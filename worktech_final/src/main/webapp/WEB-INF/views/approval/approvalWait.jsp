<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>전자 결재</title>
	<style>
		.section-header{
			padding: 20px, 35px;
			margin: -10px, -30px, 30px;
		}
	</style>
</head>

<body>
	<c:import url="../common/headerUser.jsp" />
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<div class="section-header">
				<h1>결재 대기함</h1>
				<div class="section-header-breadcrumb">
					<div class="breadcrumb-item active">
						<a href="#">전자 결재</a>
					</div>
					<div class="breadcrumb-item">결제 대기함</div>
				</div>
			</div>
			
			<div class="col-12 col-md-12 col-lg-12">
                <div class="card">
                  <form method="post" class="needs-validation" >
                    <div class="card-header">
                      <h4>검색창</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">                               
                          <div class="form-group col-md-6 col-12">
                            <label>문서 제목</label>
                            <input type="text" class="form-control" >
                            <div class="invalid-feedback">
                              Please fill in the first name
                            </div>
                          </div>
                          <div class="form-group col-md-6 col-12">
                            <label>문서 </label>
                            <input type="text" class="form-control" >
                            <div class="invalid-feedback">
                              Please fill in the last name
                            </div>
                          </div>
                        </div>
                    </div>
                    
                    <div class="card">
                  		<div class="card-body">
                  			<div class="row">
                    		<div class="form-group col-md-6 col-12">
                      		<label>Date Range Picker</label>
                      			<div class="input-group">
                        			<div class="input-group-prepend">
                          				<div class="input-group-text">
                            				<i class="fas fa-calendar"></i>
                          				</div>
                        			</div>
                        			<input type="text" class="form-control daterange-cus">
                      			</div>
                    		</div>
	                  		<div class="card-footer text-right">
	                     		<button class="btn btn-primary">Save Changes</button>
	                    	</div>                    		
                  		</div>
                	</div>
                	</div>
                	

                  </form>
            	</div>
            </div>
			
			<div class="table-responsive">
				<h2 class="section-title">결제 대기</h2>
				<div class="row">
					<div class="col-12 col-md-12 col-lg-12">
						<div class="card">
							<div class="row row-cols-1 row-cols-md-3 mb-3">
								<div class="col">
									<div class="card mb-4 rounded-3 shadow-sm">
										<table class="table">
											<tbody>
												<tr>
													<td rowspan="2">
														<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
			  												<path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
			  												<path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5L9.5 0zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"/>
														</svg>
													</td>
													<td><h4 class="my-0 fw-normal">예산 증액 관련 협조요청</h4></td>
													<td><h4 class="my-0 fw-normal">OOO 대리</h4></td>
													<td rowspan="2">진행중 - 취소</td>
												</tr>
												<tr>
													<td>기안일 : 2021.12.11 | 13:34</td>
													<td>보안팀</td>
												</tr>
											</tbody>
						          		</table>
						       		</div>
						       		
									<div class="card mb-4 rounded-3 shadow-sm">
										<table class="table">
											<tbody>
												<tr>
													<td rowspan="2">
														<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
			  												<path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
			  												<path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5L9.5 0zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"/>
														</svg>
													</td>
													<td><h4 class="my-0 fw-normal">예산 증액 관련 협조요청</h4></td>
													<td><h4 class="my-0 fw-normal">OOO 대리</h4></td>
													<td rowspan="2">진행중 - 취소</td>
												</tr>
												<tr>
													<td>기안일 : 2021.12.11 | 13:34</td>
													<td>보안팀</td>
												</tr>
											</tbody>
						          		</table>
						       		</div>
						       		
									<div class="card mb-4 rounded-3 shadow-sm">
										<table class="table">
											<tbody>
												<tr>
													<td rowspan="2">
														<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
			  												<path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
			  												<path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5L9.5 0zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"/>
														</svg>
													</td>
													<td><h4 class="my-0 fw-normal">예산 증액 관련 협조요청</h4></td>
													<td><h4 class="my-0 fw-normal">OOO 대리</h4></td>
													<td rowspan="2">진행중 - 취소</td>
												</tr>
												<tr>
													<td>기안일 : 2021.12.11 | 13:34</td>
													<td>보안팀</td>
												</tr>
											</tbody>
						          		</table>
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
	
	<script src="resources/dist/assets/assets/modules/jquery.min.js"></script>
	<script src="resources/dist/assets/assets/modules/popper.js"></script>
	<script src="resources/dist/assets/assets/modules/tooltip.js"></script>
	<script src="resources/dist/assets/assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/dist/assets/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="resources/dist/assets/assets/modules/moment.min.js"></script>
	<script src="resources/dist/assets/assets/js/stisla.js"></script>
	
	<script src="resources/dist/assets/assets/modules/cleave-js/dist/cleave.min.js"></script>
	<script src="resources/dist/assets/assets/modules/cleave-js/dist/addons/cleave-phone.us.js"></script>
	<script src="resources/dist/assets/assets/modules/jquery-pwstrength/jquery.pwstrength.min.js"></script>
	<script src="resources/dist/assets/modules/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script src="resources/dist/assets/assets/modules/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	<script src="resources/dist/assets/assets/modules/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="resources/dist/assets/assets/modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
	<script src="resources/dist/assets/assets/modules/select2/dist/js/select2.full.min.js"></script>
	<script src="resources/dist/assets/assets/modules/jquery-selectric/jquery.selectric.min.js"></script>
	
	<script src="resources/dist/assets/assets/js/page/forms-advanced-forms.js"></script>
	<div class="daterangepicker dropdown-menu ltr show-calendar opensright" style="top: 2188.98px; left: 1200.88px; right: auto; display: block;"><div class="calendar left"><div class="daterangepicker_input"><input class="input-mini form-control active" type="text" name="daterangepicker_start" value=""><i class="fa fa-calendar glyphicon glyphicon-calendar"></i><div class="calendar-time" style="display: none;"><div></div><i class="fa fa-clock-o glyphicon glyphicon-time"></i></div></div><div class="calendar-table"><table class="table-condensed"><thead><tr><th class="prev available"><i class="fa fa-chevron-left glyphicon glyphicon-chevron-left"></i></th><th colspan="5" class="month">Dec 2021</th><th></th></tr><tr><th>Su</th><th>Mo</th><th>Tu</th><th>We</th><th>Th</th><th>Fr</th><th>Sa</th></tr></thead><tbody><tr><td class="weekend off available" data-title="r0c0">28</td><td class="off available" data-title="r0c1">29</td><td class="off available" data-title="r0c2">30</td><td class="available" data-title="r0c3">1</td><td class="available" data-title="r0c4">2</td><td class="available" data-title="r0c5">3</td><td class="weekend available" data-title="r0c6">4</td></tr><tr><td class="weekend available" data-title="r1c0">5</td><td class="available" data-title="r1c1">6</td><td class="available" data-title="r1c2">7</td><td class="available" data-title="r1c3">8</td><td class="available" data-title="r1c4">9</td><td class="active start-date available" data-title="r1c5">10</td><td class="weekend in-range available" data-title="r1c6">11</td></tr><tr><td class="weekend in-range available" data-title="r2c0">12</td><td class="in-range available" data-title="r2c1">13</td><td class="in-range available" data-title="r2c2">14</td><td class="in-range available" data-title="r2c3">15</td><td class="in-range available" data-title="r2c4">16</td><td class="in-range available" data-title="r2c5">17</td><td class="weekend in-range available" data-title="r2c6">18</td></tr><tr><td class="weekend in-range available" data-title="r3c0">19</td><td class="in-range available" data-title="r3c1">20</td><td class="today in-range available" data-title="r3c2">21</td><td class="in-range available" data-title="r3c3">22</td><td class="in-range available" data-title="r3c4">23</td><td class="in-range available" data-title="r3c5">24</td><td class="weekend in-range available" data-title="r3c6">25</td></tr><tr><td class="weekend in-range available" data-title="r4c0">26</td><td class="in-range available" data-title="r4c1">27</td><td class="in-range available" data-title="r4c2">28</td><td class="in-range available" data-title="r4c3">29</td><td class="in-range available" data-title="r4c4">30</td><td class="in-range available" data-title="r4c5">31</td><td class="weekend off in-range available" data-title="r4c6">1</td></tr><tr><td class="weekend off in-range available" data-title="r5c0">2</td><td class="off in-range available" data-title="r5c1">3</td><td class="off in-range available" data-title="r5c2">4</td><td class="off in-range available" data-title="r5c3">5</td><td class="off in-range available" data-title="r5c4">6</td><td class="off in-range available" data-title="r5c5">7</td><td class="weekend off in-range available" data-title="r5c6">8</td></tr></tbody></table></div></div><div class="calendar right"><div class="daterangepicker_input"><input class="input-mini form-control" type="text" name="daterangepicker_end" value=""><i class="fa fa-calendar glyphicon glyphicon-calendar"></i><div class="calendar-time" style="display: none;"><div></div><i class="fa fa-clock-o glyphicon glyphicon-time"></i></div></div><div class="calendar-table"><table class="table-condensed"><thead><tr><th></th><th colspan="5" class="month">Jan 2022</th><th class="next available"><i class="fa fa-chevron-right glyphicon glyphicon-chevron-right"></i></th></tr><tr><th>Su</th><th>Mo</th><th>Tu</th><th>We</th><th>Th</th><th>Fr</th><th>Sa</th></tr></thead><tbody><tr><td class="weekend off in-range available" data-title="r0c0">26</td><td class="off in-range available" data-title="r0c1">27</td><td class="off in-range available" data-title="r0c2">28</td><td class="off in-range available" data-title="r0c3">29</td><td class="off in-range available" data-title="r0c4">30</td><td class="off in-range available" data-title="r0c5">31</td><td class="weekend in-range available" data-title="r0c6">1</td></tr><tr><td class="weekend in-range available" data-title="r1c0">2</td><td class="in-range available" data-title="r1c1">3</td><td class="in-range available" data-title="r1c2">4</td><td class="in-range available" data-title="r1c3">5</td><td class="in-range available" data-title="r1c4">6</td><td class="in-range available" data-title="r1c5">7</td><td class="weekend in-range available" data-title="r1c6">8</td></tr><tr><td class="weekend in-range available" data-title="r2c0">9</td><td class="in-range available" data-title="r2c1">10</td><td class="in-range available" data-title="r2c2">11</td><td class="in-range available" data-title="r2c3">12</td><td class="active end-date in-range available" data-title="r2c4">13</td><td class="available" data-title="r2c5">14</td><td class="weekend available" data-title="r2c6">15</td></tr><tr><td class="weekend available" data-title="r3c0">16</td><td class="available" data-title="r3c1">17</td><td class="available" data-title="r3c2">18</td><td class="available" data-title="r3c3">19</td><td class="available" data-title="r3c4">20</td><td class="available" data-title="r3c5">21</td><td class="weekend available" data-title="r3c6">22</td></tr><tr><td class="weekend available" data-title="r4c0">23</td><td class="available" data-title="r4c1">24</td><td class="available" data-title="r4c2">25</td><td class="available" data-title="r4c3">26</td><td class="available" data-title="r4c4">27</td><td class="available" data-title="r4c5">28</td><td class="weekend available" data-title="r4c6">29</td></tr><tr><td class="weekend available" data-title="r5c0">30</td><td class="available" data-title="r5c1">31</td><td class="off available" data-title="r5c2">1</td><td class="off available" data-title="r5c3">2</td><td class="off available" data-title="r5c4">3</td><td class="off available" data-title="r5c5">4</td><td class="weekend off available" data-title="r5c6">5</td></tr></tbody></table></div></div><div class="ranges"><div class="range_inputs"><button class="applyBtn btn btn-sm btn-success" type="button">Apply</button> <button class="cancelBtn btn btn-sm btn-default" type="button">Cancel</button></div></div></div>

</body>

</html>