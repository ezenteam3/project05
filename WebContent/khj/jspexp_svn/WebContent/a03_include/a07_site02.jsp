<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,jspexp.z01_vo.*"
    %>
<%request.setCharacterEncoding("utf-8");
String path = request.getContextPath();%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="a07_siteCom.jsp" %>
<%int tot=30000-(int)(30000*dis); %>
	<h2>뮤지엄에 오신것을 환영합니다.</h2>
	<h3>기본 입장료(50,000원)</h3>
	<h3>나이(<%= age%>)</h3>
	<h3>할인율(<%= (int)(dis*100)%>%)</h3>
	<h3>최종입장료(<%= tot%>원)</h3>
</body>
</html>