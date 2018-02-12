<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" type="text/css" href="css/main.css?ver=3">
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
     #top_left{
     	width: 1115px;
     	width: 60%;
     	align-items: right;
     	flex-shrink:1;
     }
    #top_middle{
	    align-items: center;  
	    width:20%;
	    width: 315px !important; 
	    height:645px; 
	   	flex-shrink:1;
    }
    #top_right {
   		 width: 60%; 
   		 flex-shrink:1;
    }
    
    /* 메인 포스터 */
    #top{
      width: 100%;
      height: 100%;
    }
    #top_left,#top_right,#top_middle{
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
    /* 큰 포스터 */
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
	/* 작은 포스터 */
	#poster_middle {
      width: 1224px;
      margin:70px auto;
      height: 274px;
    }
    
    #poster_middle .swiper-slide {
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
</style>
<script type="text/javascript">
	$(function(){
		
		//제일 윗부분 화면
		var swiper = new Swiper('#top',
				{
				slidesPerView: 'auto',
			    spaceBetween: 20,
			    centeredSlides: false,
			    simulateTouch:false,
			    navigation: {
			        nextEl: '.swiper-button-next',
			        prevEl: '.swiper-button-prev',
			     },
			  });
		
		 var swiper = new Swiper('#poster', {
			  loop: true,
		      pagination: {
		        el: '.swiper-pagination',
		        clickable: true,
		      },autoplay: {
		    	    delay: 5000,
		      },
		    }); 
		
		 var swiper = new Swiper('#poster_middle', {
		      slidesPerView: 5,
		      spaceBetween: -47,
		      slidesPerGroup: 5,
		      loop: true,
		      loopFillGroupWithBlank: true,
		      navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
		      },
		    });
	})
	
	
</script>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	
	
	<div id="top" class="swiper-container" dir="rtl">
		<div class="swiper-wrapper">
			<div class="swiper-slide" id="top_left">
				<div id="poster"  class="swiper-container">
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
			
			<div class="swiper-slide" id="top_middle" width="315px">				
				<jsp:include page="boxoffice.jsp"></jsp:include>
			</div>
			
			<div class="swiper-slide" id="top_right">
				<img src="images/event.jpg">
			</div>	
		</div>
		<div class="swiper-button-next"></div>
   		<div class="swiper-button-prev"></div>
	</div>
	
	<div class="swiper-container" id="poster_middle">
	    <div class="swiper-wrapper">
	      <div class="swiper-slide"><img src="images/poster1.jpg"></div>
	      <div class="swiper-slide"><img src="images/poster1.jpg"></div>
	      <div class="swiper-slide"><img src="images/poster1.jpg"></div>
	      <div class="swiper-slide"><img src="images/poster1.jpg"></div>
	      <div class="swiper-slide"><img src="images/poster1.jpg"></div>
	      <div class="swiper-slide"><img src="images/poster2.jpg"></div>
	      <div class="swiper-slide"><img src="images/poster2.jpg"></div>
	      <div class="swiper-slide"><img src="images/poster2.jpg"></div>
	      <div class="swiper-slide"><img src="images/poster2.jpg"></div>
	      <div class="swiper-slide"><img src="images/poster2.jpg"></div>
	    </div>
	    <div class="swiper-button-next"></div>
	    <div class="swiper-button-prev"></div>
	</div>
	 
	<div id="event">
		<img src="images/card_event.jpg">
	</div>

	<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>