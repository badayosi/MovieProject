// 퀵메뉴 선택좌석 반영
function applyQuickSeat(){
	var col = null;
	var seat = $("#select_info").find(".nav_data").last();
	
	seat.html("");
	$(".seatTable").find("tr").each(function(rowIndex,rowObj){
		col = $(this).find("td");
		col.each(function(colIndex,colObj){
			if($(colObj).find("span").hasClass("selectSeat")){
				// 퀵메뉴_선택좌석 STRING 추가
				if(seat.html() == "")
					seat.html($(colObj).find("span").html());
				else
					seat.html(seat.html()+"/"+$(colObj).find("span").html());
			}
		});
	});
}

// 퀵메뉴 선택좌석 초기화
function initQuickSeat(){
	$("#nav_data_seat").html("선택좌석");
}

// 퀵메뉴 문자열 분리
function splitString(str, type){
	var tempArr = str.split(type);
	return tempArr;
}

// 퀵메뉴 금액계산
function applyPayment(){
	var arrPerson = new Array();
	var arrPay = new Array();
	var pay = 0;
	
	// 인원&금액 배열화
	$("#person_setting select").each(function(index, obj){
		switch(index){
			case 0:
				pay = 9000;
				break;
			case 1:
				pay = 8000;
				break;
			case 2:
				pay = 5000;
				break;
		}
		if(index == 3){
			arrPerson[index-1] += Number($(this).val());
			arrPay[index-1] += Number($(this).val()) * pay;
		}
		else{
			arrPerson[index] = Number($(this).val());
			arrPay[index] = arrPerson[index] * pay;
		}
	});
	
	// 퀵메뉴 인원&금액 반영
	$("#nav_seat").find(".nav_count").each(function(index,obj){
		$(obj).html(arrPerson[index]);
	});
	var total = 0;
	$("#nav_seat").find(".nav_data").each(function(index,obj){
		if(index != 3){
			$(obj).html(arrPay[index]);
			total += arrPay[index];
		}
		else{
			$(obj).html(total);
		}
	});
	
	formatPayment();
}

// 퀵메뉴 상태 확인
function checkPositionByQuick(){
	if($("#quick-menu").css("right") == "-500px")
		return "close";
	if($("#quick-menu").css("right") == "0px")
		return "open";
}

// 퀵메뉴 열기
function openQuick(){
	$("#open_btn").rotate("180deg");
	$("#quick-menu").animate({"right":"0px"},300);
	
}

// 퀵메뉴 닫기
function closeQuick(){
	$("#open_btn").rotate("0deg");
	$("#quick-menu").animate({"right":"-500px"},300);
}

//금액관련 포맷변경
function formatPayment(){
	$("#nav_seat").find(".nav_data").each(function(index,obj){
		var str = $(this).html();
		var temp = str.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(this).html(temp);
	});
}