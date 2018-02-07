<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#listBody{
		width:60%;
		margin:0 auto;
		text-align: center;
	}
	#listBody #btnAdd{
		float:right;
	}
	#listBody table{
		clear:both;
		border-collapse: collapse;
		width:100%;
		margin:0 auto;
	}
	#listBody table tr th,td{
		border:1px solid black;
	}
	#listBody table tr th{ 
		width:200px;
	}
</style>
</head>
<body>
<jsp:include page="../include/managerHeader.jsp"></jsp:include>
	<div id="listBody">
		<a id="btnAdd" href="managerAddMovie.do">영화추가</a>
		<br><br>
		<table>
			<tr>
				<th>제목</th>
				<th>개봉일</th>
				<th>종료일</th>
			</tr>
			<c:forEach var="item" items="${movieList }">
				<tr>
					<td><a href="managerReadMovie.do?no=${item.movieNo }">${item.movieName}</a></td>
					<td>${item.openDate}</td>
					<td>${item.closeDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>