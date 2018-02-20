<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>DGV 환영합니다</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#findIdForm").submit(function() {
		
		if($("input[name='name']").val() == ""){
			$("input[name='name']").focus();
			return false;
		}
		if($("input[name='email']").val() == ""){
			$("input[name='email']").focus();
			return false;
		}
	})
	$("#findPwForm").submit(function() {
		
		if($("input[name='id']").val() == ""){
			$("input[name='id']").focus();
			return false;
		}
		if($("input[name='email']").val() == ""){
			$("input[name='email']").focus();
			return false;
		}
	})

})
</script>
<style>
	#content{
		width: 1024px;
		margin: 0 auto;
		overflow: hidden;
	}
	#content h2{
		display:block;
		margin-top:20px;
		margin-bottom: 40px;
	}
	#leftWrap, #rightWrap{
		float: left;
		width: 512px;
		margin: 0;
	}
	
	p{
		margin-bottom: 20px;
	}
	label{
		display:inline-block;
		width: 150px;
		font-size: 20px;
	}
	
	input{
		height: 30px;
		width: 200px;
	}
	#findId{
		padding-top:40px;
		font-size: 20px;
		font-weight: bold;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="content">
		
			<h2>아이디/비밀번호 찾기</h2>
			
			<div id="leftWrap">
					<form action="findId.do" method="post" id="findIdForm">
						<p>
							<label>이름</label> <input type="text" name="name">
						</p>
						<p>
							<label>이메일</label> <input type="text" name="email">
						</p>
						<input type="submit" id="loginBtn" value="아이디 찾기">
						
					</form>				
			</div>
			
			<div id="rightWrap">
					<form action="login.do" method="post" id="findPwForm">
						<p>
							<label>아이디</label> <input type="text" name="id">
						</p>
						<p>
							<label>이메일</label> <input type="text" name="email">
						</p>
						<input type="submit" id="loginBtn" value="비밀번호 찾기">
					</form>
			</div>
			
			<c:if test="${id!=null }">
				<div id="findId">
					<br><br>
					귀하의 아이디는 ${id } 입니다.
				</div>
			</c:if>
	
	</div>
</body>
</html>