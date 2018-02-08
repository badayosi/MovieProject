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
		float:left;
		margin-left: 100px;
	}
	label{
		width: 100px;
		float: left;
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
		//setTable();
		
		//저장버튼
		$("form[name='f1']").submit(function(){
			$("#input1").val($("#tableContent").html());
		})
		
		//좌석 선택 할때
		$(document).on("click","span",function(){
			$(this).toggleClass("tem");
		})
		
		//재설정
		$("#set").click(function(){
			setTable();
		})
		
		//좌석 추가
		$("#add").click(function(){
			$(".tem").addClass("seat");
			$(".tem").removeClass("noSeat");
			$(".tem").removeClass("tem");
			$("input[name='maxcount']").val($(".seat").length);
		})
		//좌석 삭제
		$("#del").click(function(){
			$(".tem").addClass("noSeat");
			$(".tem").removeClass("seat");
			$(".tem").removeClass("tem");
			$("input[name='maxcount']").val($(".seat").length);
		})
		//복도추가
		$("#way").click(function(){
			$(".tem").addClass("way");			
			$(".tem").removeClass("tem");
			$("input[name='maxcount']").val($(".seat").length);
		})
		//복도 삭제
		$("#wayNo").click(function(){	
			$(".way").removeClass("way");
		})
		
	})
	//기본 좌석 배치하기
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
		
	}
</script>
</head>
<body>
	<div>
		<h2>${item.theaterName }</h2>
	</div>
	
	<div id="tableContent">
		<c:if test="${item.theaterTable!=null }">
			${item.theaterTable }
		</c:if>
	</div>
	<c:if test="${item.theaterTable==null ||item.theaterTable==''}">
		<script type="text/javascript">
				setTable();
		</script>
	</c:if>  

	<div class='btns'>
		<button id="set">재설정</button>
		<button id="add">좌석추가</button>
		<button id="del">좌석삭제</button>
		<button id="way">복도</button>
		<button id="wayNo">복도 삭제</button>
	</div>
	<form action="managerSeat.do" method="post" name="f1">
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