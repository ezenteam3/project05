<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,jspexp.z01_vo.*"%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	if(id==null) id="";
	%>
	<!-- a0313_clu_top.jsp?id=himan request.getParameter("id") -->
	<jsp:include page="0313_clu_top.jsp">
		<jsp:param value="<%=id %>" name="id">
	</jsp:include>
	<hr>
	<hr>
	<jsp:include page="0313_clu_bottom.jsp">
		<jsp:param value="<%=id %>" name="id">
	</jsp:include>
</body>
</html>