<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
</style>
<script type="text/javascript">
	$(function(){
		$("#answer_update").submit(function(){
			$("textarea[name='answerContent']").text().replace(/(?:\r\n|\r|\n)/g, '<br />');
		})
	})
</script>
</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
	<div id="answerwrap">
		<p id="title">제목 : ${sb.title }</p>
		<p id="userId">유저명 : ${sb.userId }</p>
		<p>내용</p>
		<p id="content">${sb.content }</p>
		<p>첨부파일</p>
		<c:if test="${sb.filename !=null }">
			<img src="${sb.filepath }/${sb.filename}" id="fileImg">
		</c:if>
		
		<form action="managerserviceboardupdateanswer.do" method="get" id="answer_update">
			<input type="hidden" value="${sb.boardNo}" name="no">
			<p>
				<label>답글 </label>
				<textarea rows="" cols="" name="answerContent"></textarea>
			</p>
			<p>
				<input type="reset" value="취소">
				<input type="submit" value="전송">
			</p>
			
		</form>
	</div>
</body>
</html>