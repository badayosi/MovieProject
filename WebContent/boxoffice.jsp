<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Swiper demo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="css/swiper.min.css">
<script type="text/javascript" src="js/swiper.min.js"></script>

<style type="text/css">
	/* 박스오피스  */
	
    #movie_table{
    	width: 100%;
    }
    .officeTop{
    	height: 153px;
    	background: #2a2e33;
    	text-align: center;
    }
    .officeTop ul{
    	list-style: none;
    	margin: 0;
    	padding: 0;
    	/* width: 162px;
    	height: 22px; */
    }
    .officeTop li{
    	display:inline-block;
    	float: left;
    	padding: 0 20px;
    }
    .officeTop li:FIRST-CHILD{
    	border-right:1px solid grey;
    	padding-left: 96px;
    }
    .officeTop a{
    	text-decoration: none;
    	color: white;
    	font-size: 15px;
    }
    
    .officeMiddle{
    	height: 378px;
    	padding: 20px 0px;
    	
    }
    .officeBottom{
    	height: 64px;
    	background: #ee1c25;
    	color: white;
    	text-align: center;
    	
    }
    .officeBottom a{
    	text-decoration: none;
    	color: white;
    	font-weight: bold;
    	font-size:18px;
    	line-height:64px;
    }
    
    #movieZone{
		width:95%;
		height:100%;
		margin:0 auto;
		list-style:none;
		padding:0;
	}
	#movieZone li{
		width:100%;
		height:30px;
		margin-bottom:10px;
	}
	#movieZone li a{
		display:block;
		width:100%;
		height:30px;
		padding:0;
		margin:0;
		line-height:30px;
	}
	#movieZone li a div{
		float:left;
	}
	#movieZone .rating{
		width:30px;
		height:30px;
	}
	#movieZone .age12{
		background-repeat:no-repeat;
		background-image:url("images/rating_12.png");
		background-position:center center;
	}
	#movieZone .age15{
		background-repeat:no-repeat;
		background-image:url("images/rating_15.png");
		background-position:center center;
	}
	#movieZone .age18{
		background-repeat:no-repeat;
		background-image:url("images/rating_18.png");
		background-position:center center;
	}
	#movieZone .ageall{
		background-repeat:no-repeat;
		background-image:url("images/rating_all.png");
		background-position:center center;
	}
	#movieZone .movieName{
		color:black;
	}
	#movieZone .selectMovie{
		font-weight: bold;
	}
	
	#movieZone li{
		padding: 5px;
	}
</style>
<script type="text/javascript">
	$(function(){
		loadAllMovie();
		
		$(document).on("mouseover","#movieZone li",function(){
			$(this).css("border","3px solid #CDC197");
		})
		$(document).on("mouseout","#movieZone li",function(){
			$(this).css("border","none");
		})
	})
	function loadAllMovie(){
	$.ajax({
		url:"reservation/reservationAjax.do",
		type:"get",
		dataType:"json",
		success:function(json){ 
			var date=new Date();
			var nowDate=date.getTime();
			
			var makeMovieList;
			var length = json.length;
			if(length>9){
				length=8;
			}
			for(var index=0;index<length;index++){
				if(json[index].closeDate<nowDate || json[index].openDate>nowDate){
					continue;
				}else{
					
					makeMovieList = "";
					makeMovieList += "<li>";
					makeMovieList += "<a href='/MovieProject/reservation/ReservationInsert_Member.jsp'>";
					
					makeMovieList += "<div class='rating";				
					switch(json[index].rating){
						case 12:
							makeMovieList += " age12'>";
							break;
						case 15:
							makeMovieList += " age15'>";
							break;
						case 18:
							makeMovieList += " age18'>";
							break;
						default:
							makeMovieList += " ageall'>";
							break;
					}
					makeMovieList += "</div>";
					makeMovieList += "<div class='movieName'>" + json[index].movieName + "</div>";
					makeMovieList += "<input type='hidden' name='movieKey' value=" + json[index].movieNo +">";
					makeMovieList += "</a>";
					
					makeMovieList += "</li>";
					$("#movieZone").append(makeMovieList);
				}
			}
		}
	});
}
</script>
</head>
<body>


	<div class="swiper-slide"  id="top_middle">
  		<table id="movie_table">
  			<tr>
  				<td class="officeTop">
					<h2><img src="images/boxoffice.png"></h2>
					<ul>
						<li><a href="#">예매순</a></li>
						<li><a href="#">평점순</a></li>
					</ul>
				</td>
			</tr>
			<tr>
  				<td class="officeMiddle">
					<ul id="movieZone">
					
					</ul>
				</td>
			</tr>
			<tr>
  				<td class="officeBottom">
					<a href="/MovieProject/reservation/ReservationInsert_Member.jsp">예매하기</a>
				</td>
			</tr>
		</table>
	</div>
	
</body>
</html>