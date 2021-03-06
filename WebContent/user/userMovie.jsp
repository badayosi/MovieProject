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
<style type="text/css">
	@import url("/MovieProject/css/common.css");
	body{
		margin: 0;
		padding: 0;
	}
	.bxslider{
		width: 1024px !important;
		margin:0 auto !important;
	}
	#movieListBtn{
		width:100%;
		text-align: center;
		margin-top:40px;
		margin-bottom:20px;
	}
	#movieListBtn ul li{
		display:inline-block;
		width:175px;
		height:50px;
		border:1px solid black;
		background: #EFEBDB;
	} 
	#movieListBtn ul a li{
		font-size: 1.2em;
		line-height: 50px;
		text-decoration: none;
		font-weight:bold;
		color:#7C7056;
	} 
	.selectList{
		background: url("${pageContext.request.contextPath}/images/btn_st02_on.gif") no-repeat !important;
		color: #CDC197 !important;
	}
	#listArea{
		width:1024px;
		margin:0 auto;
		text-align: center;
		
	}
	/* #listArea table{
		width:100%;
		margin:0 auto;
	}
	#listArea table tr td{
		 
	}
	#listArea table tr td .listDiv{
		text-align: center;
		width:250px;
		position: relative;
	} */
	
	/* #listArea table tr td .hiddenText{
		width:100%; 
		height:350px;
		background:black;
		opacity:0.7;
		position: absolute;
		left: 0;
		top:0;
		display: none;
	}
	
	
	#listArea table tr td .hiddenText a{
		width:100px;
		height:100px;
		border:1px solid #B2A980;
		color:#B2A980;
		line-height: 300px;
		padding:15px;
		font-weight: bold;
		font-size: 1.1em;
		text-decoration: none;
	}
	
	
	table tr td .listDiv .mPoster{
		width:250px;
		height:350px;
	} */
	.mPoster{
		width:228px;
		height:334px;
	}
	
	.listMovieli .hiddenText{
		width:100%; 
		height:350px;
		background:black;
		opacity:0.7;
		position: absolute;
		left: 11px;
		top:0;
		width:228px;
		height: 334px;
		display: none;
		z-index: 10;
	}

	
	.listMovieli .hiddenText a{
		width:100px;
		height:100px;
		border:1px solid #B2A980;
		color:#B2A980;
		line-height: 300px;
		padding:15px;
		font-weight: bold;
		font-size: 1.1em;
		text-decoration: none;
		z-index: 10;
	}
	
	.listMovieul{
		width:1024px;
		overflow: hidden;
	}
	.listDiv{
		display: inline-block;
		border:1px solid black;
		width:228px;
		margin: 0;
		padding: 0;
	}
	.listDiv a{
		display: inline-block;
		margin-top:5px;
		margin-bottom: 10px;
		text-decoration: none;
		color: black;
	}
	.listMovieul li{
		/* border:1px solid black; */
		list-style: none;
		padding-bottom:20px;
		width: 250px;
		display: inline-block;
		float: left;
		position: relative;
	}
