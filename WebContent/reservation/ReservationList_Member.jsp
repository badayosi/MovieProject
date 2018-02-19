<%@page import="movie.dto.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/MovieProject/css/manager.css"> 
<style>
	@import url("/MovieProject/css/common.css");
	
	#container{
		width:1024px;
		min-height:600px;
		margin:0 auto;
	}
	table, tr, th, td{
		border:1px solid black;
		border-collapse:collapse;
	}
	table{
		margin-bottom: 50px;
	}
</style>

</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
	<jsp:include page="ReservationMain.jsp"></jsp:include>
	<div id="container">
		<br>
		<c:if test="${result!=null}">
			<%
				String id = (String)request.getAttribute("user");
				/* String id = re.getUserId(); */
			
			%>
			<h2><%=id %> 예약 보기</h2>
			<c:forEach var="member" items="${result}">
				<table>
					<tr>
						<th>예약번호</th>
						<td>${member.reservationNo}</td>
					</tr>
					<tr>
						<th>영화</th>
						<td>${member.movieName}(${member.theaterType})</td>
					</tr>
					<tr>
						<th>상영관</th>
						<td>${member.theaterName}(${member.theaterFloor})</td>
					</tr>
					<tr>
						<th>시간</th>
						<td><fmt:formatDate value="${member.startTime}" pattern="yyyy-MM-dd HH:mm"/> ~ <fmt:formatDate value="${member.endTime}" pattern="yyyy-MM-dd HH:mm"/></td>
					</tr>
					<tr>
						<th>좌석</th>
						<td>${member.seat}</td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td>${member.price}</td>
					</tr>
				</table>
			</c:forEach>
			
		</c:if>
		<c:if test="${result == null}">
			<p>예약된 영화가 없습니다!</p>
		</c:if>
	</div>
</body>
</html>