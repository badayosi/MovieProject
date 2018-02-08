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
  	form{
		width: 400px;		
		
		margin-left: 100px;
	}
	label{
		width: 100px;
		padding-left: 10px;
		font-weight: bold;
	}
	input[type='text']{
		height: 22px;
		border: 1px solid grey;
	}
	
	p:LAST-CHILD {
		text-align: center;
	}
	.btns{
		float: right;
		margin-right: 120px;
	}
	.btns button, input[type='submit']{
		background: #848484;
		padding: 5px 10px;
		font-weight: bold;
		color: white;		
	}
	.btns button{
		margin: 20px;
	}
	
  </style>
<%	
	
	Theater t = (Theater)request.getAttribute("item");
	
	int col = t.getCol();
	int num = t.getTheaterMaxcount();
	
	String row1 = t.getRow();
	
%>
<script type="text/javascript">
	$(function(){
		
		//저장버튼
		$("form[name='f1']").submit(function(){
			
		})
		
		//좌석 선택 할때
		$(document).on("click","span",function(){
			$(this).toggleClass("tem");
		})
		
		
		
	})
	
</script>
</head>
<body>
	<div>
		<h2>${item.theaterName }</h2>
	</div>
	<div>
		<h1>인원/좌석 선택</h1>
		<form>
			<label>성인</label>
			<select>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
			</select>
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
	

	<div class='btns'>
		<button id="set">재설정</button>
		<button id="add">좌석추가</button>
		<button id="del">좌석삭제</button>
		<button id="way">복도</button>
		<button id="wayNo">복도 삭제</button>
	</div>
	<form action="seat.do" method="post" name="f1">
		<p class="displayHidden">
			<label>상영관번호</label>
			<input type="text" name="number" value="${item.theaterNo}">
		</p> 
		
		<!-- <p>
		
			<label>실제 좌석 인원</label>
			<input type="text" name="count">
		</p> -->
		<p>
			<label>수용인원</label>
			<input type="text" name="maxcount" value="<%=num %>" readonly>
		</p>
		<p>
			<label>행</label>
			<input type="text" name="row" value="<%=row1 %>" readonly>
		</p>
		<p>
			<label>열</label>
			<input type="text" name="col" value="<%=col %>" readonly>
		</p>
		
			<input type="text" name="table" id="input1" class="displayHidden">
			
		<p>
			<input type="submit" value="저장">
		</p>
	</form>
	<br>
	
</body>
</html>