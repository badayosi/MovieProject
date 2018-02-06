<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../include/managerHeader.jsp"></jsp:include>
	<div id="listBody">
		<table>
			<tr>
				<th>제목</th>
				<th>개봉일</th>
				<th>종료일</th>
			</tr>
			<c:forEach var="item" items="${movieList }">
				<tr>
					<td><a href="readMovie.do">${item.movieName}</a></td>
					<td>${item.openDate}</td>
					<td>${item.closeDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>