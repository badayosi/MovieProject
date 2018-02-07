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
  	}
  	#tableContent table {
		border-spacing:3px;
		text-align: center;
	}
	span{
		display: block;
		width: 20px;
  		height: 20px;
  		background: #848484;
  		color: white;
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
  	}
  	.tem{
  		background: #000000;
  		color: white;
  		font-weight: bold;
  	}
  	.way{
  		margin-right:30px; 
  	}
  	#input1{
  		display: none;
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
		//setTable();
		
		$("input[name='count']").val($(".seat").length);
		$("#set").click(function(){
			setTable();
		})
		
		$(document).on("click","span",function(){
			$(this).toggleClass("tem");
		})
		/* $("span").click(function(){
			$(this).toggleClass("tem");
		}) */
		$("#add").click(function(){
			$(".tem").addClass("seat");
			$(".tem").removeClass("noSeat");
			$(".tem").removeClass("tem");
			$("#input1").val($("#tableContent").html());
			$("input[name='maxcount']").val($(".seat").length);
		})
		
		$("#del").click(function(){
			$(".tem").addClass("noSeat");
			$(".tem").removeClass("seat");
			$(".tem").removeClass("tem");
			$("#input1").val($("#tableContent").html());
			$("input[name='maxcount']").val($(".seat").length);
		})
		$("#way").click(function(){
			$(".tem").addClass("way");			
			$(".tem").removeClass("tem");
			$("#input1").val($("#tableContent").html());
			$("input[name='maxcount']").val($(".seat").length);
		})
		$("#wayNo").click(function(){	
			$(".way").removeClass("way");
			$("#input1").val($("#tableContent").html());
		})
		
	})
	
	function setTable(){
		
		$("#tableContent").empty();
		var t = "<table class='seatTable'>";
		
		var col = <%=col%>;
		var num = <%=num%>;
		var row1 = "<%=row1 %>";
		
		
		var row = row1.charCodeAt(0)-64;
		
		//alert(row);
		
		var num1 = 1;
		
		for(var i=65; i<row+65; i++){
			t += "<tr>";
			for( k =1; k<=col; k++){
				var code = String.fromCharCode(i);
				if(num1<=num){
					t += "<td><span class='seat'>"+code+k+"</span></td>";
					num1++;
				}else{
					t += "<td><span class='noSeat'>"+code+k+"</span></td>";
					num1++;
				}
			}
			
			
			t += "</tr>";	
		}
		t += "</table>";
		
		$("#tableContent").html(t);
		//alert($("#tableContent").html());
		$("input[name='count']").val($(".seat").length);
		$("input[name='maxcount']").val($(".seat").length);
		
		$("#input1").val($("#tableContent").html());
	}
</script>
</head>
<body>
	전체 인원 : <%=num %><br>
	행 : <%=row1 %><br>
	열 : <%=col %><br>
	<br>
	<hr>
	<br>
	<div id="tableContent">
		<c:if test="${item.theaterTable!=null }">
			${item.theaterTable }
		</c:if>
	</div>



	<c:if test="${item.theaterTable==null }">
		<script type="text/javascript">
				setTable();
		</script>
	</c:if>  

		
	<button id="test">세팅</button>
	<button id="set">재설정</button>
	<button id="add">추가</button>
	<button id="del">삭제</button>
	<button id="way">복도</button>
	<button id="wayNo">복도 삭제</button>
	<form action="seat.do" method="post">
		<p>
			<label>상영관번호</label>
			<input type="text" name="number" value="${item.theaterNo }">
		</p>
		<p>
			<label>실제 좌석 인원</label>
			<input type="text" name="count">
		</p>
		<p>
			<label>수용인원</label>
			<input type="text" name="maxcount" value="<%=num %>">
		</p>
		<p>
			<label>행(알파벳으로 입력하세요)</label>
			<input type="text" name="row" value="<%=row1 %>">
		</p>
		<p>
			<label>열(숫자로 입력하세요)</label>
			<input type="text" name="col" value="<%=col %>">
		</p>
		<p>
			<input type="text" name="table" id="input1">
		</p>
		<p>
			<input type="submit" value="저장">
		</p>
	</form>
	<br>
	<hr>
	
</body>
</html>