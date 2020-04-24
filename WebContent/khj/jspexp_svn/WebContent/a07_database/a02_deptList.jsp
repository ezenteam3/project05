<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,jspexp.z01_vo.*"
    import="jspexp.b01_database.*"
    %>
<%request.setCharacterEncoding("utf-8");
String path = request.getContextPath();%>     
<!DOCTYPE html>
<%--

 --%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
	href="<%=path%>/a00_com/a00_com.css">
</head>
<body>
<!-- exp) 부서정보 등록 처리..구현..(DB) -->
<h2 align="center" onclick="javascript:insert()" >부서등록</h2>
<table align="center">
	<tr>
		<th>부서번호</th>
		<th>부서명</th>
		<th>부서위치</th></tr>
	<%
	for(Dept d:new A02_Database().getDeptList()){
	%>	
	<tr>
		<td><%=d.getDeptno()%></td>	
		<td><%=d.getDname() %></td>	
		<td><%=d.getLoc() %></td>	
		</tr>	
	<%}%>

</table>
<script type="text/javascript">
	function insert(){
		location.href="a02_deptInsert.jsp";
	}
</script>
</body>
</html>