<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="reservation_common.css">
<link rel="stylesheet" type="text/css" href="theater_progress.css?var=1">
<link rel="stylesheet" type="text/css" href="theater_seat.css">
<link rel="stylesheet" type="text/css" href="theater_menu.css?var=2">
<link rel="stylesheet" type="text/css" href="theater_quick.css?var=5">

<link rel="stylesheet" type="text/css" href="theater_list.css">
<!-- API JS -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script src="../js/jquery-animate-css-rotate-scale.js"></script>
<!-- CUSTOM JS -->
<script type="text/javascript" src="reservation_seat.js?var=1"></script>
<script type="text/javascript" src="reservation_approval.js?var=2"></script>
<script type="text/javascript" src="reservation_person_setting.js?var=1"></script>
<script type="text/javascript" src="reservation_seat_setting.js?var=1"></script>
<script type="text/javascript" src="reservation_quick_control.js?var=2"></script>
<style>
	@import url("/MovieProject/css/common.css");
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
		padding-top: 50px;	
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
	#quick-menu #nav_condition #select_info #img{
		background-size: 157px !important;
	}
	
	/* 시간표 css */
	#timeTableDiv{
		padding-left: 20px;
	}
	#timeTableDiv a{
		color: black;
		text-decoration: none;
		float: left;
		overflow: hidden;
	}
	#timeTable{
		display:inline-block;
		float:left;
		
		padding:0 !important;
		/* border: 2px solid #CDC197; */
		margin-right: 20px;
		margin-bottom: 20px;
	}
	#timeTable td{
		width:100px;
		text-align:center;
		border:none !important;
		padding:0 !important;
	}
	#timeTable tr{
		background: white;
		border: 1px solid grey;
		height:20px !important;
		padding:0 !important;
	}
	.t1, .t3{
		font-size: 12px;
	}
	.t2{
		font-size: 18px;
		height: 40px;
	}
	.reserveTable{
		background:rgba(0,0,0,0.2) !important;
	}
	
	/* 달력 */
	.a, .b, .c{
		font-size: 12px;
	}
	.a p, .b p, .c p{
		font-size: 16px;
		position: relative;
	}
	.a{
		color:red;
	}
	.b{
		color:blue;
	}
	.month1{
		font-size: 25px;
	}
	.newMonth{
		position: relative;
	}
	.month1{
		position:absolute;
		left: 25px;
		top: -55px;
		text-decoration: underline;
		font-weight: bold;
	}
	.year1{
		font-size: 12px;
		position:absolute;
		left: 50px;
		top: -45px;
	}
	
	/* 퀵뷰  */
	
