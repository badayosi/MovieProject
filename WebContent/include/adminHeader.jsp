<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="../css/header.css?ver=1">
<style>
	*{
		margin:0;
		padding:0;
	}
	#headerWrap h2{
		
		text-align: center;
		height: 70px;
		line-height: 70px;
	}
	header{
		margin:0;
		padding:0;
		margin-bottom: 50px;
	}
</style>
<header>
	<div id="headerWrap">
		<div id="login">
			<c:if test="${member != null}">
				${member.name }님 환영합니다. |
				<a href="logout.do?path=<%=request.getRequestURI() %>" id="logout">로그아웃 </a>
			</c:if>
			<c:if test="${member == null}">
				<a href="/MovieProject/login/Login.jsp" id="login">로그인</a>|
				<a href="/MovieProject/login/JoinForm.jsp">회원가입</a>
			</c:if>
		</div>
		<h2>관리자 로그인</h2>
	</div> 
	<div id="menubarWarp">
		<ul id="menubar">
			<li><a href="/MovieProject/index.jsp">HOME</a></li>
			<li><a href="/MovieProject/manager/managerListMovie.do">영화관리</a></li>
			<li><a href="/MovieProject/reservation/ReservationMain.jsp">예매관리</a></li>
			<li><a href="/MovieProject/theater/list.do">상영관 관리</a></li>
			<li><a href="/MovieProject/serviceBoard/ManagerServiceBoard.jsp">고객센터</a></li>
		</ul>
	</div>
</header>