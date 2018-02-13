<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/slick.css" />
<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/slick.js"></script>
<script type="text/javascript">
	$(function(){
		$('.bigImg').slick({
			  slidesToShow: 1,
			  slidesToScroll: 1,
			  arrows: false,
			  fade: true,
			  asNavFor: '.imgList'
			});
			$('.imgList').slick({
			  slidesToShow: 3,
			  slidesToScroll: 1,
			  asNavFor: '.bigImg',
			  dots: true,
			  centerMode: true,
			  focusOnSelect: true
			});
	});
</script>
<style type="text/css">
	.bigImg{
		border:1px solid red;
		margin-bottom:10px;
	}
	.imgList{
		border:1px solid blue;
	}
</style>
</head>
<body>
   <jsp:include page="../include/header.jsp"></jsp:include>  
   	<div class="bigImg">
		<h3>1</h3>
   		<h3>2</h3>
   		<h3>3</h3>
   		<h3>4</h3>
   		<h3>5</h3>
   		<h3>6</h3>
   		<h3>7</h3>
   		<h3>8</h3>
   		<h3>9</h3>
   	</div>
   	
   	<div class="imgList">
   		<h3>1</h3>
   		<h3>2</h3>
   		<h3>3</h3>
   		<h3>4</h3>
   		<h3>5</h3>
   		<h3>6</h3>
   		<h3>7</h3>
   		<h3>8</h3>
   		<h3>9</h3>
   	</div>
   <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>