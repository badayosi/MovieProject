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
  	/* 테이블 */
  	#tableContent{
  		border: 1px solid black;
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
	span{
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
  		background: #000000;
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
  </style>

<script type="text/javascript">
	$(function(){
		
		//저장버튼
		$("form[name='f1']").submit(function(){
			
		})
		
		//좌석 선택 할때
		$(document).on("click","span",function(){
			$(this).toggleClass("tem");
		})
		var num =0;
		//인원선택
		$("select").change(function(){
			var a = $("select[name='adult']").val();
			var t = $("select[name='teen']").val();
			num = parseInt(a)+parseInt(t);
			//alert(num);			
		})
		
		//좌석 선택 할때
		$(document).on("click","span .seat",function(){
			$(this).toggleClass("tem");
			
			var selected = $(".seat").length;
		})
		
		
		
	})
	
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<p id="test"></p>
	<div id="select">
		<h1>인원/좌석 선택</h1>
		<form action="userSeat.do" method="post">
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
			
			<input type="submit" value="다음단계">
		</form>
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