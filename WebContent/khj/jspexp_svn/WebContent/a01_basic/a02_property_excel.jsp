<%@ page language="java"  
contentType="application/vnd.ms-excel; charset=utf-8"
 pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 

  response.setHeader("Content-Type", "application/vnd.ms-xls");
  response.setHeader("Content-Disposition", "inline; filename=excelDown.xls");
%>​ 
</head>
<body>
	<table border>
		<tr><th>엑셀</th></tr>
		<tr><td>연습1</td></tr>
		<tr><td>연습2</td></tr>
		<tr><td>연습3</td></tr>
	</table>
</body>
</html>