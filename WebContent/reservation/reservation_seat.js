function selectSeat(target){
	// 총 인원 LOAD
	var totalSeat = $("#person_setting").find("select").val();
	// 좌석배치타입 LOAD
	var typeSeat = $("#seat_setting").find("input:checked").val();
	
	// 이미 선택된 좌석일 경우 취소진행
	if($(target).hasClass("selectSeat")){
		target.toggleClass("seat");
		target.toggleClass("overSeat");
		target.toggleClass("selectSeat");
		// 퀵메뉴 SEAT정보 갱신
		applyQuickSeat();
		// 좌석배치설정 갱신_INPUT DISABLE
		settingDisable($("#person_setting").find("select").val() - setCount());
	}
	// 선택된 좌석이 아닐 경우 선택진행
	else{
		// 선택한 좌석수 찾기
		var selectCount = setCount();
		// 예외처리 : 최대인원 이상 선택시
		if(totalSeat-selectCount == 0){
			return;
		}
		// 선택좌석 CSS적용
		target.toggleClass("overSeat");
		var pTarget = target.parent();
		for(var count=$("#seat_setting").find("input:checked").val() ; count>0 ; count--){
			pTarget.find("span").removeClass("seat");
			pTarget.find("span").removeClass("blockSeat");
			pTarget.find("span").toggleClass("selectSeat");
			pTarget = pTarget.next();
		}
		// 선택좌석 제외 BLOCK CLEAR
		settingClear();
		// 퀵메뉴 SEAT정보 갱신
		applyQuickSeat();
		// 좌석배치설정 갱신_INPUT DISABLE
		settingDisable($("#person_setting").find("select").val() - setCount());
	}
}

// 선택한 좌석수 찾기
function setCount(){
	var count = 0;
	
	$(".seatTable").find("td").each(function(index, obj){
		if($(this).find("span").hasClass("selectSeat"))
			count++;
	});
	
	return count;
}

// 좌석배치설정_INPUT VALUE
function settingChange(count){
	// 총 인원 LOAD
	var totalSeat = $("#person_setting").find("select").val()-setCount();
	// 예외처리 : 좌석선택 후 인원수 하향시
	if(totalSeat < 0){
		alert("선택하신 좌석과 인원수가 일치하지 않습니다. 좌석선택을 새로 해주시기 바랍니다.");
		seatAllClear();
	}
	settingDisable(totalSeat);
}

// 좌석배치설정_INPUT DISABLE
function settingDisable(count){
	// 설정 전제 활성화
	$("#seat_setting").find("input").each(function(index, obj){
		$(obj).attr("disabled",false);
	});
	// COUNT기반 체크 비활성화
	$("#seat_setting").find("input").each(function(index, obj){
		if($(obj).val()>count)
			$(obj).attr("disabled",true);
	});
	$("#seat_setting").find("input").eq(0).prop("checked",true);
}

// 좌석배치설정_INPUT CLICK = SEAT BLOCK
function settingChoice(seatCount){
	if(seatCount == 1)
		return;
	else{
		var checker = 0;
		var target = 0;
		var tempTarget = 0;
		var col = 0;
		
		$(".seatTable").find("tr").each(function(rowIndex,rowObj){
			col = $(this).find("td");
			for(var i=0 ; i<col.size() ; i++){
				target = col.eq(i).find("span");
				if(!target.hasClass("reserveSeat") && !target.hasClass("noSeat") && !target.hasClass("selectSeat")){
					checker = 0;
					for(var j=0 ; j<seatCount ; j++){
						tempTarget = col.eq(i+j).find("span");
						if(tempTarget.hasClass("reserveSeat"))
							checker++;
						if(tempTarget.hasClass("noSeat"))
							checker++;
						if((i+j)>=col.size())
							checker++;
					}
					if(checker > 0){
						target.removeClass("seat");
						target.addClass("blockSeat");
					}
				}
			}
		});
	}
	return;
}

// 좌석배치설정_INPUT SELECT SEAT = SEAT BLOCK CLEAR
function settingClear(){
	$(".seatTable").find("td").each(function(index, obj){
		if($(this).find("span").hasClass("blockSeat")){
			$(this).find("span").removeClass("blockSeat")
			$(this).find("span").addClass("seat")
		}
	});
}

// 예외처리 : 좌석선택 초기화
function seatAllClear(){
	// 좌석 초기화
	$(".seatTable").find("td").each(function(index, obj){
		if($(this).find("span").hasClass("selectSeat")){
			$(this).find("span").removeClass("selectSeat")
			$(this).find("span").addClass("seat")
		}
	});
	// 인원 초기화
	$("#person_setting").find("select").val(0);
	// 배치설정 초기화
	$("#seat_setting").find("input").eq(0).attr("disabled",false);
}


// 선택좌석 QUICK MENU 반영
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

// QUICK MENU STRING SPRIT
function splitString(str, type){
	var tempArr = str.split(type);
	
	return tempArr;
}