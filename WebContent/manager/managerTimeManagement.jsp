<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">	
	@import url("/MovieProject/css/common.css");
	#container{
		width:1024px;
		margin:0 auto;
		text-align: center; 
		overflow: hidden;
	}
	#container #theater_schedule{
		width:800px;
		margin:0 auto;
		text-align:center;
	}
	/* 상영관 관리 */
	#leftContent{
		border:1px solid grey;
		float: left;
		width: 500px;
		min-height: 500px;
	}
	#leftContent h2, #rightContent h2{
		margin-top: 20px;
	}
	#theater_list{
		margin-top: 20px;
		margin-bottom: 20px;
	}
	#theater_schedule table tr th:FIRST-CHILD{
		width: 70px;
	}
	
	#leftContent select{
		width: 200px;
		padding: .2em .3em;
		border: 1px solid #999;
 		border-radius: 0px;
	}
	#leftContent a input[type='submit']{
		background: grey;
		padding: 10px;
	}
	#leftContent table{
		width: 400px;
		margin-left:50px;
		margin-bottom: 50px;
	}
	#leftContent table,#leftContent th{
		border-top:1px solid #CDC197;
		border-bottom:1px solid #CDC197;
		border-collapse: collapse;
	}
	#leftContent table tr{
		border-bottom:1px solid #CDC197;
		border-collapse: collapse;
		text-align: center;
	}
	#leftContent th, #leftContent td{
		text-align: center;
		padding: 10px;
	}
	.start_date td{
		background: #EFEBDB;
		
	}
	/* 상영관 추가 */
	#rightContent{
		border:1px solid grey;
		float: right;		
		width: 500px;
		min-height: 500px;
	}
	#movieListByDate{
		list-style: none;
	}
	#addInfo table{
		border-collapse: collapse;
		width:470px;
		margin:0 auto;
	}
	#addInfo table tr td{
		border:1px solid black;
		width:200px;
		height:400px;
		text-align: left;
		padding-left:10px;
	}
	#addInfo table tr td:first-child{
		width:150px;
	}
	#addInfo table tr td:last-child{
		/* padding-left:10px; */
	}
	
	#btn{
		margin:10px 0px;
		
		font-size: 15px;
		background: #CDC197;
		padding: 5px 10px;
		font-weight: bold;
		color: white;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	// 전체 상영관 리스트 로드
	function loadTheater(){
		$.ajax({
			url:"managerAjax.do?type=load&target=theater&scope=all",
			type:"get",
			dataType:"json",
			success:function(json){
				console.log(json);
				
				makeTag = "";
				makeTag += "<option>상영관을 선택하세요</option>";
				for(var i=0 ; i<json.length ; i++){
					makeTag += "<option value='" + json[i].theaterNo + "'>" + json[i].theaterName + "</option>";
				}
				$("#theater_list").append(makeTag);
				$("#theater_add_list").append(makeTag);
			}
		});
	}
	
	// 선택 상영관의 목록 로드
	function loadTheaterById(theaterno){
		$.ajax({
			url:"managerAjax.do?type=load&target=timetable&scope=theaterno&theaterno=" + theaterno,
			type:"get",
			dataType:"json",
			success:function(json){
				console.log(json);
				
				var standardDate = new Date();
				
				// 날짜 배열화
				var arrDate = new Array();
				for(var i=0 ; i<json.timeTable.length ; i++){
					// 최초 실행 시 날짜 저장					
					if(i==0)
						arrDate[i] = formatChange(json.timeTable[i].startTime, "date");
					// 아닐경우 ARRDATE의 길이에 따라 비교
					else{
						// CHECKER 초기화
						var checker = 0;
						// JSON 날짜관련 임시변수 활성화
						var tempDate = formatChange(json.timeTable[i].startTime, "date");
						for(var j=0 ; j<arrDate.length ; j++){
							// 동일한 날짜가 있는지 검색
							if(arrDate[j] == tempDate){
								// 동일한 날짜가 있을경우 CHECKER 증가
								checker++;
							}
						}
						// 동일한 날짜가 존재하지 않을 경우 날짜 추가
						if(checker == 0){
							arrDate[arrDate.length] = formatChange(json.timeTable[i].startTime, "date");
						}
					}
				}
				
				// 테이블 생성
				makeTag = "";
				makeTag += "<table>";
				for(var i=0 ; i<arrDate.length ; i++){
					// 날짜용 ROW 생성
					makeTag += "<tr class='start_date'>";
					makeTag += "<td colspan=3>";
					makeTag += arrDate[i];
					makeTag += "</td>";
					makeTag += "</tr>";
					// 제목용 ROW 생성
					makeTag += "<tr>";
					makeTag += "<th>";
					makeTag += "상영시간<br>(시작-종료)";
					makeTag += "</th>";
					makeTag += "<th>";
					makeTag += "영화명";
					makeTag += "</th>";
					makeTag += "<th>";
					makeTag += "기타";
					makeTag += "</th>";
					makeTag += "</tr>";
					// 데이터용 ROW 생성
					for(var j=0 ; j<json.timeTable.length ; j++){
						if(arrDate[i] == formatChange(json.timeTable[j].startTime, "date")){
							makeTag += "<tr class='data_row'>";
							makeTag += "<td>";
							makeTag += formatChange(json.timeTable[j].startTime, "time") + "~" + formatChange(json.timeTable[j].endTime, "time");
							makeTag += "</td>";
							makeTag += "<td>";
							makeTag += json.movie[j].movieName; 
							makeTag += "</td>";
							makeTag += "<td>";
							makeTag += "<a href='javascript:deleteTimeByNo(" + json.timeTable[j].tableNo + ")' class='time_no' value='" + json.timeTable[j].tableNo + "'>삭제</a>";
							makeTag += "</td>";
							makeTag += "</tr>";
						}
					}
				}
				makeTag += "</table>";
				
				// 테이블 적용
				$("#theater_schedule").append(makeTag);
			}
		});
	}
	
	function deleteTimeByNo(tableNo){
		$.ajax({
			url:"managerAjax.do?type=delete&target=timetable&scope=no&timetableno=" + tableNo,
			type:"get",
			dataType:"json",
			success:function(json){
				console.log(json);
				if(json.success != null){
					$(".time_no").each(function(index,obj){
						if($(this).attr("value") == tableNo)
							$(this).parent().parent().remove();
					});
					alert(json.success);
				}
				else
					alert(json.error);
			}
		});
	}

	
	function formatChange(date, type){
		var newDate = new Date(date);
		
		if(type=="time"){
			var hourStr = "";
			var minStr="";
			
			if(newDate.getHours() < 10)
				hourStr = "0" + newDate.getHours();
			else
				hourStr = newDate.getHours();
			if(newDate.getMinutes() < 10)
				minStr = "0" + newDate.getMinutes();
			else
				minStr = newDate.getMinutes();
			
			return hourStr + ":" + minStr;
		}
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
	
	function selectMovieByDate(choicedate){
		$.ajax({
			url:"/MovieProject/user/listMovie.do",
			type:"get",
			dataType:"json",
			success:function(json){ 
				var date=new Date(choicedate);
				var selDate=date.getTime();
				var str="";
				//console.log(json);
				$(json).each(function(i,obj){
					if(obj.openDate<=selDate && obj.closeDate>=selDate){
						str+="<li><input class='mNo' type='hidden' value='"+obj.movieNo+"'><input type='radio' name='movie' value='"+obj.movieName+"'><b>"+obj.movieName+" </b>(<span class='mPlaytime'>"+obj.playTime+"</span>분)</li>"; 
					}
				})
				$("#movieListByDate").append(str);
			}
		}) 
	}
	
	function addScheduleProcess(theaterNo,date,wantDate,movieNo,endTime){
		$.ajax({
			url:"/MovieProject/manager/managerListTimetableByDate.do",
			type:"get",
			data:{"theaterNo":theaterNo,"date":date},
			dataType:"json",
			success:function(json){ 	 
				console.log(json);
				var num=0;
				
				$(json).each(function(i,obj){
					if((obj.startTime <= wantDate) && (wantDate<=obj.endTime)){
						num++;
					}
				});
				
				if(num > 0){
					alert("중복되는 시간이 있습니다.");
					//return false;
				}else{
					$.ajax({
						url:"/MovieProject/manager/managerAddTimetable.do",
						type:"get",
						data:{"movieNo":movieNo,"theaterNo":theaterNo,"startTime":wantDate,"endTime":endTime},
						dataType:"json",
						success:function(json){ 
							console.log("insert complete");
							alert("insert complete");
						},error:function(){
							alert("시간표 추가를 성공하였습니다.");
						}
					}) 
					
				}
			}
		}) 
	} 
	
	$(function(){
		loadTheater();
		
		// 상영관 관리에서 선택
		$("#theater_list").on("change",function(){
			$("#theater_schedule").empty();
			loadTheaterById($("#theater_list").val());
		});
		
		//상영관 추가에서 날짜 선택
		$("#selectDate").on("change",function(){
			$("#movieListByDate").empty();
			var selDate=$("#selectDate").val();
			selectMovieByDate(selDate);
			
		});
		
		var mno="";
		
		$(document).on("click","input[name='movie']",function(){ 			
			var selectDate=$("#selectDate").val();
			var startTime=$("#startTime").val();
			var playTime=Number($(this).nextAll(".mPlaytime").text());
			mno=$(this).prev(".mNo").val();
			
			var date=new Date(selectDate+" "+startTime);
			var endTime = date.getTime() + (playTime * 60*1000);
			date = new Date(endTime);
			var endHour=date.getHours()+"";
			var endMinute=date.getMinutes()+"";
			
			if(endHour.length==1){
				endHour=0+endHour;
			}
			if(endMinute.length==1){
				endMinute=0+endMinute;
			}	
			$("#endTime").val(endHour+":"+endMinute);
			
		});
		 
		//상영관 추가에서 추가버튼 클릭
		$("#btn").click(function(){
			var selectedTheater=$("#theater_add_list").val();
			var selectDate=$("#selectDate").val();
			var startTime=$("#startTime").val();
			var endTime=$("#endTime").val();

			if(selectedTheater=="상영관을 선택하세요" || selectDate=="" || mno==""){
				alert("모든 항목을 선택해 주세요.");
				return false;
			}
			var wantDate=new Date(selectDate+" "+startTime);
			var endFullTime=new Date(selectDate+" "+endTime);
			
			var tNo=$("#theater_add_list").val();
		 	addScheduleProcess(tNo, $("#selectDate").val(), wantDate.getTime(),mno, endFullTime.getTime());
			
				mno="";
				location.reload();
			
		});
	});
</script>
</head>
<body> 
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
		<div id="container">
			
			<div id="leftContent">
				<h2>상영관별 시간표 확인</h2>
				<div id="select">
					<select id="theater_list">
					
					</select>
				</div>
				<div id="theater_schedule">
				 
				</div>
			</div>
			 
			<div id="rightContent">
				<h2>상영시간표 추가</h2>
				<h4>※상영관, 상영일, 시작시간 입력 후 영화를 선택해 주세요.※</h4>
				<div id="addInfo">
					<table>
						<tr>
							<td>
								<p>상영관:</p>
								<select id="theater_add_list">
								</select><br><br>
								<p>상영일:</p>
								<input id="selectDate" type="date"><br><br>
								<p>시작시간:</p>
								<input id="startTime" type="time" value="10:00"><br><br>
								<p>종료시간:</p>
								<input id="endTime" type="time" value="12:00" disabled="disabled">
							</td>
							<td>
								<div id="movieListDiv">
									<ul id="movieListByDate">
					
									</ul>
								</div>
							</td>
						</tr>
					</table>
					
					<button id="btn">추가</button>
				</div>
				
			</div>
		</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>