<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	div#container{
		width:1024px;
		min-height:600px;
		margin:0 auto;
	}
	table, tr, th, td{
		border:1px solid black;
		border-collapse:collapse;
	}
</style>

</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
	<div id="container">
				
		<c:if test="${result!=null}">
			<table>
				<c:forEach var="member" items="${result}">
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
						<td>${member.startTime}-${member.endTime}</td>
					</tr>
					<tr>
						<th>좌석</th>
						<td>${member.seat}</td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td>${member.price}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${result == null}">
			<p>예약된 영화가 없습니다!</p>
		</c:if>
	</div>
</body>
</html>