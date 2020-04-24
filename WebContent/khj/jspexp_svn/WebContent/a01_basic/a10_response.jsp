<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Enumeration"
    
    %>
<%request.setCharacterEncoding("utf-8");
String path = request.getContextPath();%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%--
# response 기본 객체
1. 웹 브라우저에 전송하는 응답 정보 설정
	서버에서 client로 전송되는 응답 정보를 처리하는 객체

2. 주요 기능
	1) 헤더 정보 입력
	2) 리다이렉트로 페이지는 server단에서 이동 처리..
3. 주요 메서드
	1) addHeader(String name, String value)
		name 헤더에 value를 값으로 추가한다.
	2) setHeader(String name, String value)
		name 헤더에 value 값을 지정한다.
	3) sendRedirect("이동할 페이지정보"):
		특정한 페이지로 서버단에서 이동하여, client단에
		처리하여 그 결과 화면을 볼 수 있게 한다.
	4) response.getWriter() 주로 화면에 출력할 내용을
		pintln("<body></body>");
					

 --%>
<body>
<h2>헤더 정보 출력</h2>
<%
// 저장된 header 정보 
Enumeration headerEnum = request.getHeaderNames();
while(headerEnum.hasMoreElements()){
	// 헤더의 key와, value를 가져와서 출력..
	String headerKey = (String)headerEnum.nextElement();
	String headerValue = request.getHeader(headerKey);

%>
	<h3><%=headerKey %> - <%= headerValue%></h3>
<%} 

%>
<h2>로그인</h2>
<form method="post">
id:<input type="text" name="id"/><br>
pass:<input type="text" name="pass" /><br>
<input type="submit" value="로그인"/>
</form>
<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");
boolean isInvalid=false;
if(id!=null&&pass!=null){
	if(id.equals("himan")&&pass.equals("7777")){
		// 인증이 되었으면, main페이지로 이동 처리.
		response.sendRedirect("a11_main.jsp?id="+id);
		// response.sendRedirect("이동할페이지") (서버단에서 이동)
		// location.href="이동할 페이지"(클라이언트 단에서 이동)
	}else{
		// 인증이 되지 않음..
		isInvalid=true;
	}
}
// ex) 구구단을 임의로 문제가 나오고, 정답을 입력했을 때,
//    정답이면 미션 성공페이지 이동, 아니면 현재 페이지에서 계속 문제를
//   풀게 처리..

%>
</body>
<script type="text/javascript">
	var isInvalid=<%=isInvalid%>;
	if(isInvalid){
		alert("로그인 실패합니다\n다시 로그인 하세요!");
	}

</script>
</html>