<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

	<c:if test="${ loginUser.mGrade eq 'USER' }">
		<c:import url="../views/main/mainUser.jsp" />
	</c:if>
    <c:if test="${ loginUser.mGrade eq 'ADMIN' }">
    	<c:import url="../views/common/headerAdmin.jsp" />
    </c:if>

</body>
</html>