</style>
<script type="text/javascript">
$(function() {
	$(".slider").slick({
		slidesToScroll:1,
		autoplay:true,
		autoplaySpeed:3000,
		infinite:true,
		arrows:false,
	});
	
	$.ajax({
		url:"listMovie.do",
		type:"get",
		dataType:"json",
		success:function(json){
			console.log(json);
			var date=new Date();
			var nowDate=date.getTime();
			
			var listTag="<ul class='listMovieul'>";
			
			$(json).each(function(i,obj){
				if(obj.openDate<nowDate && obj.closeDate>nowDate){
					listTag+="<li class='listMovieli'><div class='listDiv'><img class='mPoster' src='/MovieProject/upload/"+obj.movieNo+"/"+obj.pathPoster+"'>"
								+"<a href='userReadMovie.do?no="+obj.movieNo+"'><p>"+obj.movieName+"</p></a></div>"
								+"<div class='hiddenText'><a href='/MovieProject/reservation/ReservationInsert_Member.jsp'>예매하기</a><a href='userReadMovie.do?no="+obj.movieNo+"'>상세보기</a></div></li>";
					
				}
			})
			listTag+="</ul>";
			$("#listArea").append(listTag);
		}
	}) 
	
	$("#movieListBtn ul a:first-child li").addClass("selectList");
	
	$("#movieListBtn ul a").click(function(){
		$("#listArea").empty();
		$("#movieListBtn ul a li").removeClass("selectList");
		$(this).find("li").addClass("selectList");
		var date=new Date();
		var nowDate=date.getTime(); 
		var listTag="";
		
		if($(this).index()==0){
			$.ajax({
				url:"listMovie.do",
				type:"get",
				dataType:"json",
				success:function(json){
					console.log(json);
					
					var listTag="<ul class='listMovieul'>";
					
					$(json).each(function(i,obj){
						if(obj.openDate<nowDate && obj.closeDate>nowDate){
							listTag+="<li class='listMovieli'><div class='listDiv'><img class='mPoster' src='/MovieProject/upload/"+obj.movieNo+"/"+obj.pathPoster+"'>"
										+"<a href='userReadMovie.do?no="+obj.movieNo+"'><p>"+obj.movieName+"</p></a></div>"
										+"<div class='hiddenText'><a href='/MovieProject/reservation/ReservationInsert_Member.jsp'>예매하기</a><a href='userReadMovie.do?no="+obj.movieNo+"'>상세보기</a></div></li>";
							
						}
					})
					listTag+="</ul>";
					$("#listArea").append(listTag);
				}
			})
		}else if($(this).index()==1){
			$.ajax({
				url:"listMovie.do",
				type:"get",
				dataType:"json",
				success:function(json){
					console.log(json);
					var date=new Date();
					var nowDate=date.getTime();
					


					var listTag="<ul class='listMovieul'>";
								
								$(json).each(function(i,obj){
									if(obj.openDate>nowDate){
										listTag+="<li class='listMovieli'><div class='listDiv'><img class='mPoster' src='/MovieProject/upload/"+obj.movieNo+"/"+obj.pathPoster+"'>"
													+"<a href='userReadMovie.do?no="+obj.movieNo+"'><p>"+obj.movieName+"</p></a></div>"
													+"<div class='hiddenText'><a href='/MovieProject/reservation/ReservationInsert_Member.jsp'>예매하기</a><a href='userReadMovie.do?no="+obj.movieNo+"'>상세보기</a></div></li>";
										
									}
								})
					listTag+="</ul>";
					
					$("#listArea").append(listTag);
				}
			})
		}
	});
	
	$(document).on("mouseover", "td .listDiv",function(){
		$(this).find(".hiddenText").css("display", "block");
	})
	
	$(document).on("mouseout","td .listDiv",function(){
		$(".hiddenText").css("display","none");
	});
	
	
	

	$(document).on("mouseover", ".listMovieli",function(){
		$(this).find(".hiddenText").css("display", "block");
	})
	
	
	$(document).on("mouseout",".listMovieli",function(){
		$(".hiddenText").css("display","none");
	});
});
</script>
</head>
<body>
   <jsp:include page="../include/header.jsp"></jsp:include>
   	<div class="slider">
			<h3><img src="../images/bximg/50shadow.png" title="50가지 그림자 해방"></h3>
			<h3><img src="../images/bximg/black.png" title="블랙팬서"></h3>
			<h3><img src="../images/bximg/conan.png" title="명탐정 코난 감벽의 관"></h3>
			<h3><img src="../images/bximg/earth.png" title="지구 놀라운 하루"></h3>
			<h3><img src="../images/bximg/hungbo.png" title="흥부"></h3>
			<h3><img src="../images/bximg/josun.png" title="조선명탐정 흡혈괴마의 비밀"></h3>
			<h3><img src="../images/bximg/little_forest.png" title="리틀 포레스트"></h3>
			<h3><img src="../images/bximg/paddington.png" title="패딩턴2"></h3>
   	</div>
   	<div id="movieListBtn">
   		<ul>
	   		<a href="#"><li>현재 상영작</li></a>
	   		<a href="#"><li>상영예정작</li></a>
   		</ul>
   	</div>
   	
   	<div id="listArea">
		
   	</div>
   	
   	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>