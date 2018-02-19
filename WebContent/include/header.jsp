<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/MovieProject/css/header.css?ver=3">
<style>
	
</style>
<div id="headerWrap">
	<div id="login">
		<c:if test="${member != null}">
			
			<c:if test="${member.userRank !='관리자'}">
				<a>${member.name }님 환영합니다.</a>
				<a href="logout.do?path=<%=request.getRequestURI() %>" id="logout">로그아웃 </a>
				<a href="/MovieProject/login/myPage.jsp">마이시네마</a>
			</c:if>
			<c:if test="${member.userRank =='관리자'}">
				<a>관리자님 환영합니다.</a>
				<a href="logout.do?path=<%=request.getRequestURI() %>" id="logout">로그아웃 </a>
				<a href="/MovieProject/manager/managerListMovie.do">관리자 모드</a>
			</c:if>
			
		</c:if>
		<c:if test="${member == null}">
			<a href="/MovieProject/login/Login.jsp" id="login">로그인</a>
			
			<a href="/MovieProject/login/JoinForm.jsp">회원가입</a>
			<a href="/MovieProject/login/myPage.jsp">마이시네마</a>
		</c:if>
	</div>
	
	<h1><img src="/MovieProject/images/main_logo.gif"></h1>

</div> 
<div id="menubarWarp">
	<ul id="menubar">
		<li><a href="/MovieProject/index.jsp">HOME</a></li>
		<li><a href="/MovieProject/user/userMovie.jsp">영화</a></li>
		<li><a href="/MovieProject/reservation/ReservationInsert_Member.jsp">예매</a></li>
		<li><a href="/MovieProject/serviceBoard/ServiceUserBoard.jsp">고객센터</a></li>
	</ul>
</div>
