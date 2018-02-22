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
		  slidesToShow: 5,
		  slidesToScroll: 1,
		  asNavFor: '.bigImg',
		  dots: false,
		  arrows:true,
		  focusOnSelect: true
		});
		$(document).on("click","button.slick-prev.slick-arrow, button.slick-next.slick-arrow",function(){
			$("#bigImgWrap .bigImg h3 video")[0].pause();
		});
	});
</script>
<style type="text/css">
	.bigImg{
		margin-bottom:10px;
	}
	#bigImgWrap{
		width:100%;
		margin:0 auto;
		background: #353535;
		padding-top:30px;
		padding-bottom:30px;
		height: 470px;
		
	}
	#bigImgWrap .bigImg{
		width:900px;
		margin:0 auto;
	}
	/* #bigImgWrap .bigImg .slick-prev:before, .slick-next:before{
		font-family: 'slick';
		font-size: 150px;
		line-height: -1;
		color: white !important;
	} */
	#container{
		max-width:990px;
		
		margin:0 auto;
	}
	.bigImg h3{
		/* text-align: center; */
	}
	#container #imgListDiv{
		width:950px;
		height:120px;
		margin:0 auto;

	} 
	.bigImg h3 img, .bigImg h3{
		text-align: center;
	}
	.bigImg h3 img, .bigImg h3 video{
		height:470px;
		max-width:835px;
		margin:0 auto;
	}
	
	#container #imgListDiv .imgList h3 img, #container #imgListDiv .imgList h3 video{
		/* max-width: 150px;	 */	
		height:84px;
		width:135px;
		margin:4px auto;
		text-align: center;
	}
	#movieInfo{
		width:100%;
		height:400px;
		/* margin:0 auto !important; */
	}
	#movieInfo #moviePoster{
		width:175px;
		text-align: center;
		float:left;
		overflow: hidden;
	}
	#moviePoster img{
		width: 175px;
		height: 250px;
	}
	#movieInfo #moviePoster a{
		width:100%;
		height:40px;
		margin-top:5px;
		background: #231F20;
		color:#CDC197;
		display:inline-block;
		text-decoration: none;
		line-height: 35px;
	}
	#textInfo{
		width:710px;
		padding-left:20px;
		padding-top:5px;
		float:left;
	}
	#textInfo h1{
		margin-bottom:30px;
	}
	#textInfo span h3{
		display: inline;
	}
	#textInfo span{
		margin-right:40px;
		margin-left:30px;
	}
	#textInfo table{
		margin-left:30px;
		margin-top:15px;
	}
	#synopsis{
		width:990px;
		margin:0 auto;
		margin-top:20px;
		margin-bottom:50px;
	}
	
	.title{
		width: 100px;
	}
	#grade{
		margin: 0px !important;
	}
</style>
</head>
<body>
   <jsp:include page="../include/header.jsp"></jsp:include>  
   <div id="bigImgWrap"> 
	   	<div class="bigImg">
	   		<h3><video src="/MovieProject/upload/${movie.movieNo}/${movie.pathVideo}" poster="/MovieProject/upload/${movie.movieNo}/${steelcut[0] }" controls></video></h3>
			<c:forEach var="item" items="${steelcut}" begin="2">
				<h3><img src="/MovieProject/upload/${movie.movieNo}/${item}"></h3>
			</c:forEach>
	   	</div>
   	</div>
   	
   	<div id="container">
   		<div id="imgListDiv">
   			<div class="imgList">
				<h3><video src="/MovieProject/upload/${movie.movieNo}/${movie.pathVideo}"poster="/MovieProject/upload/${movie.movieNo}/${steelcut[0] }"></video></h3>
				<c:forEach var="item" items="${steelcut}" begin="2">
					
					<h3><img src="/MovieProject/upload/${movie.movieNo}/${item}"></h3> 
				</c:forEach>
			</div>
   		</div>
   		
   		<div id="movieInfo">
   			<div id="moviePoster">
   				<img src="/MovieProject/upload/${movie.movieNo}/${movie.pathPoster}">
   				<a href="#">예매하기</a>
   			</div>
   			<div id="textInfo">
   				<table>
   					<tr>
   						<td colspan="4"><h1>${movie.movieName}</h1></td>
   					</tr>
   					<tr>
   						<td class="title"><h3>관람평점 </h3></td>
   						<td><span id="grade"></span></td>
   						<td class="title"><h3>등급 </h3></td>
   						<td>${movie.rating }세 이상 관람가</td>
   					</tr>
   					<tr>
   						<td class="title"><h3>개봉일 </h3></td>
   						<td>${openDate}</td>
   						<td class="title"><h3>방영시간 </h3></td>
   						<td>${movie.playTime }분</td>
   					</tr>
   					<tr>
   						<td class="title"><h3>스페셜관<br>상영정보 </h3></td>
   						<td colspan="3">
   							<table>
			   					<tr>
			   						<td><img src="../images/img_sinfo_01_off.jpg"></td>
			   						<td><img src="../images/img_sinfo_02_off.jpg"></td>
			   						<td><img src="../images/img_sinfo_03_off.jpg"></td>
			   						<td><img src="../images/img_sinfo_06_on.jpg"></td>
			   					</tr>
			   					<tr>
			   						<td><img src="../images/img_sinfo_08_off.jpg"></td>
			   						<td><img src="../images/img_sinfo_09_on.jpg"></td>
			   						<td><img src="../images/img_sinfo_10_on.jpg"></td>
			   						<td><img src="../images/img_sinfo_13_on.jpg"></td>
			   					</tr>
			   				</table>
   						</td>
   					</tr>
   				</table>
   			</div>
   			
   		</div>
   		<div id="synopsis">
			<h1>시놉시스</h1>
			<br>
			${movie.synopsis}
			<br>   				
		</div>
	</div>
	
	

	<jsp:include page="starBoard.jsp"></jsp:include>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>