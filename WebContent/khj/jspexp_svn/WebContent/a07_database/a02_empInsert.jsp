<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,jspexp.z01_vo.*,
           jspexp.b01_database.*"
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
<style>
	select{width:170px;height:25px;}
</style>
<body>

	<h2 align="center">사원 등록 화면</h2>
<%--
	ename;job;
	mgr;deptno;
	sal;comm;
	
7566|JONES|
7782|CLARK|
7839|KING |
7698|BLAKE|
7902|FORD |
 --%>	
	<form method="post">
	<table align="center">
		<tr><th>사원명</th>
			<td><input type="text" name="ename"/></td>
			<th>직책</th><td><input type="text" name="job"/></td></tr>
		<tr><th>관리자명</th>
			<td><select name="mgr">
					<option value="7566">JONES</option>
					<option value="7782">CLARK</option>
					<option value="7839">JONES</option>
					<option value="7698">KING</option>
					<option value="7902">FORD</option>
				</select></td>
			<th>부서명</th>
			<td><select name="deptno" >
					<option value="10">ACCOUNTING</option>
					<option value="20">RESEARCH</option>
					<option value="30">SALES</option>
					<option value="40">OPERATIONS</option>
				</select></td></tr>		
		<tr><th>급여</th>
			<td><input type="text" name="sal"/></td>
			<th>보너스</th><td><input type="text" name="comm"/></td></tr>	
		<tr><td colspan="4" style="text-align:right">
				<input type="submit" value="등록" />
				<input type="button" value="조회화면"  onclick="javascript:goMain()"/>
			</td></tr>
	</table>
	</form>
</body>
<%
String ename = request.getParameter("ename"); if(ename==null) ename="";	
String job = request.getParameter("job"); if(job==null) job="";		
int mgr=0;String mgrS = request.getParameter("mgr"); if(mgrS!=null) mgr=Integer.parseInt(mgrS);		
int deptno=0;String deptnoS = request.getParameter("deptno"); if(deptnoS!=null) deptno=Integer.parseInt(deptnoS);		
double sal=0;String salS = request.getParameter("sal");	if(salS!=null) sal=Double.parseDouble(salS);	
double comm=0;String commS = request.getParameter("comm"); if(commS!=null) comm=Double.parseDouble(commS);		
// 요청값이 있을 때만 DB 입력 처리.
boolean isSuccess=false;
if(!ename.equals("")){
	// DB입력을 위해 넘겨줄, 객체 생성..
	// 입력 모듈 만들고, 처리 하기..
	A01_Database dao = new A01_Database();
	dao.insertEmp(new Emp(ename,job, mgr, sal,comm, deptno));
	isSuccess=true;
}
%>
<script type="text/javascript">
	var isSuccess=<%=isSuccess%>;
	if(isSuccess){
		if(!confirm("등록 성공\n계속등록하시겠습니까?")){
			location.href="a02_empList.jsp";
		}
	}
	function goMain(){
		location.href="a02_empList.jsp";
	}
</script>
</html>






