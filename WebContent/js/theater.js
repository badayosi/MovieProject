$(function(){
	 //추가 버튼
	 $("form[name='f1']").submit(function(){
		 $(".error, .error2, .error3, .error4, .error5" ).css("display","none");
		 
		 //빈칸 체크
		if(checkInputEmpty($(this).find("input[name]"))==false){
			return false;
		}
		 
	})
	
	//행 입력 계산
	$("input[name='row']").change(function(){
		filterRowAndCol();	
	})
	
	//인원, 열 입력시 행 자동 계산
	$("input[name='col']").change(function() {
		var num = $("input[name='maxcount']").val();
		var i = $("input[name='col']").val();
		var a = num/i;
		a = Math.ceil(a)+64;
		var row = String.fromCharCode(a);
		
		$("input[name='row']").val(row);
	})
	//숫자만 입력
	$("input[name='floor'],input[name='maxcount'],input[name='col']").change(function(){		
		var num = $(this).val();	
		num = num.charCodeAt(0);
		if(num>47&&num<58){
			$(this).parent().find(".error6").css("display","none");
		}else{
			$(this).val("");
			$(this).parent().find(".error6").css("display","block");
		}
	})
	
	$("button").eq(0).click(function(){
		var a = $("input[name='row']").val();
				
		//var i = a.charCodeAt(0)-16;		//영어->숫자
		var i = a.charCodeAt(0)+16;	//숫자->영어
		
		a = String.fromCharCode(i);		//아스키코드->문자
		alert(i + " - " +a);
	})
 })
 
 
 //행 자동 계산
 function filterRowAndCol(){
	 	var a = $("input[name='row']").val();
		a = a.toUpperCase();
		a = a.charCodeAt(0);
		
		if(a>64&&a<91){//대문자 해당
		
		$(".error2").css("display","none");
		var num = $("input[name='maxcount']").val();
		var i = $("input[name='col']").val();
		if(num==""){
			$(".error5").css("display","block");
		}
		if(i==""){
			$(".error4").css("display","block");
		}
		
		var divsion = num/i;
		divsion = Math.ceil(divsion)+64;
		
		if(a>=divsion){
			a = String.fromCharCode(a);
			$("input[name='row']").val(a);
			$(".error3").css("display","none");
		}else{
			$("input[name='row']").val("");
			$(".error3").css("display","block");
		}			
	}else{//대문자아님
		$("input[name='row']").val("");
		$(".error2").css("display","block");
	}
 }


function checkInputEmpty($target){
		
	var errorCount =0;
	
	$target.each(function(i, obj){
		if($(obj).val() == ""){
			var $next  = $(obj).next(".error");
			$next.css("display","block");
			errorCount++;
		}
	})
	if(errorCount>0){
		return false;
	}
	return true;
}