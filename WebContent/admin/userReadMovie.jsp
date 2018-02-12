<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$(".movieBigImg").slick({
			slidesToScroll:1,
			autoplay:true,
			autoplaySpeed:3000,
			infinite:true,
			arrows:false,
		});
	});
</script>
</head>
<body>
   <jsp:include page="../include/header.jsp"></jsp:include>
   	<div class="movieBigImg">
   		<c:forEach var="item" items="${movie }">
   			<h3><img src="/MovieProject/upload/${movie.movieNo}/"></h3>
   		</c:forEach>
   		
   	</div>
   <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>