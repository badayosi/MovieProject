<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	*{
		margin:0 auto;
		font-family: "나눔 고딕", 'Nanum Gothic', 'ng';
		padding: 0;
	}
	#manager_notice_wrap {
		width:80%;
		height:300px;
	}
	#manager_notice_wrap form{
		
	}
	#manager_notice_wrap form p{
		overflow:hidden;
		margin-bottom:10px;
	}
	#manager_notice_wrap form p label{
		width:100px;
		float:left;
	}
	#manager_notice_wrap form p input{
		width:699px;
	}
	#manager_notice_wrap form p textarea{
		width:700px;
		height:300px;
		resize:none;
	}
	#manager_notice_wrap form #form_btn_wrap input{
		width:100px;
		height:30px;
	}
	#manager_notice_wrap form p:last-child{
		text-align: center;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#insertCencel").click(function(){
			if(confirm("입력된 내용을 취소하겠습니까?")){
				$("#notice_title").val("");
				$("#notice_content").val("");
			}
		})
	})
</script>
</head>
<body>
	<div id="manager_notice_wrap">
		<form action="managernoticeinsert.do" method="post">
			<p>
				<label>제목 : </label>
				<input type="text" id="notice_title" name="title">
			</p>
			<p>
				<label>내용 : </label>
				<textarea rows="" cols="" id="notice_content" name="content"></textarea>
			</p>
			<p id="form_btn_wrap">
				<input type="button" value="취소" id="insertCencel">
				<input type="submit" value="추가" id="insertBtn">
			</p>
		</form>
	</div>
</body>
</html>