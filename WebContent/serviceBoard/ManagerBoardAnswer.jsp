<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/MovieProject/css/manager.css"> 
<style>
	#answerwrap{
		width:1024px;
		margin:0 auto;
	}
	#answerwrap textarea{
		width:600px;
		height:200px;
		resize:none;
	}
	.label, .con{
		display: inline-block;
		margin-bottom: 10px;
	}
	.con{
		width: 700px;
	}
	.label{
		width: 200px;
		font-size: 16px;
		font-weight: bold;
	}
	
	.box1{
		position: relative;
	}
	#t1{
		top: 5px;
	}
	
	
	label {
		display:inline-block;
		font-size: 16px;
		font-weight: bold;
		width: 200px;	
	}
	input[type='text']{
		width: 700px;
		height: 120px;
	}
	#btn input{
		text-align: center;
		font-size: 15px;
		padding: 5px 10px;
		margin-top: 10px;
		font-weight: bold;
		background: #CDC197;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).on("submit","#answer_update",function(){
			$("#answerContent").val($("#answerContent").val().replace(/(?:\r\n|\r|\n)/g, '<br />'));
			alert($("#answerContent").val());
		})
	})
</script>
</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
	
	
	
	<div id="answerwrap">
		<h2>문의 답변 하기</h2>
		<table>
			<tr>
				<td class="label">제목</td>
				<td class="con">${sb.title }</td>
			</tr>
			<tr>
				<td class="label">회원명</td>
				<td class="con">${sb.userId }</td>
			</tr>
			<tr>
				<td class="label">내용</td>
				<td class="con" id="content">${sb.content }</td>
			</tr>
			<tr>
				<td class="label">첨부파일</td>
				<td class="con">
					<c:if test="${sb.filename !=null }">
					<img src="${sb.filepath }/${sb.filename}" id="fileImg">
					</c:if>
				</td>
			</tr>
			<tr>
				<td>
					<form action="managerserviceboardupdateanswer.do" method="get" id="answer_update">
					<input type="hidden" value="${sb.boardNo}" name="no">
						<label>답글 </label>
						<input type="text" name="answerContent" id="answerContent">
						
					<p id="btn">
						<input type="reset" value="취소">
						<input type="submit" value="전송">
					</p>
					</form>
				</td>
			</tr>
		</table>
	<%-- <div class="box">
		<p class="label" id="title"> </p>
		<p class="con">${sb.title }</p>
	</div>
		<p class="label" id="userId">유저명 : </p>
		<p class="con">${sb.userId }</p>
	
		<p class="label">내용 : </p>
		<p class="con" id="content">${sb.content }</p>
	
	<div class="box1">	
		<p class="label" id="t1">첨부파일 : </p>
		<div class="con">
			<c:if test="${sb.filename !=null }">
				<img src="${sb.filepath }/${sb.filename}" id="fileImg">
			</c:if>
		</div>
	</div> --%>
		
	</div>
</body>
</html>