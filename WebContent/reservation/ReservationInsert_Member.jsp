<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="reservation_common.css">
<link rel="stylesheet" type="text/css" href="theater_progress.css">
<link rel="stylesheet" type="text/css" href="theater_seat.css?var=4">
<link rel="stylesheet" type="text/css" href="theater_menu.css">
<link rel="stylesheet" type="text/css" href="theater_quick.css">
<link rel="stylesheet" type="text/css" href="theater_list.css">
<!-- API JS -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script src="../js/jquery-animate-css-rotate-scale.js"></script>
<!-- CUSTOM JS -->
<script type="text/javascript" src="reservation_seat.js?var=5"></script>
<style>
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
	div#reservation_box tr:NTH-CHILD(2) td:FIRST-CHILD{
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
		padding:0;
	}
	ul#movieZone{
		width:95%;
		height:100%;
		margin:0 auto;
		list-style:none;
		padding:0;
	}
	ul#movieZone li{
		width:100%;
		height:30px;
		margin-bottom:10px;
	}
	ul#movieZone li a{
		display:block;
		width:100%;
		height:30px;
		padding:0;
		margin:0;
		line-height:30px;
	}
	ul#movieZone li a div{
		float:left;
	}
	ul#movieZone .rating{
		width:30px;
		height:30px;
	}
	ul#movieZone .age12{
		background-repeat:no-repeat;
		background-image:url("../images/rating_12.png");
		background-position:center center;
	}
	ul#movieZone .age15{
		background-repeat:no-repeat;
		background-image:url("../images/rating_15.png");
		background-position:center center;
	}
	ul#movieZone .age18{
		background-repeat:no-repeat;
		background-image:url("../images/rating_18.png");
		background-position:center center;
	}
	ul#movieZone .ageall{
		background-repeat:no-repeat;
		background-image:url("../images/rating_all.png");
		background-position:center center;
	}
	ul#movieZone .movieName{
		color:black;
	}
	ul#movieZone .selectMovie{
		font-weight: bold;
	}
