function selectSeat(target){
	// 총 인원 LOAD
	var totalSeat = checkTotalPerson();
	// 예외처리 : 인원선택여부
	if(totalSeat < 1){
		alert("인원을 설정해주세요");
		return;
	}
	// 예외처리 : 좌석선택에 따른 퀵메뉴 오픈처리
	if(setCount() == 0 && checkPositionByQuick() == "close"){
		openQuick();
	}
	
	// 이미 선택된 좌석일 경우 취소진행
	if($(target).hasClass("selectSeat")){
		target.addClass("seat");
		overSeatAllClear();
		target.removeClass("selectSeat");
		// 퀵메뉴 SEAT정보 갱신
		applyQuickSeat();
	}
	// 선택된 좌석이 아닐 경우 선택진행
	else{
		// 선택좌석 CSS적용
		target.removeClass("overSeat");
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
	// 좌석블록 및 복구처리
	equalChecker();
	// 좌석배치설정 갱신
	settingDisable();
	// AJAX호출
	setProgress();
}

// AJAX_선택좌석을 예약진행중으로 변경(PROGRESS:1)
function setProgress(){
	var selectSeat = null;
	var timeTableNo = null;
	var totalPayment = "";
	var temp = "";
	
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
	
	temp = $("#total_payment").find(".nav_data").html().split(",");
	for(var i=0 ; i<temp.length ; i++)
		totalPayment += temp[i];
	
	$.ajax({
		url:"reservationAjax.do?seat=" + selectSeat + "&timetableNo=" + timeTableNo + "&pay=" + totalPayment,
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
//AJAX_현재 진행된 예약내용을 FIX(PROGRESS:2)
function fixProgress(){
	var timeTableNo = $("#timeNo").val();
	$.ajax({
		url:"reservationAjax.do?circultKey=fix&timetableNo=" + timeTableNo,
		type:"get",
		dataType:"json",
		success:function(json){
			console.log("fixProgress success");
			console.log(json);
		}
	});
}

// AJAX_현재 진행된 예약내용을 CANCLE(DELETE)
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