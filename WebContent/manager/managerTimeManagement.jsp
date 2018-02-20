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
		width:1000px;
		margin:0 auto;
		text-align: center;
	}
	#container #theater_schedule{
		width:800px;
		margin:0 auto;
		text-align:center;
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
					makeTag += "상영시간(시작-종료)";
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
	
	function addTimeTable(){
		$.ajax({
			url:"managerAjax.do?type=insert&target=timetable",
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
			
			if(newDate.getHours() < 10)
				hourStr = "0" + newDate.getHours();
			else
				hourStr = newDate.getHours();
			
			return hourStr + ":" + newDate.getMinutes();
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
	
	$(function(){
		loadTheater();
		
		// 상영관 선택 시
		$("#theater_list").on("change",function(){
			$("#theater_schedule").empty();
			loadTheaterById($("#theater_list").val());
			
		});
		$(document).on("click", "#go",function(){
			if($("#theater_list").val()=="상영관을 선택하세요"){
				alert("상영관을 선택해주세요.");
				return false;
			}else{
				$("#go").attr("href","managerTheaterSchedule.jsp?no="+$(this).val());
			}
		});
	});
</script>
</head>
<body> 
	<jsp:include page="../include/adminHeader.jsp"></jsp:include>
		<div id="container">
			<div id="select">
			
				<select id="theater_list">
				
				</select>
				<a id="go" href="managerTheaterSchedule.jsp?"><input type="button" name="add_list" value="상영 스케줄 추가"></a>
			</div>
			<div id="theater_schedule">
			
			</div>
		</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>