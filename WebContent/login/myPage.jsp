<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%
	String pageFile = request.getParameter("page");
	if(pageFile ==null){
		pageFile = "myHistory";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script> 
<style type="text/css">
	*{
 		position:relative;
 		margin:0 auto;
		font-family: "나눔 고딕", 'Nanum Gothic', 'ng';
		padding: 0;
		margin: 0;
 	}
 	
	#myPage{
		width: 1024px;
		margin: 0 auto;
	}
	#name{
		background: #282E34;
		color: white;
		font-size: 18px;
		padding: 13px;
		margin-bottom: 20px;
	}
	#name span{
		color: #EFEBDB;
	}
	/* #282E34 */
	/* nav버튼 */
	#myNav{
		overflow: hidden;
		margin-bottom: 30px;
	}
	#myNav ul{
		width: 100%;
		height: 49px;
		line-height:49px;
		background: #EFEBDB;
	}
	#myNav ul li{
		list-style: none;
		display: inline-block;
		float: left;
		text-align: center;
		width: 254px;
		border: 1px solid white;
		/* 터치 =>231F20 */
	}
	#myNav ul li a{
		text-decoration: none;
		color: #231f20;
		height: 49px;
		font-size: 14px;
		display: block;
	}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="myPage">
		<div id="myInfo">
			<h1>마이시네마</h1>
			<div id="name"><span>테스트<%-- ${member.name } --%></span>님 환영합니다!
			</div>
		</div>
		<div id="myNav">
			<ul>
				<li><a href="myPage.jsp?page=myReservation">예매/구매내역</a></li>
				<li><a href="myPage.jsp?page=myHistory">무비 히스토리</a></li>
				<li><a href="myPage.jsp?page=myNotice">나의 문의 내역</a></li>
				<li><a href="myPage.jsp?page=myInfo">나의 정보 관리</a></li>
			</ul>
		</div>
		<div id="">
		
			<jsp:include page='<%=pageFile+ ".jsp"%>'></jsp:include>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>