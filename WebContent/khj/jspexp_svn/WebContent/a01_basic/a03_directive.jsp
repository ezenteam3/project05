<!-- 
# page 디렉티브
1. jsp페이지에 대한 정보를 입력
	- jsp가 생성할 문서의 타입, 사용할 클래스, 버퍼여부, 세션 여부
	를 선언한다.
2. jsp 디렉티브 작성
	속성 = 속성값.
3. 디렉비트의 주요 속성과 활용.
	1) contentType : jsp가 생성할 문서의 타입을 지정한다.
		- response객체를 통해서 출력할 형식을 선언..
		ex) contentType="text/html; charset=UTF-8" : html화면.
		contentType="application/vnd.ms-excel:charset=utf-8"
	2) import : jsp페이지에 사용할 자바 클래스를 지정.
	3) 
 -->

<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_vo.Person"
    %>
<%
/*
	response.setHeader("Content-Disposition", "attachment:filename=excel.xls");
	response.setHeader("Content-Description","JSP Generated Data");
	response.setContentType("application/vnd.ms-excel");
	*/
	//jsp에서 java 프로그램을 사용할 수 있다는 말은 DB 연결하여
	// 결과물을 처리할 수 있다는 의미..
	Person p01 = new Person("홍길동",25,"서울 신림동");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border>
		<tr><th>인사말</th></tr>
		<tr><td>안녕하세요</td></tr>
		<tr><td>반갑습니다.</td></tr>
		<tr><td>이름:<%=p01.getName() %></td></tr>
		<tr><td>나이:<%=p01.getAge() %></td></tr>
		<tr><td>사는곳:<%=p01.getLoc() %></td></tr>
	</table>
	

</body>
</html>