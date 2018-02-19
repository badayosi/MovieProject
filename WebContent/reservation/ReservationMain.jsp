<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	@import url("/MovieProject/css/common.css");
	#content{
		width:1024px;
		margin:0 auto;
		overflow: hidden;
	}
	
	#SubBar ul li{
		list-style: none;
		display: inline-block;
		float: left;
		padding:10px;
		text-align:center;
		border:1px solid white;
		background: #CDC197;
	}
	#SubBar ul li a{
		text-decoration: none;
		font-size: 15px;
		font-weight: bold;
		color: black;
	}
	
</style>
	
</head>
<body>
<%-- 	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
		<jsp:include page="ReservationMain.jsp"></jsp:include>
 --%>	<div id="content">
		<div id="SubBar">
			<ul>
				<li><a href="reservationGuide.do">관리자용 전체예약현황</a></li>
				<li>
					<a href="#">유저별 관리 보기</a>
					<form action="reservationGuide.do" method="get">
						<input type="text" name="id">
						<input type="submit" value="검색">
					</form>
				</li>
			</ul>
		</div>
		
		
	</div>
	
</body>
</html>