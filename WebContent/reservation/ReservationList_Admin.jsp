<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	body{
		margin: 0;
		padding: 0;
	}
	 #container{
		width:1024px;
		min-height:600px;
		margin:0 auto;
		background:#F9F6EC; 
	}
	/*
	table, tr, th, td{
		border:1px solid black;
		border-collapse:collapse;
	} */
</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function(){
		$("input[type='button']").on("click",function(){
			var count = 0;
			var value = $(this).val();
			$("input[name='type']").val(value);
			$("input[type='checkbox']:checked").each(function(index, obj){
				count++;
			});
			if(count < 1){
				alert("선택된 예약이 없습니다.");
				return false;		
			}
			$("form").submit();
		});
		
		$("tr").on("click",function(){
			
		});
	});
</script>

</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
	
	<jsp:include page="ReservationMain.jsp"></jsp:include>
		
	<div id="container">
		<c:if test="${result!=null}">
			<br>
			<h2>전체 예약 보기</h2>
			<form action="reservationGuide.do" method="post">
				<table>
					<tr>
						<th>구분</th>
						<th>예약번호</th>
						<th>ID</th>
						<th>영화</th>
						<th>상영관</th>
						<th>시간</th>
						<th>좌석</th>
						<th>결제금액</th>
					</tr>
					<c:forEach var="member" items="${result}">
						<tr>
							<td><input type="checkbox" name="check" value="${member.reservationNo}"></td>
							<td>${member.reservationNo}</td>
							<td>${member.userId}</td>
							<td>${member.movieName}(${member.theaterType})</td>
							<td>${member.theaterName}(${member.theaterFloor}층)</td>
							<td><fmt:formatDate value="${member.startTime}" pattern="yyyy-MM-dd HH:mm"/> ~ <fmt:formatDate value="${member.endTime}" pattern="yyyy-MM-dd HH:mm"/></td>
							<td>${member.seat}</td>
							<td>${member.price}</td>
						</tr>
					</c:forEach>
				</table>
				<p id="insert">
					<input type="hidden" name="type">
					<input type="button" value="예약취소">
				</p>
			</form>
		</c:if>
		<c:if test="${result == null}">
			<p>예약한 회원이 존재하지 않습니다.</p>
		</c:if>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>