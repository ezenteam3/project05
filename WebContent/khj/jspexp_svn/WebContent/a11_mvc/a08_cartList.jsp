<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,jspexp.z01_vo.*,jspexp.b01_database.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
	href="${path}/a00_com/a00_com.css">
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
		$("h2").text("장바구니현황");
		$("#buy").click(function(){
			if(confirm("구매하시겠습니까?")){
				$("[name=proc]").val("buy");
				$("form").submit();
			}
		});
	});
	function goMain(){
		$(location).attr("href","${path}/sellingproduct");
	}	
</script>
</head>
<body>
<h2 align='center'></h2>
<form method="post">
	<input type="hidden" name="proc" value="buy"/>
<table  align='center'>
	<tr><th>ch</th><th>분류</th><th>물건명</th><th>가격</th>
		<th>구매갯수</th></tr>
	<c:forEach var="prod" items="${cart}">
		<input type="hidden" name="sno" value="${prod.sno}" />
		<input type="hidden" name="cnt" value="${prod.cnt}" />
	<tr><td><input type="checkbox" value="${prod.sno}"/></td>
		<td>${prod.kind}</td>
		<td class="ordL">${prod.name}</td>
		<td class="ordR">
			<fmt:formatNumber value="${prod.price}"/>
		</td>
		<td  class="ordR">
			<fmt:formatNumber value="${prod.cnt}"/>
		</td></tr>
	</c:forEach>	
	<tr><td colspan="5" style="text-align:right">
		<input type="button" value="구매"  id="buy"/>
		<input type="button" value="삭제"  id="카트"/>
		<input type="button" value="조회화면"  onclick="javascript:goMain()"/>
	</td></tr>	
</table>
</form>
</body>
</html>