</style>
<script type="text/javascript">
	function makeCalendar(){
		var todayDate = new Date();
		var t = new Date();
		var dateCount = 14;
		var weekStr = new Array("일","월","화","수","목","금","토","일");
		var weekStr1 = new Array("a","c","c","c","c","c","b","a");
		
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
						makeStr += "<td class='"+weekStr1[col%7]+"' class='week'>" + weekStr[col%7] + "</td>";
						break;
					case 1:
						if(todayDate.getDate() == day){			
							makeStr += "<td class='"+weekStr1[col%7]+" newMonth'>"+"<span class='month1'>"+ month+"</span>"+"<span class='year1'>"+year +"</span>"+"<p class='today'>" + t.getDate() + "</p></td>";
						}
						else{
							if(t.getDate() == 1){
								var month1 = t.getMonth()+1;
								var year1 = t.getFullYear();
								makeStr += "<td class='"+weekStr1[col%7]+" newMonth'>"+"<span class='month1'>"+ month1+"</span>"+"<span class='year1'>"+year1 +"</span>"+"<p>" + t.getDate() + "</p></td>";
							}else{
								makeStr += "<td class='"+weekStr1[col%7]+"'><p>" + t.getDate() + "</p></td>";	
							}							
						}
						day++;
						t.setDate(t.getDate()+1);
						break;
				}
			}
			makeStr += "</tr>";
		}
		makeStr += "</table>";		
		$("#calendar_day").html(makeStr); 
	}
	
	function loadAllMovie(){
		$.ajax({
			url:"reservationAjax.do",
			type:"get",
			dataType:"json",
			success:function(json){
				var date=new Date();
				var nowDate=date.getTime();
				
				var makeMovieList;
				var length = json.length;
				
				for(var index=0;index<length;index++){
					if(json[index].closeDate<nowDate || json[index].openDate>nowDate){
						continue;
					}else{
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
			}
		});
	}
	
	function selectMovie(no){
		// USER 정보가 없으면 로그인페이지로 리턴
		if(!checkSession()){
			alert("USER 정보를 확인할 수 없습니다.\n로그인 후 이용해주세요.");
			location.replace("/MovieProject/login/Login.jsp");
			return;
		}
		
		$.ajax({
			url:"reservationAjax.do?no=" + no,
			type:"get",
			dataType:"json",
			success:function(json){
				
				console.log(json);
				
				// 선택영화 상영시간표 정보 LOAD
				$("#theaterList").html("");
				var makeTheaterList;
				makeTheaterList = "";
				makeTheaterList += "<div id='timeTableDiv'>";
				
				for(var index=0 ; index<json.time.length ; index++){
					makeTheaterList += "<a href='javascript:loadSeat(" + json.time[index].timeNo +","+ json.time[index].startTime +")'>";
					makeTheaterList += "<input type='hidden' name='table_key' value='" + json.time[index].timeNo + "'>";
					makeTheaterList += "<table id='timeTable'>";
					makeTheaterList += "<tr>";
					makeTheaterList += "<tr><td class='t1'>" + json.time[index].theaterName+ " ("+json.time[index].theaterType  + ")</td></tr>";
					makeTheaterList += "<tr><td class='t2'>" + formatChange(json.time[index].startTime, "time") + "</td></tr>";
					makeTheaterList += "<tr><td class='t3'>" + json.time[index].restSeat + " / " + json.time[index].maxSeat + "</td></tr>";
					makeTheaterList += "</tr>";
					makeTheaterList += "</table>";
					makeTheaterList += "</a>";
				}
				makeTheaterList += "</div>";
				$("#theaterList").append(makeTheaterList);
				
				for(var i=0 ; i<json.reserve.length ; i++){
					$("#timeTableDiv input[name='table_key']").each(function(index,obj){
						console.log(Number(json.reserve[i].timetableNo));
						console.log(Number($(this).val()));
						console.log(Number(json.reserve[i].timetableNo) == Number($(this).val()));
						console.log($(this).parent().find(".t1").html());
						if(Number(json.reserve[i].timetableNo) == Number($(this).val())){
							$(this).parent().find(".t1").parent().addClass("reserveTable");
							$(this).parent().find(".t2").parent().addClass("reserveTable");
							$(this).parent().find(".t3").parent().addClass("reserveTable");
						}
					});  
				}
				
				// 영화 선택시  QUICK 반영
				// 경고문구 제거
				$("#warning_noMovie").css("display","none");
				// 임시코드_ QUICK POSTER 변경
				$("#select_info").find("#img").css("background","url('/MovieProject/upload/"+json.movie.movieNo+"/"+json.movie.pathPoster+"') no-repeat center");
				
				
				
				// QUICK TITLE 변경
				$("#nav_title").html(json.movie.movieName);
			}
		});
	}
	
	function loadSeat(timeNo, startTime){
		// 비동기호출_상영관로드 후 좌석생성
		$.ajax({
			url:"reservationAjax.do?timeNo=" + timeNo,
			type:"get",
			dataType:"json",
			success:function(json){
				
				console.log(json);
				$("#draw_seat").html("");
				$("#draw_seat").append("<div id='theater_screen'>SCREEN</div>");
				$("#draw_seat").append(json.theaterTable);
				
				// 시간 선택시  QUICK 반영
				// QUICK THEATER 변경
				$("#select_info table").find(".nav_data").eq(2).html(json.theaterName + "(" + json.theaterFloor + "층)");
				loadReserve(timeNo);
			}
		});
		
		// 시간 선택시  QUICK 반영
		// QUICK DATE 변경 + Hidden Type TimeTable 번호보유
		$("#select_info table").find(".nav_data").eq(0).html(formatChange(startTime, "date") + "<input type='hidden' id='timeNo'name='timeNo' value='" + timeNo + "'>");
		// QUICK TIME 변경
		$("#select_info table").find(".nav_data").eq(1).html(formatChange(startTime, "time"));
		// QUICK CONTROL BUTTON 변경
		$("#nav_cancle").css("display","block");
		$("#nav_ok").css("display","block");
	}
	
	function loadReserve(timeNo){
		// 비동기호출_예약좌석 반영
		$.ajax({
			url:"reservationAjax.do?timeNo=" + timeNo + "&search=true",
			type:"get",
			dataType:"json",
			success:function(json){
				console.log(json);
				if(json.resultSeat != null){
					// 예약석 배열화
					var arrResult = new Array();
					var targetIdx = 0;
					var temp = json.resultSeat.split("/");
					for(var i=0 ; i<temp.length ; i++){
						arrResult[targetIdx] = temp[i];
						targetIdx++;
					}
					
					// 예약석 CSS 적용
					$(".seatTable").find("span").each(function(index, obj){
						for(var idx=0 ; idx<arrResult.length ; idx++){
							if(arrResult[idx] == $(this).html()){
								$(this).removeClass("seat");
								$(this).addClass("reserveSeat");
							}
						}
					});
					
					// USER 선택좌석이 존재할 경우 SELECT SEAT 적용
					if(json.targetSeat != null){
						var tempSeat = json.targetSeat.split("/");
						$(".seatTable").find(".reserveSeat").each(function(index, obj){
							for(var idx=0 ; idx<tempSeat.length ; idx++){
								if($(this).html() == tempSeat[idx]){
									$(this).removeClass("reserveSeat");
									$(this).addClass("selectSeat");
								}
							}
						});
						$("#nav_data_seat").html(json.targetSeat);
						$("#total_person").html(tempSeat.length);
						$("#person_setting select").first().find("option").eq(tempSeat.length).attr("selected",true);
						applyPayment();
					}
				}
			}
		});
		$("#theater_progess").css("display","block");
	}
	
	function formatChange(date, type){
		var newDate = new Date(date);
		
		if(type=="time")
			return newDate.getHours() + ":" + newDate.getMinutes();
		if(type=="date"){
			var dateStr = "";
			
			dateStr += newDate.getFullYear();
			dateStr += "-";
			if((newDate.getMonth()+1) < 10)
				dateStr += "0"+(newDate.getMonth()+1);
			else
				dateStr += (newDate.getMonth()+1);
			dateStr += "-";
			if(newDate.getDate() < 10)
				dateStr += "0"+newDate.getDate();
			else
				dateStr += newDate.getDate();			
			
			return dateStr;
		}
		return "Type Miss Error";
	}
	
	// 유저세션 확인
	function checkSession(){
		<%
			boolean checker;
			if(session.getAttribute("member") != null)
				checker = true;
			else
				checker = false;
		%>
		return <%=checker%>;
	}

	$(function(){
		makeCalendar();
		loadAllMovie();		
		
		$("#integer td").on("click",function(){
			$("#integer td p").removeClass("today");
			$(this).find("p").toggleClass("today");
		});
		
		// 상영관예약_PREV버튼 클릭 시
		$("#progress_prev").on("click",function(){
			$("#theater_progess").css("display","none");
			cancleProgress();
		})
		
		// 상영관예약_NEXT버튼 클릭 시
		$("#progress_next").on("click",function(){
			checkSeat();
		})
		
		// 상영관예약_좌석클릭 시
		$(document).on("click",".seat",function(){
			selectSeat($(this));
		})
		// 상영관예약_예약좌석클릭 시
		$(document).on("click",".selectSeat",function(){
			selectSeat($(this));
		})
		// 상영관예약_인원타입설정 시
		$(document).on("change","#person_setting select",function(){
			changePersonSetting();
		})
		// 상영관예약_초기화버튼 클릭 시
		$(document).on("click","#select_clear",function(){
			seatAllClear();
			initPerson();
			if(checkPositionByQuick() == "open")
				closeQuick();
			applyPayment();
			initQuickSeat();
		});
		// 상영관예약_좌석배치설정 시
		$(document).on("click","#seat_setting input",function(){
			seatRestore();
			settingChoice($("#seat_setting input:checked").val());
		})
		// 상영관예약_마우스오버
		$(document).on("mouseover",".seat",function(){
			if(!$(this).hasClass("selectSeat")
					&& !$(this).hasClass("reserveSeat")
					&& $(".selectSeat").length < 9)
				$(this).toggleClass("overSeat");
			if(!$(this).hasClass("overSeat"))
				$(this).toggleClass("overSeat");
		});
		// 상영관예약_마우스아웃
		$(document).on("mouseout",".seat",function(){
			if(!$(this).hasClass("selectSeat")
					&& !$(this).hasClass("reserveSeat")
					&& $(".selectSeat").length < 9)
				$(this).toggleClass("overSeat");
			if($(this).hasClass("overSeat"))
				$(this).toggleClass("overSeat");
		});
		// 퀵메뉴_컨트롤
		$("#open_btn").on("click",function(){
			if(checkPositionByQuick() == "close")
				openQuick();
			if(checkPositionByQuick() == "open")
				closeQuick();
		})
		// 퀵메뉴_PREV버튼 클릭 시
		$("#nav_cancle").on("click",function(){
			$("#nav_cancle").css("display","none");
			$("#theater_progess").css("display","none");
			$("#open_btn").rotate("0deg");
			$("#quick-menu").animate({"right":"-500px"},300);
			cancleProgress();
		});
		// 퀵메뉴_NEXT버튼 클릭 시
		$("#nav_ok").on("click",function(){
			checkSeat();
		});
		
		//시간표 마우스 오버
		$(document).on("mouseover","#timeTable",function(){
			$(this).children().children().css("background","black");
			$(this).children().children().css("color","white");
			$(this).children().children().css("font-weight","bold");
		})
		
		$(document).on("mouseout","#timeTable",function(){
			$(this).children().children().css("background","white");
			$(this).children().children().css("color","black");
			$(this).children().children().css("font-weight","normal");
		})
		
	});
</script>

</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="container">
		<div id="horizontal_calendar">
			<!-- <p><span id="month">2</span><span id="year">2018</span></p> -->
			
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
					<td rowspan="2" id="theaterList" valign="top">
					
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
						<label>성인</label>
						<select>
							<option>0</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
						</select>
						<label>청소년</label>
						<select>
							<option>0</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
						</select>
						<label>시니어</label>
						<select>
							<option>0</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
						</select>
						<label>장애인</label>
						<select>
							<option>0</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
						</select>
						<label id="label_total_person">현재 선택좌석</label>
						<p id="total_person">0</p>
						<button id="select_clear">선택 초기화</button>
					</div>
					<div id="seat_setting">
						<label>좌석 배치설정</label>
						<input type="radio" name="seat_set" checked="checked" value="1" disabled="disabled">
						<label>■</label>
						<input type="radio" name="seat_set" value="2" disabled="disabled">
						<label>■■</label>
						<input type="radio" name="seat_set" value="3" disabled="disabled">
						<label>■■■</label>
						<input type="radio" name="seat_set" value="4" disabled="disabled">
						<label>■■■■</label>
					</div>
					<div id="warning_info">
						<p>최대 8자리까지 선택가능합니다. / 인원세부설정을 하지않을 경우 성인요금으로 자동계산됩니다.</p>
						<p>만 15세 미만의 고객님(영,유아 포함)은 반드시 부모님 또는 성인 보호자의 동반하에 관람이 가능합니다.</p>
					</div>
					<div id="draw_seat">
						
					</div>
				</div>
			</div>
			<div id="progress_next"><p>NEXT</p></div>
		</div>
		<!-- 퀵뷰 -->
		<div id="quick-menu">
			<img src="../images/nav_condition_open.png" id="open_btn">
			<div id="nav_condition">
				<div id="select_info">
					<div id="img">
						<p id="warning_noMovie">
							선택하신 영화가 없습니다.<br>
							영화를 선택해주세요.
						</p>
					</div>
					<table>
						<tr>
							<td id="nav_title" colspan="2">영화를 선택하세요</td>
						</tr>
						<tr>
							<td class="nav_info">상영일</td>
							<td class="nav_data" id="nav_date">상영날짜</td>
						</tr>
						<tr>
							<td class="nav_info">상영시간</td>
							<td class="nav_data" id="nav_time">상영시간</td>
						</tr>
						<tr>
							<td class="nav_info">상영관</td>
							<td class="nav_data" id="nav_theater">상영관(층)</td>
						</tr>
						<tr>
							<td class="nav_info">선택좌석</td>
							<td id="nav_data_seat" class="nav_data">선택좌석</td>
						</tr>
					</table>
				</div>
				<table id="nav_seat">
					<tr>
						<td class="nav_info">성인</td>
						<td class="nav_count">0</td>
						<td class="nav_data">0</td>
					</tr>
					<tr>
						<td class="nav_info">청소년</td>
						<td class="nav_count">0</td>
						<td class="nav_data">0</td>
					</tr>
					<tr>
						<td class="nav_info">시니어/장애인</td>
						<td class="nav_count">0</td>
						<td class="nav_data">0</td>
					</tr>
					<tr id="total_payment">
						<td class="nav_info">총 결제금액</td>
						<td class="nav_data" id="money" colspan="2">0</td>
					</tr>
				</table>
				<div id="nav_control">
					<div id="nav_cancle">PREV</div>
					<div id="nav_ok">NEXT</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>