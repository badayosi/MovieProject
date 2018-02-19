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
		width:80%;
		margin:0 auto;
	}
	.bigImg h3 img{
		width:800px;
		margin:0 auto;
	}
	.bigImg h3{
		/* text-align: center; */
	}
	.bigImg h3 video{
		width:900px;
		margin:0 auto;
	}
	#container #imgListDiv{
		width:950px;
		height:120px;
		margin:15px auto;
		
	} 
	#container #imgListDiv .imgList h3 img{
		width:150px;
		margin:10px auto;
	}
	#container #imgListDiv .imgList h3 video{
		width:150px;
		margin:10px auto;
	}
	#movieInfo{
		width:990px;
		height:400px;
		margin:0 auto;
	}
	#movieInfo #moviePoster{
		width:229px;
		text-align: center;
		float:left;
		overflow: hidden;
	}
	#movieInfo #moviePoster a{
		width:100%;
		height:40px;
		margin-top:15px;
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
   				<h1>${movie.movieName}</h1>
   				<span class="info1"><h3>관람평점 </h3>${movie.grade }점</span>
   				<span class="info2"><h3>등급 </h3>${movie.rating }세 미만 관람 불가</span>
   				<br>
   				<span class="info3"><h3>개봉일 </h3>${openDate}</span>
   				<span class="info4"><h3>방영시간 </h3>${movie.playTime }분</span>
   				<br>
   				<br>
   				<br>
   				<span class="info5"><h3>스페셜관 상영정보 </h3></span>
   				<br>
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
   			</div>
   			
   		</div>
	</div>
	<div id="synopsis">
		<h1>시놉시스</h1>
		${movie.synopsis}   				
	</div>
	

	<%-- <jsp:include page="../starBoard.jsp"></jsp:include> --%>
   <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>