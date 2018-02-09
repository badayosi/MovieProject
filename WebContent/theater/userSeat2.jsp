<%@page import="movie.dto.Theater"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script>
  <style type="text/css">
  
  	/* 스크린 */
  	#screenContent{
  		background-image: url("../images/screen_bg.png");
  		text-align: center;
  		font-weight: 20px;
  		margin-bottom: 10px;		
  	}
  	/* 테이블 */
  	#tableContent{
  		background: #f9f8f3;
  		color: #848484;
  		margin: 0 auto;
  		padding: 20px;
  	}
  	#tableContent table {
		border-spacing:3px;
		margin:auto;
		text-align: center;
	}
	.seat{
		display: block;
		width: 18px;
  		height: 18px;
  		background: #848484;
  		color: white;
  		font-size: 13px;
	}
	.seat{
  		border: 2px solid black;
  		text-align: center;
  		padding: 10px;
  	}
  	.noSeat{
  		border: 2px solid red;
  		text-align: center;
  		padding: 10px;
  		display: none;
  	}
  	.tem{
  		background: #000000 !important;
  		color: white;
  		font-weight: bold;
  	}
  	.way{
  		margin-right:30px; 
  	}
  	.displayHidden{
  		display: none;
  	}  	
  	/* 폼태그 */
	label{
		width: 100px;
		padding-left: 10px;
		font-weight: bold;
	}	
	.btns button, input[type='submit']{
		background: #848484;
		padding: 5px 10px;
		font-weight: bold;
		color: white;		
	}

	#select{
		border:1px solid grey;
		padding-bottom:30px;
		margin-bottom: 10px;
	}
	/* 퀵메뉴 */
	#nav_condition{
		width: 500px;
		min-height: 300px;
		z-index: 10000;
		background:#555;
		/* position: fixed;
		top: 200px;
		left: -322px; */
	}
  </style>

<script type="text/javascript">
	$(function(){
		//저장버튼
		$("form[name='f2']").submit(function(){
			var selected = $(".tem").length;
			
			if(selected == 0){
				alert("인원 및 좌석을 선택해 주세요");
				return false;
			}
			if(selected!=num){
				alert(num-selected+"명 자리가 미 선택 되었습니다.인원 수정 또는 좌석을 추가로 선택해주세요.");
				return false;
			}else{
				var seat ="";
				$(".tem").each(function(i,obj){
					var a = $(obj).prop("tagName");
					seat += $(obj).html()+"/";
				})
				seat = seat.substring(0,seat.length-1);
				$("#input1").val(seat);
				return false;				
			}
			return false;
		})
			
		
		var num =0;
		//인원선택
		$("select").change(function(){
			var a = $("select[name='adult']").val();
			var t = $("select[name='teen']").val();
			num = parseInt(a)+parseInt(t);
			//alert(num);			
		})
		
		/* $(".seat").hover(function(){
			$(this).css("background","black");
		},function(){
			$(this).css("background","#848484");
		}) */
		
		//좌석 선택 할때
		$(document).on("click",".seat",function(){
			if(num<1){
				alert("인원선택해주세요.");
			}else{
				$(this).toggleClass("tem");
				
				var selected = $(".tem").length;
				
				if(selected > num){
					$(this).removeClass("tem");
					alert("인원을 초과해서 선택할 수 없습니다.");
				}
				else if(selected < num){
					$(".seat").css("background","#848484");
					$(".tem").css("background","black");
				}
				else if(selected = num){
					$(".seat").css("background","#D5D5D5");	
				}
			}
		}) 
		
	})
	
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<p id="test"></p>
	<div id="select">
		<h1>인원/좌석 선택</h1>
	</div>
		<form action="userSeat.do" method="post" name="f2">
			<div id="option">
				<label>성인</label>
				<select name="adult">
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
				</select>
				<label>청소년</label>
				<select name="teen">
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
				</select>		
			</div>
			<div id="nav_condition">
				<h2 id="nav_title">그것만이 내세상</h2>
				<span id="img"><img src="../images/bongi.jpg"></span>
				<ul>
					<li id="nav">예매정보</li>
		            <li id="nav_date"><span>상영일</span>2018-02-04</li>
		            <li id="nav_time"><span>상영시간</span>14:00</li>
		            <li id="nav_theater"><span>상영관</span>1관</li>
		            <li id="nav_seat"><span>좌석</span><input type="text" name="seat" id="input1"></li>
		            <li id="nav_price"><span>결제금액</span> 8,000원</li>            
		         </ul>
		         <input type="submit" value="다음단계">
	         </div>
		</form>
	
	
		
	<div id="screenContent">
		Screen
	</div>
	<div id="tableContent">
		<c:if test="${item.theaterTable!=null }">
			${item.theaterTable }
		</c:if>
		<c:if test="${item.theaterTable==null ||item.theaterTable==''}">
			<h1>좌석 설정이 되지 않은 상영관 입니다. 좌석 설정후 사용해 주세요.</h1>
		</c:if>  
	</div>
	

	
	
	<br>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>