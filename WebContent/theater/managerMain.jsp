<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, tr, th, td{
		border: 1px solid grey;
		border-collapse: collapse;
	}
	th, td{
		padding: 10px;
	}
</style>
</head>
<body>
	<a href="list.do">리스트</a><br>
	<a href="insert.do">추가</a>
	<br>
	<br>
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>층</th>
			<th>인원</th>
			<th>행</th>
			<th>열</th>
			<th>상영관 종류</th>
			<th></th>
			<th></th>
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
		</tr>
		</c:forEach>
	</table>
	
</body>
</html>