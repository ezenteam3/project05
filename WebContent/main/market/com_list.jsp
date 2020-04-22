<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

body{margin:0; padding:0; overflow-x:hidden;}
a{text-decoration:none;}
ul{margin:0; padding:0;}
ul li{list-style:none;}
	.menu-wrap{width:100%;}
	.menu-2-wrap{background-color:#63145F;}
		.menu-2{width:1280px; margin:0 auto; padding:10px 0; text-align:center; color:white; font-weight:1px;
				border-right:1px solid #E4E1E1; border-left:1px solid #E4E1E1;}
			.menu-2 li{display:inline; font-size:25px; margin:0 15px; color:white; cursor:pointer;}
				
	#market_wrap{position: relative; width:1280px; height:2000px; margin:0 auto;}
	#market_title{border-bottom:1px solid black; padding:10px; font-size:20px;}
	.com{width:220px;float: left; margin:15px;}
	.com_img{width:220px;height:220px;}
	.com_intro{width:100%; border:1px solid black; border-collapse:collapse;}	
	.com_intro .com_title{border:1px solid black; text-align:center;}
	.com_intro .com_assem{border-bottom:1px solid white;}
	.com_intro .com_assem:last-child{border-bottom:1px solid black;}
	
</style>
<script src="${path}/a00_com/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#home").click(function(){
		$("[name=category]").val("가정/사무용");
		$("form").submit();
	});
	$("#game").click(function(){
		$("[name=category]").val("게임용");
		$("form").submit();
	});
	$("#multi").click(function(){
		$("[name=category]").val("영상작업용");
		$("form").submit();
	});
	$("#work").click(function(){
		$("[name=category]").val("워크스테이션");
		$("form").submit();
	});
});
</script>
</head>
<body>
<form method="post">
<input type="hidden" name="proc" value="comlist"/>
<input type="hidden" name="category" value="all"/>
<jsp:include page="../../main/top.jsp"/>
	<div class="menu-wrap">
		<div class="menu-2-wrap">
			<div class="menu-2">
				<ul>
					<li id="home">가정/사무용</li>
					<li id="game">게임용</li>
					<li id="multi">영상작업용</li>
					<li id="work">워크스테이션</li>
				</ul>
			</div>
		</div>
	</div>
<div id="market_wrap">
	<p id="market_title">조립컴퓨터</p>
	<ul id="market_list">
		<c:forEach var="com" items="${clist}">
			<li class="com">
				<img src="image/Computer/${com.com_img}" class="com_img">
				<table class="com_intro" border>
					<tr><td class="com_title" colspan="2">${com.com_name}</td></tr>
					<tr class="com_assem"><td>CPU</td><td>해당이름</td></tr>
					<tr class="com_assem"><td>메인보드</td><td>해당이름</td></tr>
					<tr class="com_assem"><td>RAM</td><td>해당이름</td></tr>
					<tr class="com_assem"><td>그래픽카드</td><td>해당이름</td></tr>
					<tr class="com_assem"><td>SSD</td><td>해당이름</td></tr>
					<tr class="com_assem"><td>HDD</td><td>해당이름</td></tr>
					<tr class="com_assem"><td>케이스</td><td>해당이름</td></tr>
					<tr class="com_assem"><td>파워</td><td>해당이름</td></tr>
					<tr class="com_assem"><td>가격</td><td>${com.com_price}원</td></tr>
				</table>
			</li>
		</c:forEach>
	</ul>
</div>
</form>
<jsp:include page="../../main/bottom.jsp"/>
	<%-- <c:forEach>
			
	</c:forEach> --%>
</body>
</html>