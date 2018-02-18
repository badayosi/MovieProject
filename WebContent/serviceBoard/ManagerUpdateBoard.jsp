<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
	#update_service_board{
		width:1024px;
		min-height:600px;
		margin:0 auto;
	}
	#update_service_board h3{
		margin-bottom:10px;
		border-bottom:1px solid #ccc;
	}
	#update_service_board form{
		width:730px;
		margin:0 auto;
	}
	#update_service_board form p{
		overflow:hidden;
		margin-bottom:15px;
		padding:0px 20px;
		text-align:center;
	}
	#update_service_board form p label{
		width:80px;
		float:left;
	}
	#update_service_board form p input#title{
		width:600px;
	}
	#update_service_board form p textarea{
		width:600px;
		height:200px;
	}
	#update_service_board form p:LAST-CHILD{
		
	}
	#update_service_board form p:LAST-CHILD input{
		width:70px;
		background: #231f20;
		color:#cdc197;
		height:30px;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function(){
		$("#update_from").submit(function(){
			$("input[name='content']").val($("input[name='content']").val().replace(/(?:\r\n|\r|\n)/g, '<br />'));
		})
	})
</script>
</head>
<body>
	<div id="update_service_board">
		<h3>공지사항수정</h3>
		<form action="managernoticeupdate.do" method="post" id="update_from">
			<input type="hidden" value="${notice.boardNo}" name="no">
			<p>
				<label>제목  </label>
				<input type="text" name="title" id="title" value="${notice.title }">
			</p>
			<p>
				<label>내용  </label>
				<textarea rows="" cols="" name="content">${notice.content }</textarea>
			</p>
			<p>
				<input type="button" value="취소">
				<input type="submit" value="수정">
			</p>
		</form>
	</div>
</body>
</html>