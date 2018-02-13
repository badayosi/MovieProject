<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#headerWrap{
		width:100%;
		hegiht:200px;
		background:white;
		margin: 0 auto;
	}
	#headerWrap h1{
		text-align:center;
		color:red;
		margin:0;
	}
	#headerWrap #login{
		padding: 8px 0px;
		
		width: 100%;
		background: #EFEBDB;
		text-align: right;
	}
	#headerWrap #login a{
		color:#555;
		font-size:12px;
		text-decoration: none;
		padding: 5px;
		padding-right:20px;
	}
	#menubarWarp{
		width: 100%;
		border-top:2px solid #CDC197;
		border-bottom:1px solid #CDC197;
		margin-bottom: 20px;
	}
	#menubarWarp #menubar{
		width:1024px;
		margin:0 auto;
		overflow: hidden;
		padding: 20px 0;
		text-align:center;
	}
	#menubarWarp #menubar li{
		margin-top:10px;
		display: inline;
		float: left;
		width:19%;
		line-height:20px;
		height:20px;
		border-right:1px solid #ccc;
	}
	#menubarWarp #menubar li:LAST-CHILD{
		border:none;
	}
	#menubarWarp #menubar li a{
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
	
</style>
<div id="headerWrap">
	<div id="login">
		<c:if test="${member != null}">
			<a>${member.name }님 환영합니다.</a>
			<a href="logout.do?path=<%=request.getRequestURI() %>" id="logout">로그아웃 </a>
			<a href="/MovieProject/login/myPage.jsp">마이시네마</a>
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
		<li><a href="/MovieProject/admin/listMovie.do">영화</a></li>
		<li><a href="/MovieProject/reservation/ReservationInsert_Member.jsp">예매</a></li>
		<li><a href="#">상영관</a></li>
		<li><a href="/MovieProject/serviceBoard/ServiceUserBoard.jsp">고객센터</a></li>
	</ul>
</div>
