// 선택좌석/설정인원 매치확인
function checkSeat(){
	var checker = 0;
	var setPerson = $("#person_setting").find("select").val();
	
	// SELECT SEAT 수 파악
	$(".seatTable").find("td").each(function(index,obj){
		if($(obj).find("span").hasClass("selectSeat"))
			checker++;
	});
	// 예외처리 : PERSON SETTING == SELECT SEAT
	if(setPerson == checker){
		confirmReserve();
	}
	if(setPerson > checker){
		alert("설정한 인원과 선택된 좌석의 수가 일치하지 않습니다.\n좌석과 설정인원을 다시 확인해 주세요.");
	}
}

// 최종단계 결제확인
function confirmReserve(){
	var str = "";
	var temp = "";
	var title = new Array();
	str += "최종결제단계 입니다.\n";
	str += "확인 선택 시 아래 항목으로 예약 및 결제됩니다.\n"
	str += "결제정보를 다시 한번 확인해주세요.\n";
	str += "\n";
	temp = $("#select_info").find(".nav_data").eq(0).html();
	title = temp.split("<");
	str += "영화명 : " + $("#nav_title").html() + "\n";
	str += "상영날짜 : " + title[0] + "\n";
	str += "상영시간 : " + $("#select_info").find(".nav_data").eq(1).html() + "\n";
	str += "선택좌석 : " + $("#select_info").find(".nav_data").eq(3).html() + "\n";
	str += "결제금액 : " + $("#total_payment").find(".nav_data").eq(0).html() + "원" + "\n";
	if(confirm(str)){
		fixProgress();
		location.replace("/MovieProject/login/myPage.jsp");
	}
	else
		alert("예약이 취소되었습니다.");
}