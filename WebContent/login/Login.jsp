<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#loginContainer {
	min-height: 600px;
	width: 100%;
	background: #f9f6ec;
}

#loginWrap {
	min-height: 600px;
	width: 1024px;
	margin: 0 auto;
}
#leftWrap{
	float: left;
	width:60%;
}
#loginForm {
	width: 100%;
	height: 200px;
	position: relative;
	background: #fff;
	
}

#loginForm p {
	margin-bottom: 10px;
	position: absolute;
}

#loginForm p label {
	width: 100px;
	font-size: 20px;
	display: inline-block;
}

#loginForm p input {
	height: 30px;
	width: 200px;
}

#loginBtn {
	clear: left;
	background: url("../images/loginImg.PNG") no-repeat;
	width: 125px;
	height: 110px;
	position: absolute;
	top: 40px;
	right: 100px;
}

#loginWrap h2 {
	padding: 20px;
}

#p1 {
	top: 25px;
	left: 50px;
}

#p2 {
	top: 65px;
	left: 50px;
}

#searchWrap {
	top: 120px;
	left: 180px;
}

#searchWrap a {
	text-decoration: none;
	color:black;
}
     
#imgWrap {
	width: 35%;
	height: 300px;
	float: left;
}

#imgWrap img {
	width: 100%;
	height: 100%;
}

#memberWrap {
	
	width: 100%;
	height:100px;
	background: #fff;
}
#memberWrap a h1{
	padding-top:15px;
	text-align: center;
	
}
#memberWrap a{
	color:red;
	text-decoration: none;
}
</style>
<title>DGV 환영합니다</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#loginForm").submit(function() {
			
			if($("#p1 input").val() == ""){
				$("#p1 input").focus();
				return false;
			}
			if($("#p2 input").val() == ""){
				$("#p2 input").focus();
				return false;
			}
		})

	})
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="loginContainer">
		<div id="loginWrap">
			<h2>로그인</h2>
			<div id="leftWrap">
				<form action="login.do" method="post" id="loginForm">
					<p id="p1">
						<label>아이디</label> <input type="text" name="id">
					</p>
					<p id="p2">
						<label>비밀번호</label> <input type="password" name="password">
					</p>
					<input type="submit" id="loginBtn">
					<p id="searchWrap">
						<a href="#">아이디/비밀번호 찾기</a>
					</p>
					<c:if test="${error !=null}">
						<script type="text/javascript">
							alert("${error}");
						</script>
					</c:if>
				</form>
				<div id="memberWrap">
					<a href="#"><h1>회원가입</h1></a>
				</div>
			</div>
			<div id="imgWrap">
				<img src="../images/loginImg2.PNG">
			</div>

		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>