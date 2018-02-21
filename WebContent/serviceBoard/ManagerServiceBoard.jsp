<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	*{
	margin:0 auto;
	font-family: "나눔 고딕", 'Nanum Gothic', 'ng';
	padding: 0;
	}
	#manager_serviceBoard_wrap{
		width:1024px;
		min-height: 600px;
		margin:0 auto;
	}
	#manager_serviceBoard_wrap ul{
		width:50%;
		height:45px;
		overflow:hidden;
		margin:0 auto;
		text-align:center;
	}
	#manager_serviceBoard_wrap ul li{
		background:#EFEBDB;
		width:49%;
		height:45px;
		line-height: 45px;
		margin-left:1px;
		float:left;
		list-style:none;
		color:#231f20;
		cursor: pointer;
	}
	#menuSelect{
		margin-top:20px;
	}
	.select_menu{
		background: #231f20 !important;
    	color: #cdc197 !important;
	}
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#menuSelect").load("ManagerBoard.jsp");
		$("#li2").addClass("select_menu");
		$("#manager_serviceBoard_wrap ul li").click(function(){
			if($(this).text()=="공지사항추가"){
				$("#menuSelect").load("ManagerNotice.jsp");
				$("#li1").addClass("select_menu");
				$("#li2").removeClass("select_menu");
			}else{
				$("#menuSelect").load("ManagerBoard.jsp");
				$("#li2").addClass("select_menu");
				$("#li1").removeClass("select_menu");
			}
		})
		$(document).on("click",".titleClick",function(){
			var no = $(this).find(".hidden_span").text();
			location.href ="managerserviceboardupdate.do?no="+no;
		})  
		
	})
</script>
</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
	<div id="manager_serviceBoard_wrap">
		<ul>
			<li id="li1">공지사항추가</li>
			<li id="li2">1:1문의</li>
		</ul>
		<div id="menuSelect">
			
		</div>
	</div>
	<c:if test="${error !=null }">
		에러
	</c:if>
	<c:if test="${success !=null }">
		<script type="text/javascript">
			
		</script>
	</c:if>
</body>
</html>