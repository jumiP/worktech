<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>채팅 메시지</title>

    <!-- General CSS Files -->
    <link rel="stylesheet" href="resources/dist/assets/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/dist/assets/modules/fontawesome/css/all.min.css">

    <!-- CSS Libraries -->

    <!-- Template CSS -->
    <link rel="stylesheet" href="resources/dist/assets/css/style.css">
    <link rel="stylesheet" href="resources/dist/assets/css/components.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
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
        body{
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>
</head>

<body>
    <div class="main-content">
        <section class="section">
            <div class="col-12 col-sm-6 col-lg-4">
                <div class="card chat-box" id="mychatbox">
                    <div class="card-header">
                        <h4>${ cr.chatTitle }</h4>
                    </div>
                    <jsp:useBean id="today" class="java.util.Date" />
					<fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd" />
                    <div class="card-body chat-content" tabindex="1" style="overflow: hidden; outline: none;">
	                    <c:forEach var="msg" items="${ messageList }">
	                    	<c:if test="${ loginUser.mNo != msg.sendMember }">
	                    		<div class="chat-item chat-left">
	                    			<c:if test="${ msg.profileUrl != null }">
	                    				<img src="${ msg.profileUrl }">
	                    			</c:if>
	                    			<c:if test="${ msg.profileUrl == null }">
	                    				<img src="resources/dist/assets/img/avatar/avatar-1.png">
	                    			</c:if>
	                    			<div class="chat-details">
		                    			<div class="chat-text">${ msg.msgContent }</div>
	                                	<div class="chat-time">
	                                		<c:if test="${ now eq msg.date }">
												${ ch.time }
											</c:if>
											<c:if test="${ now ne msg.date }">
												${ ch.date }
											</c:if>
	                                	</div>
	                                </div>
	                    		</div>
	                    	</c:if>
	                    	<c:if test="${ loginUser.mNo == msg.sendMember }">
	                    		<div class="chat-item chat-right">
	                    			<c:if test="${ msg.profileUrl != null }">
	                    				<img src="${ msg.profileUrl }">
	                    			</c:if>
	                    			<c:if test="${ msg.profileUrl == null }">
	                    				<img src="resources/dist/assets/img/avatar/avatar-1.png">
	                    			</c:if>
	                    			<div class="chat-details">
		                    			<div class="chat-text">${ msg.msgContent }</div>
		                    			<div class="chat-time">
	                                		<c:if test="${ now eq msg.date }">
												${ ch.time }
											</c:if>
											<c:if test="${ now ne msg.date }">
												${ ch.date }
											</c:if>
	                                	</div>
                                	</div>
	                    		</div>
	                    	</c:if>
	                    </c:forEach>
                    </div>
                    <div class="card-footer chat-form">
                        <form id="chat-form2">
                            <input type="text" class="form-control" placeholder="메시지를 입력하세요">
                            <button class="btn btn-primary">
                                <i class="far fa-paper-plane"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- General JS Scripts -->
    <script src="resources/dist/assets/modules/jquery.min.js"></script>
    <script src="resources/dist/assets/modules/bootstrap/js/bootstrap.min.js"></script>
    <script src="resources/dist/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
    <script src="resources/dist/assets/js/stisla.js"></script>

    <!-- JS Libraies -->

    <!-- Page Specific JS File -->
    <script src="resources/dist/assets/js/page/components-chat-box.js"></script>

    <!-- Template JS File -->
    <script src="resources/dist/assets/js/scripts.js"></script>
    <script src="resources/dist/assets/js/custom.js"></script>
</body>
</html>