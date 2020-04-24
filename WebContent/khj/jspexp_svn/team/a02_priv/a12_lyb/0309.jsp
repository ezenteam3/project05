<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_vo.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<!-- 
http://192.168.4.82:5080/jspexp/a01_basic/a09_reqMethod.jsp


1. url의 구성요소를 
http://192.168.0.23:7080/jspexp/a01_start.jsp?id=himan&pass=777
를 기준으로 구분하여 기술하세요.


http://[프로토콜]192.168.0.23[호스트]:7080[포트]/jspexp/[경로]a01_start[파일명].jsp[확장자명]?id=himan&pass=7777[쿼리스트링]


2. jsp화면을 크게 구분하여, 상단/body에 들어갈 요소를 기술하세요.

최상단에 jsp page에 대한 설정 정보를 선언
@ page : 페이지에 대한 선언 Directive라고 한다
	1) 프로그래밍 언어
	2) 화면 출력형식:contentType
	3) 문자의 encoding 방식 : paeEncoding

body에는 html코드와, 
스크립트요소(스크립트릿(scriptlet), 표현식(expression), 선언부(Declaration))를 통해서 java코드를 사용한다

3. 스크립트 요소 3가지를 구구단을 프로그램을 기준으로 예를들어 설명하세요.

선언부(Declaration)

<%!
	public int multi(int num01, int num02){
		return num01*num02;
	}
%>


스크립트릿(scriptlet)

<%
	int num01 = (int)((Math.random()*8)+2);
	int num02 = (int)((Math.random()*9)+1);
%>

표현식(expression)
-->
<h3><%=num01%> X <%=num02%> = <%=multi(num01,num02)%></h3>

<!-- 
4. page 디렉티브 중에 contentType은 어떤 역할을 하는 속성인지를 기술하세요.

contentType : jsp가 생성할 문서의 타입을 지정한다.
		ex) contentType="text/html; charset=UTF-8" : html화면 
			contentType="application/vnd.ms-excel; charset=utf-8" : excel화면
			
5. java로 클래스로 물건명, 가격, 개수를 정의하여, jsp에서 활용하고자 한다.
	해당 코드를 처리하는 순서와 코드를 기술하세요..
	
	물건명(pname), 가격(price), 개수(cnt)라는 변수가 있는 Product 클래스를 선언해준뒤
	jsp파일 상단의 page 디렉티브에
	import="패키지명.Product"로 import해주고
	스크립트릿으로
	<% Product p01 = new Product(); %>
	로 객체를 생성해 준 뒤 활용한다.


6. &name=홍길동&age=25&loc=강남  이라는 url매개변수 값을 jsp에서 처리하고자 한다.
   jsp 기본객체를 통해서 위 요청값을 처리하되 null일때는 문자열을 ""으로,
      숫자는 0으로 처리되게 하여 h1에서 이름:@@@ 나이:@@ 사는 곳:@@이 화면에 
      나오게 코드하세요.	
-->
<%
String name = request.getParameter("name");
if(name==null) name="";
String age = request.getParameter("age");
if(age==null) age="0";
String loc = request.getParameter("loc");
if(loc==null) loc="";
%>
<form>
이름 : <input type="text" name="name"><br>
나이 : <input type="text" name="age"><br>
사는 곳 : <input type="text" name="loc"><br>
<input type="submit">
</form>
<h1>이름 : <%=name %></h1>
<h1>나이 : <%=age %></h1>
<h1>사는 곳 : <%=loc %></h1>


<!-- 
7. jsp 코드를 이용하여 3X3테이블에 임의의 무기개 색상을 각 cell의 배경
	색상으로 나타나게 for문으로 이용하여 처리하세요.
-->
<%
String rainbow[] ={"red","orange","yellow","green","blue","navy","purple"};

%>

<table border width="300" height="300">
	<%	for(int i=1;i<10;i++){ 
		int ran = (int)(Math.random()*7);
		if(i%3==1){%>
			<tr>
		<%}%>
		<th style="background-color:<%=rainbow[ran]%>">i</th>
		<%if(i%3==0){ %>
			</tr>
		<%}%>
	<%}%>
</table>

<!-- 

8. jsp의 내장 객체가 무엇인지 기술하세요.

	request : 요청정보를 구할 때 사용
	response : 응답과 관련된 설정시 사용
	out : 직접 응답을 출력할 때 사용
	session : 세션관리에 사용 
	
	application : 웹어플리케이션 Context의 정보를 저장하고 있는 객체
	pageContext : JSP 페이지에 대한 정보를 저장하고 있는 객체
	page : JSP 페이지를 구현한  자바 클래스 객체
	config : JSP 페이지에 대한 설정 정보를 저장하고 있는 객체 
	exception : JSP 페이지서 예외가 발생한 경우에 사용되는 객체

-->
</body>
<script>
</script>
</html>