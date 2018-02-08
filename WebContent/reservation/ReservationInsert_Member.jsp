<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	div#container{
		width:1024px;
		min-height:600px;
		margin:0 auto;
		background:#F9F6EC;
	}
	
	/* 가로형 달력 CSS */
	div#horizontal_calendar{
		width:100%;
	}
	div#horizontal_calendar > p{
		padding:0;
	}
	div#horizontal_calendar #month{
		font-size:2.5em;
		font-weight:bold;
		margin-left:100px;
	}
	div#horizontal_calendar #year{
		margin-left:15px;
	}
	div#calendar_day{
		width:90%;
		margin:0 auto;
	}
	div#calendar_day > table{
		width:100%;
	}
	div#calendar_day td{
		text-align:center;
		width:7%;
	}
	div#calendar_day tr#integer td{
		font-size:20px;
		height:40px;
	}
	div#calendar_day tr#integer td p{
		height:30px;
		line-height:30px;
		text-align:center;
		padding:0;
		margin:0 auto;
	}	
	.today{
		width:30px;
		height:30px;
		line-height:30px;
		margin:0 auto;
		padding:0px;
		border:1px solid black;
		border-radius:20px;
		color:white;
		background:black;
	}
	
	/* 예약 */
	div#reservation_box{
		border-top:5px solid black;
		border-bottom:5px solid black;
		margin-top:20px;
		width:100%;
	}
	div#reservation_box span.title{
		font-size:1.5em;
		font-weight:bold;
	}
	div#reservation_box span.guide{
		font-size:1em;
		float:right;
	}
	div#reservation_box table, div#reservation_box tr, div#reservation_box td{
		border-collapse:collapse;
	}
	div#reservation_box tr{
		height:80px;
	}
	div#reservation_box tr:FIRST-CHILD td{
		border-bottom:1px solid black;
	}
	div#reservation_box tr:NTH-CHILD(2) td{
		border-bottom:1px solid black;
	}
	div#reservation_box td{
		padding:10px;
	}
	div#reservation_box td:FIRST-CHILD{
		border-right:1px solid black;
	}
	td.td_movie{
		width:350px;
		line-height:40px;
	}
	td.td_theater{
		width:674px;
		line-height:40px;
	}
	ul#rangeList{
		width:100%;
		list-style:none;
		margin:0;
		padding-left:10px;
	}
	ul#rangeList > li{
		float:left;
		padding-left:5px;
		padding-right:5px;
		margin-left:10px;
	}
	td#movieList{
		height:500px;
	}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function makeCalendar(){
		var todayDate = new Date();
		var dateCount = 14;
		var weekStr = new Array("일","월","화","수","목","금","토","일");
		
		var year = todayDate.getFullYear();
		var month = todayDate.getMonth()+1;
		var day = todayDate.getDate();
		var weekday = todayDate.getDay();
		
		var makeStr = "";
		makeStr += "<table>";
		for(var row=0 ; row<2 ; row++){
			if(row == 0)
				makeStr += "<tr id='string'>";
			else if(row == 1)
				makeStr += "<tr id='integer'>";		
			for(var col=weekday ; col<dateCount+weekday ; col++){
				switch(row){
					case 0:
						makeStr += "<td>" + weekStr[col%7] + "</td>";
						break;
					case 1:
						if(todayDate.getDate() == day)
							makeStr += "<td><p class='today'>" + day + "</p></td>";
						else
							makeStr += "<td><p>" + day + "</p></td>";
						day++;
						break;
				}
			}
			makeStr += "</tr>";
		}
		makeStr += "</table>";
		$("#year").html(year);
		$("#month").html(month);
		$("#calendar_day").html(makeStr);
	}

	$(function(){
		makeCalendar();
		
		$("#integer td").on("click",function(){
			$("#integer td p").removeClass("today");
			$(this).find("p").toggleClass("today");
		});
		
	});
</script>

</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="container">
		<div id="horizontal_calendar">
			<p><span id="month">2</span><span id="year">2018</span></p>
			<div id="calendar_day">
				
			</div>
		</div>
		<div id="reservation_box">
			<table>
				<tr>
					<td class="td_movie"><span class="title">영화</span><span class="guide">최대 3편까지 선택가능</span></td>
					<td class="td_theater"><span class="title">상영시간</span><span class="guide">예고편 상영 등으로 시작이 10여분정도 차이날 수 있습니다.</span></td>
				</tr>
				<tr>
					<td>
						<ul id="rangeList">
							<li>예매순</li>
							<li>평점순</li>
							<li>가나다순</li>
						</ul>
					</td>
					<td rowspan="2" class="td_theater">상영관리스트</td>
				</tr>
				<tr>
					<td id="movieList">
						<c:if test="${true}">
							<ul id="rangeList">
								<li></li>
							</ul>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>