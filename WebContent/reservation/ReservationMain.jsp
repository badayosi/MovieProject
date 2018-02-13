<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</style>

</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
	<div id="container">
		<a href="reservationGuide.do">관리자용 전체예약현황</a>
		<br>
		<a href="reservationGuide.do?id=user1">유저별 예약현황[user1]</a>
		<br>
		<a href="ReservationInsert_Member.jsp">예약페이지이동</a>
	</div>
	
	
</body>
</html>