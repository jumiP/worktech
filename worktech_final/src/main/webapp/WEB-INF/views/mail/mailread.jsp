<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
	name="viewport">
<title>메일 상세보기</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/dist/css/adminlte.min.css">

<style>
.mailSR-info {
	font-size: 14px;
	color: gray;
/* 	vertical-align: middle; */
}

#favorites-icon {
	font-size: 14px;
}

.mail-icon {
	width: 20px;
}

.thispage, .thispage b {
	color: #007bff;
}

.table td, .table th {
	padding: .25rem;
	vertical-align: middle;
}

.table-striped tbody tr:nth-of-type(odd) {
	background-color: rgba(0, 0, 0, 0);
}

.table-hover tbody tr:hover {
	background-color: rgba(0, 0, 0, .075)
}

.table td:nth-child(1) {
	width: 4%;
}

.table td:nth-child(2) {
	width: 8%;
}

.table td:nth-child(3) {
	width: 18%;
}

.table td:nth-child(4) {
	width: 50%;
}

.table td:nth-child(5) {
	text-align: right;
}

.table td:nth-child(6) {
	width: 12%;
	text-align: right;
}

.fa-star {
	margin-right: 8px;
}

.fa-paperclip {
	margin-left: 10px;
}

.mailbox-name a {
	margin-left: 20px;
	text-decoration: none;
}

td {
	height: 35px;
}

.pagination {
	margin-top: 10px;
	margin-bottom: 10px;
}

.mailNo-hidden {
	display: none;
	width: 0px;
}

.mailbox-read-message {
	min-height: 400px;
}
</style>

</head>
<body>
	<jsp:include page="../common/headerUser.jsp"></jsp:include>

		<div class="main-content">
			<!-- Content Header (Page header) -->
			<section class="section">
				<div class="section-header">
					<div class="row mb-2">
							<h1>메일읽기</h1>
							<div class="section-header-breadcrumb"></div>
					</div>
				</div>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-3">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">보관함</h3>
							</div>
							<div class="card-body p-0">
								<ul class="nav nav-pills flex-column">
									<li class="nav-item"><a href="alllist.mail" class="nav-link alllist">
											<i class="fas fa-envelope mail-icon"></i> 전체메일 
											<c:if test="${count != 0 && count ne null}">
												<span class="badge bg-primary float-right"> ${count} </span>
											</c:if>
									</a></li>
									<li class="nav-item active"><a href="receivelist.mail"
										class="nav-link receivelist"> <i class="far fa-envelope-open mail-icon"></i> 받은메일함 </a></li>
									<li class="nav-item"><a id="sendlist-li" href="sendlist.mail" class="nav-link sendlist">
						 			<i class="far fa-paper-plane mail-icon"></i> 보낸메일함 </span></a></li>
									<li class="nav-item"><a id="sendlist-li" href="checkReadTime.mail" class="nav-link sendlist">
						 			<i class="far fa-paper-plane mail-icon"></i> 수신확인 </span></a></li>
						
					
									<li class="nav-item"><a href="templist.mail" class="nav-link templist">
									<i class="far fa-file-alt mail-icon"></i> 임시보관함 </a></li>
									<li class="nav-item"><a href="favoriteslist.mail" class="nav-link favoriteslist"> 
									<i class="far fa-star favorites" id="favorites-icon"></i> 즐겨찾기 </a></li>
									<li class="nav-item"><a href="deletelist.mail" class="deletelist nav-link"> 
									<i class="far fa-trash-alt mail-icon"></i> 휴지통 </a></li>
								</ul>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
						<!-- /.col -->
						<div class="col-md-9">
							<div class="card card-primary card-outline">
								<div class="card-header">
									<h3 class="card-title">${mail.etitle }</h3>

									<div class="card-tools">
										<a href="#" class="btn btn-tool" title="Previous"><i
											class="fas fa-chevron-left"></i></a> <a href="#"
											class="btn btn-tool" title="Next"><i
											class="fas fa-chevron-right"></i></a>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body p-0">
									<div class="mailbox-read-info">
										<h6>
											보낸 사람 : &lt;${mail.senderName }&gt; ${mail.mNo}@worktech.com
											</h5>
											<h6>
												받는 사람 :
												<c:if test="${mail.receiverName != null }">&lt;${mail.receiverName }&gt;</c:if>
												${mail.receiveEmp} <span
													class="mailbox-read-time float-right">
														<fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${mail.sDate }"/>
													</span>
											</h6>
									</div>
									<!-- /.mailbox-read-info -->
									<div class="mailbox-controls with-border text-center">
										<div class="btn-group">
											<button type="button" class="btn btn-default btn-sm "
												data-container="body" title="Delete">
												<i class="far fa-trash-alt"></i>
											</button>
											<button type="button" class="btn btn-default btn-sm"
												data-container="body" title="Reply">
												<i class="fas fa-reply"></i>
											</button>
											<button type="button" class="btn btn-default btn-sm"
												data-container="body" title="Forward">
												<i class="fas fa-share"></i>
											</button>
										</div>
									</div>
									<!-- 이메일 내용 -->
									<div class="read-content-body">${mail.econtent}</div>

								</div>
								<!-- /.card-body -->
								<div class="card-footer bg-white">
									<ul
										class="mailbox-attachments d-flex align-items-stretch clearfix">
										<c:forEach var="mF" items="${mail.mailFileList }">
											<c:if test="${mF.mFileNo != 0}">
												<li><span class="mailbox-attachment-icon"><i
														class="far fa-file-pdf"></i></span>

													<div class="mailbox-attachment-info">
														<a 
														href="${contextPath }/resources/mailUploadFiles/${mF.mChangeName}" 
														download="${mF.mOriginalName }"
														class="mailbox-attachment-name"><i
															class="fas fa-paperclip"></i> ${mF.mOriginalName }</a> <span
															class="mailbox-attachment-size clearfix mt-1"> 
<!-- 															<span>1,245KB</span>  -->
															<a 
																href="${contextPath }/resources/mailUploadFiles/${mF.mChangeName}" 
																download="${mF.mOriginalName }"
															class="btn btn-default btn-sm float-right"><i
																class="fas fa-cloud-download-alt"></i></a>
														</span>
													</div></li>
											</c:if>
										</c:forEach>
									</ul>

								</div>
								<!-- /.card-footer -->
								<div class="card-footer">
									<div class="float-right">
										<button type="button" class="btn btn-default">
											<i class="fas fa-reply"></i> 답장
										</button>
										<button type="button" class="btn btn-default">
											<i class="fas fa-share"></i> 전달
										</button>
									</div>
									<button type="button" class="btn btn-default">
										<i class="far fa-trash-alt"></i> 삭제
									</button>
								</div>
								<!-- /.card-footer -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		
		<jsp:include page="../common/footer.jsp"></jsp:include>
		


	<!-- jQuery -->
	<script src="${contextPath}/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${contextPath}/resources/dist/js/demo.js"></script>
	<script>

	
	</script>
	
</body>
</html>
