<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/slick.css" />
<link rel="stylesheet" type="text/css" href="../css/slick-theme.css" />
<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/slick.js"></script>
<script type="text/javascript">
	$(function(){
		$('.bigImg').slick({
			  slidesToShow: 1,
			  slidesToScroll: 1,
			  arrows: true, 
			  fade: true,
			  asNavFor: '.imgList'
			});
			$('.imgList').slick({
			  slidesToShow: 6,
			  slidesToScroll: 1,
			  asNavFor: '.bigImg',
			  dots: false,
			  arrows:true,
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
	#bigImgWrap{
		width:100%;
		margin:0 auto;
		background: #353535;		
	}
	#bigImgWrap .bigImg{
		width:55%;
		margin:0 auto;
	}
	#bigImgWrap .bigImg .slick-prev:before, .slick-next:before{
    font-family: 'slick';
    font-size: 150px;
    line-height: 0;

    opacity: .75;
    color: white !important;

}
	#container{
		width:70%;
		margin:0 auto;
	}
	.bigImg h3 img{
		width:400px;
		margin:0 auto;
	}
	#container #imgListDiv{
		width:800px;
		height:200px;
		margin:0 auto;
	} 
	#container #imgListDiv .imgList h3 img{
		width:100px;
		margin:0 auto;
	}
	.
</style>
</head>
<body>
   <jsp:include page="../include/header.jsp"></jsp:include>  
   <div id="bigImgWrap">
	   	<div class="bigImg">
	   		<h3><img src="/MovieProject/upload/${movie.movieNo}/${movie.pathVideo}"></h3>
	   		<h3><img src="/MovieProject/upload/${movie.movieNo}/${movie.pathPoster}"></h3>
			<c:forEach var="item" items="${steelcut}">
				<h3><img src="/MovieProject/upload/${movie.movieNo}/${item}"></h3>
			</c:forEach>
	   	</div>
   	</div>
   	<div id="container">
   		<div id="imgListDiv">
   			<div class="imgList">
				<h3><img src="/MovieProject/upload/${movie.movieNo}/${movie.pathVideo}"></h3>
				<h3><img src="/MovieProject/upload/${movie.movieNo}/${movie.pathPoster}"></h3>
				<c:forEach var="item" items="${steelcut}">
					<h3><img src="/MovieProject/upload/${movie.movieNo}/${item}"></h3>
				</c:forEach>
			</div>
   		</div>
   		
	</div>
   <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>