</style>
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
	
	function loadAllMovie(){
		$.ajax({
			url:"reservationAjax.do",
			type:"get",
			dataType:"json",
			success:function(json){
				
				console.log(json);
				var makeMovieList;
				for(var index=0;index<json.length;index++){
					makeMovieList = "";
					makeMovieList += "<li>";
					makeMovieList += "<a href='javascript:selectMovie(" + json[index].movieNo +")'>";
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
		});
	}
	
	function selectMovie(no){
		$.ajax({
			url:"reservationAjax.do?no=" + no,
			type:"get",
			dataType:"json",
			success:function(json){
				
				console.log(json);
				$("#theaterList").html("");
				var makeTheaterList;
				for(var index=0;index<json.length;index++){
					makeTheaterList = "";
					makeTheaterList += "<div>";
					makeTheaterList += "<a href='javascript:loadSeat(" + json[index].timeNo +")'>";
					makeTheaterList += "<table>";
					makeTheaterList += "<tr>";
					makeTheaterList += "<td>" + formatChange(json[index].startTime) + "</td>";
					makeTheaterList += "<td>" + json[index].theaterName + "</td>";
					makeTheaterList += "<td>(" + json[index].theaterType + ")</td>";
					makeTheaterList += "<td>" + json[index].restSeat + " / " + json[index].maxSeat + "</td>";
					makeTheaterList += "</tr>";
					makeTheaterList += "</table>";
					makeTheaterList += "</a>";
					makeTheaterList += "</div>";
					$("#theaterList").append(makeTheaterList); 
				}
			}
		});
	}
	
	function loadSeat(timeNo){
		$.ajax({
			url:"reservationAjax.do?timeNo=" + timeNo,
			type:"get",
			dataType:"json",
			success:function(json){
				
				console.log(json);
				$("#draw_seat").html("");
				$("#draw_seat").append("<div id='theater_screen'>SCREEN</div>");
				$("#draw_seat").append(json.theaterTable);
			}
		});
		
		$.ajax({
			url:"reservationAjax.do?timeNo=" + timeNo + "&search=true",
			type:"get",
			dataType:"json",
			success:function(json){
				$(".seatTable").find("span").each(function(index, obj){
					for(var idx=0 ; idx<json.length ; idx++){
						if(json[idx] == $(this).html()){
							$(this).removeClass("seat");
							$(this).addClass("reserveSeat");
						}
					}
				});
			}
		});
		$("#theater_progess").css("display","block");
	}
	
	function formatChange(date){
		var newDate = new Date(date);
		
		return newDate.getHours() + ":" + newDate.getMinutes();
	}

	$(function(){
		makeCalendar();
		loadAllMovie();
		
		$("#integer td").on("click",function(){
			$("#integer td p").removeClass("today");
			$(this).find("p").toggleClass("today");
		});
		
		$("#progress_prev").on("click",function(){
			$("#theater_progess").css("display","none");
		})
		
		$("#progress_next").on("click",function(){
			alert("결제완료 관련 작업 예정");
		})
		
		// 상영관예약_좌석클릭 시
		$(document).on("click",".seat",function(){
			selectSeat($(this));
		})
		// 상영관예약_예약좌석클릭 시
		$(document).on("click",".selectSeat",function(){
			selectSeat($(this));
		})
		// 상영관예약_인원클릭 시
		$(document).on("change","#person_setting select",function(){
			settingChange();
		})
		// 상영관예약_좌석배치설정 시
		$(document).on("click","#seat_setting input",function(){
			settingChoice($(this).val());
		})
		// 상영관예약_마우스오버
		$(document).on("mouseover",".seat",function(){
			if(!$(this).hasClass("selectSeat")
					&& !$(this).hasClass("reserveSeat")
					&& $("#person_setting").find("select").val()-setCount()!=0)
				$(this).toggleClass("overSeat");
		});
		// 상영관예약_마우스아웃
		$(document).on("mouseout",".seat",function(){
			if(!$(this).hasClass("selectSeat")
					&& !$(this).hasClass("reserveSeat")
					&& $("#person_setting").find("select").val()-setCount()!=0)
				$(this).toggleClass("overSeat");
		});
		
		//퀵메뉴
		$("#open_btn").on("click",function(){
			if($("#quick-menu").css("right") == "-500px"){
				$("#open_btn").rotate("180deg");
				$("#quick-menu").animate({"right":"0px"},300);
				qi=1;
			}else{
				$("#open_btn").rotate("0deg");
				$("#quick-menu").animate({"right":"-500px"},300);
				qi=0;
			}
		})
		
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
					<td rowspan="2" id="theaterList">
					
					</td>
				</tr>
				<tr>
					<td id="movieList">
						<c:if test="${true}">
							<ul id="movieZone">
								
							</ul>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		<div id="theater_progess">
			<div id="progress_prev"><p>PREV</p></div>
			<div id="theater_seat">
				<div id="theater_menu">
					<div id="person_setting">
						<label>총 인원</label>
						<select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
						</select>
						<label>성인</label>
						<input type="number" value="0">
						<label>청소년</label>
						<input type="number" value="0">
						<label>시니어</label>
						<input type="number" value="0">
						<label>장애인</label>
						<input type="number" value="0">
					</div>
					<div id="seat_setting">
						<label>좌석 배치설정</label>
						<input type="radio" name="seat_set" checked="checked" value="1">
						<label>■</label>
						<input type="radio" name="seat_set" value="2" disabled="">
						<label>■■</label>
						<input type="radio" name="seat_set" value="3" disabled="disabled">
						<label>■■■</label>
						<input type="radio" name="seat_set" value="4" disabled="disabled">
						<label>■■■■</label>
					</div>
					<div id="waring_info">
						<p>만 15세 미만의 고객님(영,유아 포함)은 반드시 부모님 또는 성인 보호자의 동반하에 관람이 가능합니다.</p>
					</div>
					<div id="draw_seat">
						
					</div>
				</div>
			</div>
			<div id="progress_next"><p>NEXT</p></div>
		</div>
		<div id="quick-menu">
			<img src="../images/nav_condition_open.png" id="open_btn">
			<div id="nav_condition">
				<div id="select_info">
					<div id="img"></div>
					<table>
						<tr>
							<td id="nav_title" colspan="2">봉이 김선달</td>
						</tr>
						<tr>
							<td class="nav_info">상영일</td>
							<td class="nav_data" id="nav_date">2018-01-01</td>
						</tr>
						<tr>
							<td class="nav_info">상영시간</td>
							<td class="nav_data" id="nav_time">14:00</td>
						</tr>
						<tr>
							<td class="nav_info">상영관</td>
							<td class="nav_data" id="nav_theater">1관(2D)</td>
						</tr>
						<tr>
							<td class="nav_info">선택좌석</td>
							<td class="nav_data"></td>
						</tr>
					</table>
				</div>
				<table id="nav_seat">
					<tr>
						<td class="nav_info">성인</td>
						<td class="nav_info">1명</td>
						<td class="nav_data">9,000</td>
					</tr>
					<tr>
						<td class="nav_info">청소년</td>
						<td class="nav_info">1명</td>
						<td class="nav_data">8,000</td>
					</tr>
					<tr>
						<td class="nav_info">시니어/장애인</td>
						<td class="nav_info">1명</td>
						<td class="nav_data">5,000</td>
					</tr>
					<tr id="total_payment">
						<td class="nav_info">총 결제금액</td>
						<td class="nav_data" colspan="2">22,000</td>
					</tr>
				</table>
				<div id="nav_control">
					<div id="nav_ok">NEXT</div>
					<div id="nav_cancle">CANCEL</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>