<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" href="css/swiper.min.css">
 <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="js/swiper.min.js"></script>
<style type="text/css">
 	*{
 		position:relative;
 		margin:0 auto;
		font-family: "나눔 고딕", 'Nanum Gothic', 'ng';
		padding: 0;
		margin: 0;
 	}
 	#event{
 		width:1024px;
 		margin:0 auto;
 	}
 	#top_left{
 		
 	}
 	#top_middle{
 		
 	}
 	#top_right{
 	
 	
 	}
 	#top{
 	}
 	/* 메인 큰화면 */
 	.swiper-container {
      width: 100%;
      height: 100%;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      width: 100%;
      /* Center slide text vertically */
       display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
      
    }
     .swiper-slide:nth-child(1n){
     	width: 1115px;
     	width: 60%;
     	align-items: right;
     	flex-shrink:1;
     }
    .swiper-slide:nth-child(2n) {
	     width: 20%;
	     align-items: center;  
	    /*  width: 315px;  */  
	   	flex-shrink:1;
    }
    .swiper-slide:nth-child(3n) {
   		 width: 60%; 
   		 flex-shrink:1;
    }
    
    /* 메인 포스터 */
    #top .swiper-container1 {
      width: 100%;
      height: 100%;
    }
    .swiper-slide1 {
      text-align: center;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    #poster{
      width: 1115px;
      height:645px;
    }
    #poster .swiper-slide {
      height:645px;
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    

</style>
<script type="text/javascript">
	$(function(){
		
		//제일 윗부분 화면
		var swiper = new Swiper('.swiper-container',
				{
				slidesPerView: 'auto',
			    spaceBetween: 20,
			    centeredSlides: false,
			    pagination: {
			      el: '.swiper-pagination',
			      clickable: true,
			    },navigation: {
			        nextEl: '.swiper-button-next',
			        prevEl: '.swiper-button-prev',
			     },
			  });
		/* 
		 var swiper = new Swiper('#poster', {
		      pagination: {
		        el: '.swiper-pagination',
		      },
		    }); */
		
		
		
	})
</script>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	
	<div id="top" class="swiper-container" dir="rtl">
		<div class="swiper-wrapper">
			<div class="swiper-slide" id="top_left" class="swiper-container1">
				<div id="poster">
				    <div class="swiper-wrapper">
				      <div class="swiper-slide">
				      	<img src="images/post1.png">
				      </div>
				      <div class="swiper-slide">
				      	<img src="images/post2.jpg">
				      </div>
				      <div class="swiper-slide">
				      	<img src="images/post3.jpg">
				      </div>
				    </div>
				    <!-- Add Pagination -->
				    <div class="swiper-pagination"></div>
			 	 </div>
			</div>
			
			<div class="swiper-slide" id="top_middle">
				<img alt="event" src="images/test1.png">
			</div>
			
			<div class="swiper-slide" id="top_right">
				<img alt="event" src="images/event.jpg">
			</div>	
					
		</div>
		<div class="swiper-button-next"></div>
   		<div class="swiper-button-prev"></div>
	</div>
	<div id="poster">
		
	</div>
	<div id="event">
		<img src="images/card_event.jpg">
	</div>

	<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>