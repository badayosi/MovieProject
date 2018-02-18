<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#content{
		width: 1024px;
		margin: 0 auto;
	}
	#content table{
		width: 1024px;
	}
	#content table, tr, th, td{
		border: 1px solid grey;
		border-collapse: collapse;
		text-align: center;
	}
	#content th, #content td{
		padding: 10px;
	}
	#insert{		
		text-align:right;

	}
	#insert button{
		font-size: 15px;
		background: #848484;
		padding: 5px 10px;
		font-weight: bold;
		color: white;
	}
</style>
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script> 
</head>
<body>
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
	<div id="content">
		<table>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>포인트</th>
				<th>이메일</th>
				<th>폰번호</th>
				<th>주소</th>
				<th>성별</th>
				<th>등급</th>
				<th>수정</th>
			</tr>
				<c:forEach var="item" items="${list }">
			<tr>
				<td>${item.userId}</td>
				<td>${item.password}</td>
				<td>${item.name }</td>
				<td>${item.point }</td>
				<td>${item.email }</td>
				<td>0${item.phone }</td>
				<td>${item.addr }</td>
				<td>${item.gender }</td>
				<td>${item.userRank }</td>
				<td><a href="userUpdate.do?no=${item.userId}">수정</a></td>
			</tr>
			</c:forEach>
			<tr>
			
			</tr>
			
		</table>
		
	</div>
	
</body>
</html>