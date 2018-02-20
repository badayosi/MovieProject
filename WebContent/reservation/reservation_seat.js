function selectSeat(target){
	// 총 인원 LOAD
	var totalSeat = checkTotalPerson();
	// 예외처리 : 인원선택여부
	if(totalSeat < 1){
		alert("인원을 설정해주세요");
		return;
	}
	
	// 이미 선택된 좌석일 경우 취소진행
	if($(target).hasClass("selectSeat")){
		target.toggleClass("seat");
		target.toggleClass("overSeat");
		target.toggleClass("selectSeat");
		// 퀵메뉴 SEAT정보 갱신
		applyQuickSeat();
	}
	// 선택된 좌석이 아닐 경우 선택진행
	else{
		// 선택좌석 CSS적용
		target.toggleClass("overSeat");
		var pTarget = target.parent();
		for(var count=$("#seat_setting").find("input:checked").val() ; count>0 ; count--){
			pTarget.find("span").removeClass("seat");
			pTarget.find("span").removeClass("blockSeat");
			pTarget.find("span").toggleClass("selectSeat");
			pTarget = pTarget.next();
		}
		// 퀵메뉴 SEAT정보 갱신
		applyQuickSeat();
		// 퀵메뉴 PAY정보 갱신
		applyPayment();
	}
	// 선택좌석 정보 갱신
	selectPerson();
	// 좌석배치설정 갱신
	settingDisable();
	// 좌석블록 및 복구처리
	equalChecker();
}

// AJAX_선택좌석을 예약진행중으로 변경(PROGRESS:1)
function setProgress(){
	var selectSeat = null;
	var timeTableNo = null;
	
	// 예외처리 : 확인된 좌석이 없을 시 AJAX호출 금지
	if($("#select_info").find(".nav_data").eq(3).html() == ""){
		console.log("FUNCTION : setProgress fail");
		return;
	}
	// 좌석이 확인될 경우 AJAX호출 시작
	else{
		selectSeat = $("#select_info").find(".nav_data").eq(3).html();
		timeTableNo = $("#timeNo").val();		
	}		
	
	$.ajax({
		url:"reservationAjax.do?seat=" + selectSeat + "&timetableNo=" + timeTableNo,
		type:"get",
		dataType:"json",
		success:function(json){
			console.log("setProgress success");
			console.log(json);
			
			if(json.error != null){
				alert(json.error);
				location.replace(json.solution);
			}
		}
	});
}

// AJAX_현재 진행된 예약내용을 FIX(PROGRESS:2)
function fixProgress(){
	var timeTableNo = $("#timeNo").val();
	$.ajax({
		url:"reservationAjax.do?circultKey=fix&timetableNo=" + timeTableNo,
		type:"get",
		dataType:"json",
		success:function(json){
			console.log("fixProgress success");
			console.log(json);
			
			if(json.error != null){
				alert(json.error);
				location.replace(json.solution);
			}
		}
	});
}

//AJAX_현재 진행된 예약내용을 CANCLE(PROGRESS:0)
function cancleProgress(){
	var timeTableNo = $("#timeNo").val();
	$.ajax({
		url:"reservationAjax.do?circultKey=cancle&timetableNo=" + timeTableNo,
		type:"get",
		dataType:"json",
		success:function(json){
			console.log("cancleProgress success");
			console.log(json);
			
			$("#person_setting").find("select").val(0);
			
			if(json.error != null){
				alert(json.error);
				location.replace(json.solution);
			}
		}
	});
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

// 예외처리 : PERSON SETTING 총인원 초과금지
function checkPersonSetting(){
	var allCount = 0;
	
	$("#person_setting").find("input").each(function(index,obj){
		allCount += Number($(obj).val());
	});
	
	if($("#person_setting").find("select").val() < allCount){
		alert("해당 설정은 총 인원을 초과할 수 없습니다.");
		$("#person_setting").find("input").each(function(index,obj){
			$(obj).val(0);
		});
		return false;
	}
	
	return true;
}

// QUICK MENU PERSON TYPE & TOTAL PAYMENT APPLY
function applyPayment(){
	var arrPerson = new Array();
	var arrPay = new Array();
	var allCount = 0;
	
	// 각 항목별 인원 합산
	$("#person_setting").find("input").each(function(index,obj){
		if(index == 3){
			arrPerson[index-1] += Number($(obj).val());
		}
		else{
			arrPerson[index] = Number($(obj).val());
		}
		allCount += Number($(obj).val());
	});
	
	// 총 인원과 세부인원 총 합계가 미 일치시 성인으로 카운터 정산
	if($("#person_setting").find("select").val() > allCount)
		arrPerson[0] += $("#person_setting").find("select").val()-allCount;
		
	// QUICK 인원 반영 및 계산
	$("#nav_seat").find(".nav_count").each(function(index,obj){
		$(obj).html(arrPerson[index]);
		switch (index) {
			case 0:
				arrPay[index] = arrPerson[index]*9000;
				break;
			case 1:
				arrPay[index] = arrPerson[index]*8000;
				break;
			case 2:
				arrPay[index] = arrPerson[index]*5000;
				break;
		}
		
	})
	
	// QUICK 금액 반영
	$("#nav_seat").find(".nav_data").each(function(index,obj){
		if(index != 3)
			$(obj).html(arrPay[index]);
	});
	
	var total = 0;
	// QUICK 총 금액 반영
	$("#nav_seat").find(".nav_data").each(function(index,obj){
		if(index != 3)
			total += Number($(obj).html());
		else
			$(obj).html(total);
	})
}