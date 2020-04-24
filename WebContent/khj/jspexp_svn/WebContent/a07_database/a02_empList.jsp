<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,jspexp.z01_vo.*"
    import="jspexp.b01_database.*"
    %>
<%request.setCharacterEncoding("utf-8");
String path = request.getContextPath();%>     
<!DOCTYPE html>
<%--
# database 불러와서 화면에 출력..
 --%>
<%
String ename = request.getParameter("ename");
if(ename==null) ename="";
String job = request.getParameter("job");
if(job==null) job="";
A01_Database db = new A01_Database();
Emp sch = new Emp(ename,job);

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
	href="<%=path%>/a00_com/a00_com.css">
</head>
<body>
<!-- 
# 사원 정보 등록처리.
1. 화면 UI(등록 버튼)
	- 버튼 클릭시, 등록 화면으로 이동.
2. 등록화면
	- 사원등록 처리화면..
	- 등록버튼 클릭시, 요청값 전달,
	- 요청값 전달 받은 내용 확인
	- 등록 DB 모듈 작성
	- 요청값을 VO로 할당 DB등록 모듈 처리..
	- 등록 처리 후, list 화면 이동 처리.
# 사원 정보 상세 처리.
1. 선택한 row단위의 key값을 더블 클릭시, 상세화면으로
	전송 처리..	

 -->

<h2  align="center">사원 리스트</h2>
<form method="post">
<table  align="center">
	<tr><th>사원명</th>
		<td><input type="text" name="ename" value="<%=ename%>" /></td></tr>
	<tr><th>직책</th>
		<td><input type="text" name="job"  value="<%=job%>" /></td></tr>
	<tr>
		<td colspan="2" style="text-align:right;">
			<input type="button" value="등록" id="regBtn"/>
			<input type="submit" value="검색"/></td></tr>
</table>
</form>

<table align="center">
	<col width="20%">
	<col width="20%">
	<col width="20%">
	<col width="20%">
	<col width="20%">
	<tr>
		<th>사원번호</th>
		<th>사원명</th>
		<th>직책</th>
		<th>급여</th>
		<th>부서번호</th></tr>
	<%
	for(Emp emp:db.getEmpList(sch)){
	%>	
	<tr ondblclick="javascript:go(<%=emp.getEmpno()%>)">
		<td><%=emp.getEmpno()%></td>	
		<td><%=emp.getEname() %></td>	
		<td><%=emp.getJob() %></td>	
		<td><%=emp.getSal() %></td>	
		<td><%=emp.getDeptno() %></td>	
		</tr>	
	<%}%>

</table>
</body>
<script type="text/javascript">
	var regBtn = document.querySelector("#regBtn");
	regBtn.onclick=function(){
		if(confirm("등록하시겠습니다.")){
			location.href="a02_empInsert.jsp";
		}
	};
	function go(empno){
		location.href="a02_empDetail.jsp?empno="+empno;
	}

</script>
</html>



