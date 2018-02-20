// 선택좌석 확인
function setCount(){
	var count = 0;
	$(".seatTable").find("td").each(function(index, obj){
		if($(this).find("span").hasClass("selectSeat"))
			count++;
	});
	
	return count;
}

// 선택좌석 초기화
function seatAllClear(){
	$(".seatTable").find("td").each(function(index, obj){
		if($(this).find("span").hasClass("selectSeat")){
			$(this).find("span").removeClass("selectSeat")
			$(this).find("span").addClass("seat")
		}
		if($(this).find("span").hasClass("blockSeat")){
			$(this).find("span").removeClass("blockSeat")
			$(this).find("span").addClass("seat")
		}
	});
}

// 좌석 선택불가 처리
function seatAllBlock(){
	$(".seatTable").find("td").each(function(rowIndex,rowObj){
		if($(this).find("span").hasClass("seat")){
			$(this).find("span").removeClass("seat")
			$(this).find("span").addClass("blockSeat")
		}
	});
}

// 선택불가좌석 복구 처리
function seatRestore(){
	$(".seatTable").find("td").each(function(rowIndex,rowObj){
		if($(this).find("span").hasClass("blockSeat")){
			$(this).find("span").removeClass("blockSeat")
			$(this).find("span").addClass("seat")
		}
	});
}

// 좌석배치설정 활성화
function settingDisable(){
	// 설정 전체 활성화
	$("#seat_setting").find("input").each(function(index, obj){
		$(obj).attr("disabled",false);
	});
	// 설정 인원에 따른 비활성화
	$("#seat_setting").find("input").each(function(index, obj){
		if($(obj).val()<=(checkTotalPerson()-setCount())){
			$(obj).attr("disabled",false);
			$("#seat_setting").find("input").eq(index).prop("checked",true);
		}
		else
			$(obj).attr("disabled",true);
	});
	settingChoice($("#seat_setting input:checked").val());
}

// 좌석배치설정 CHECK 적용
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