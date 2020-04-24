<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,jspexp.z01_vo.*"
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
<%--
# application 기본 객체
1. 서버 단위로 특정한 변수/객체를 설정 하거나,
	application.setAttribute()
	application.getAttribute()
2. 서버의 초기 파라미터를 설정해서, 웹 서비스(jsp)나 
	controller, service에서 공통으로 사용할 수 있다. 	
	1) 처리 프로세스.
	- web.xml에서 서버단위 특정데이터 설정.
	- application 객체 단위로 설정된 데이터를 가져오기..
		getInitParameter(String name) : 초기 파라미터의 값 읽기
		getInitParameterNames() : 초기 파라미터의 이름 목록 가져오기
		
 --%>


<h2>application Object</h2>
<h3>web.xml에 설정된 데이터 가져오기</h3>
<%
// application.getInitParameterNames() : 선언된 속성을 가져온다.
// 1. return 값 : Enumeration 객체..
// 2. .nextElement() 해당 요소의 key 값 가져오기.
// 3. .hasMoreElements() 해당 요소를 하나씩 가져오기..(다음 내용이 있는지 여부boolean)
// application.getInitParameter("매개변수")
	Enumeration initParam = application.getInitParameterNames();
	while(initParam.hasMoreElements()){
		String key = (String)initParam.nextElement();
		String val = (String)application.getInitParameter(key); 
%>
		<h4><%=key %> = <%=val %></h4>	
<% }%>
<!-- 
	ex) oracle 접속정보를 web.xml설정(ip, port, sid, 계정, 비번)하고,
	해당 내용을 서버에서 출력 처리한다.
oraIp  oraPort oraSid oraUser  oraPass	
 -->
	<h2>오라클 정보</h2>
	<h3>ip:<%=application.getInitParameter("oraIp") %></h3>
	<h3>port:<%=application.getInitParameter("oraPort") %></h3>
	<h3>sid:<%=application.getInitParameter("oraSid") %></h3>
	<h3>user:<%=application.getInitParameter("oraUser") %></h3>
	<h3>pass:<%=application.getInitParameter("oraPass") %></h3>
	

</body>
</html>