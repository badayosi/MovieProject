<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		font-family: "나눔 고딕", 'Nanum Gothic', 'ng';
	}
	#joinForm{
		width:1024px;
		min-height: 600px;
		margin:0 auto;
	}
	#joinForm #jF p label{
		width:150px;
		float:left;
		font-size:20px;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="joinForm">
		<h2>회원정보입력</h2>
		<form action="join.do" method="post" id="jF">
			<p>
				<label>아이디</label>
				<input type="text" name="id">
			</p>
			<p>
				<label>비밀번호</label>
				<input type="password" name="pw">
			</p>
			<p>
				<label>비밀번호 확인</label>
				<input type="password" name="pwch">
			</p>
			<p>
				<label>이메일주소</label>
				<input type="email" name="email">
			</p>
			<p>
				<label>휴대폰 번호</label>
				<select name="tel1">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select>
				<input type="email" name="tel2">
				<input type="email" name="tel3">
			</p>
			<p>
				<label>성별</label>
				<input type="radio" name="gender" value="여자">여자
				<input type="radio" name="gender" value="남자">남자
			</p>
			
			<p>
				<label>주소</label>
				<select name="tel1">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select>
			</p>
			
		</form>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>