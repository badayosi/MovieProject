<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#headerWrap{
		width:100%;
		hegiht:200px;
		background:#f9f6ec;
		margin: 0 auto;
	}
	#headerWrap h1{
		text-align:center;
		color:red;
		margin:0;
	}
	#headerWrap h2{
		text-align:center;
		margin:0;
	}
	#headerWrap p{
		text-align: right;
		margin-right:180px;
		padding: 10px;
	}
	#headerWrap p a{
		
		color:black;
		text-decoration: none;
		padding: 5px;
		
	}
	#menubarWarp #menubar{
		width:1024px;
		margin:0 auto;
		overflow: hidden;
		height: 45px;
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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function(){
		
	})
</script>
<div id="headerWrap">
	<h2>Hello 2018</h2>
	<h1>DGV</h1>
	<p>
	<c:if test="${member != null}">
		${member.name }님 환영합니다. |
		<a href="logout.do?path=<%=request.getRequestURI() %>" id="logout">로그아웃 </a>
	</c:if>
	<c:if test="${member == null}">
		<a href="login.do" id="login">로그인</a>|
		<a href="#">회원가입</a>
	</c:if>
	</p>
</div>
<div id="menubarWarp">
	<ul id="menubar">
		<li><a href="#">HOME</a></li>
		<li><a href="#">영화</a></li>
		<li><a href="#">예매</a></li>
		<li><a href="#">상영관</a></li>
		<li><a href="#">게시판</a></li>
	</ul>
</div>
