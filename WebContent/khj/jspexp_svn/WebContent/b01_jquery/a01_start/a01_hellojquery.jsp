<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,jspexp.z01_vo.*,jspexp.b01_database.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
	href="${path}/a00_com/a00_com.css">
</head>
<!-- CDN 방식으로 jquery lib 활용.. -->
<script type="text/javascript" 
	src="https://code.jquery.com/jquery-3.4.1.js">	
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h1").text("jquery 시작!");
	});

</script>
<body>
	<h1></h1>
</body>
</html>