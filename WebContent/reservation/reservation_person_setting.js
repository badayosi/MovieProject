function checkTotalPerson(){
	var checker = 0;
	$("#person_setting select").each(function(index, obj){
		checker += Number($(this).val());
	})
	return checker;
}

function selectPerson(){
	$("#total_person").html(setCount());
}

// 인원설정 초기화
function initPerson(){
	$("#person_setting select").each(function(index, obj){
		$(this).val(0);
	})
}

function changePersonSetting(){
	if(8 < checkTotalPerson()){
		alert("인원은 최대 8명까지 선택할 수 있습니다.");
		initPerson();
	}
	seatAllClear();
	settingDisable();
}

function equalChecker(){
	if(checkTotalPerson() == setCount())
		seatAllBlock();
	else if(checkTotalPerson() > setCount())
		seatRestore();
}