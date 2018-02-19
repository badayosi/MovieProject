<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/MovieProject/css/manager.css"> 
<style type="text/css">
	@import url("/MovieProject/css/common.css");
	/* #content{
		width: 1024px;
		margin: 0 auto;
	}
	#content table{
		width: 1024px;
	}
	#content table, tr, th, td{
		border: 1px solid grey;
		border-collapse: collapse;
		text-align: center;
	}
	#content th, #content td{
		padding: 10px;
	} */
	/* table{
		width: 1024px;
		margin: 0 auto;
	}
	table, th{
		border-top:2px solid #CDC197;
		border-bottom:2px solid #CDC197;
		border-collapse: collapse;
	}
	table,tr{
		border-bottom:1px solid #CDC197;
		border-collapse: collapse;
		text-align: center;
	}
	th, td{
		text-align: center;
		padding: 10px;
	}
	h2{
		width: 1024px;
		margin: 0 auto;
		margin-bottom: 20px;
	}
	#insert{	
		padding-top: 20px;
		width: 1024px;
		margin: 0 auto;	
		text-align:right;
	}
	#insert button{
		font-size: 15px;
		background: #CDC197;
		padding: 5px 10px;
		font-weight: bold;
		color: white;
	} */
</style>
</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
	<div id="content">
		<c:if test="${list==null }">
				<%response.sendRedirect("list.do"); %>
		</c:if>
		
		<h2>영화관 관리</h2>
		
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>층</th>
				<th>인원</th>
				<th>행</th>
				<th>열</th>
				<th>상영관 종류</th>
				<th>수정</th>
				<th>삭제</th>
				<th>좌석배치 조정</th>
				<th>회원입장 좌석배치</th>
			</tr>
			<c:forEach var="item" items="${list }">
			<tr>
				<td>${item.theaterNo }</td>
				<td>${item.theaterName}</td>
				<td>${item.theaterFloor }</td>
				<td>${item.theaterMaxcount }</td>
				<td>${item.row }</td>
				<td>${item.col }</td>
				<td>${item.theaterType }</td>
				<td><a href="modify.do?no=${item.theaterNo}">수정</a></td>
				<td><a href="delete.do?no=${item.theaterNo}">삭제</a></td>
				<td><a href="managerSeat.do?no=${item.theaterNo}">좌석조정</a></td>
				<td><a href="userSeat.do?no=${item.theaterNo}">회원좌석</a></td>
			</tr>
			</c:forEach>
		</table>
		
		<p id="insert">
			<a href="insert.do"><button>상영관 추가</button></a>
		</p>
	</div>
</body>
</html>