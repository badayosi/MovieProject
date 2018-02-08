<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script> 
 <link rel="stylesheet" type="text/css" href="../css/theater.css">
 <script src="../js/theater.js"></script>
 <style type="text/css">
 	form{
		width: 400px;
		border: 1px solid gray;
	}
	label{
		width: 100px;
		float: left;
		padding-left: 10px;
	}
	p:LAST-CHILD {
		text-align: center;
	}
	.error, .error2, .error3, .error4, .error5, .error6{
		color: red;
		padding: 0;
		margin: 0 0 0 90px;
		font-size: 12px;
		display: none;
	} 
	
 </style>
 <script type="text/javascript">
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
 </script>
</head>
<body>
	<form action="insert.do" method="post" name="f1">
		<p>
			<label>상영관이름</label>
			<input type="text" name="name">
			<span class="error">상영관명을 입력하세요</span>
		</p>
		<p>
			<label>층수(위치)</label>
			<input type="text" name="floor">
			<span class="error">위치를 입력하세요</span>
			<span class="error6">숫자로 입력하세요</span>
		</p>
		<p>
			<label>수용인원</label>
			<input type="text" name="maxcount">
			<span class="error">인원을 입력하세요</span>
			<span class="error5">인원을 입력하세요</span>
			<span class="error6">숫자로 입력하세요</span>
		</p>
		<p>
			<label>열(숫자)</label>
			<input type="text" name="col">
			<span class="error">열을 입력하세요</span>
			<span class="error4">열을 입력하세요</span>
			<span class="error6">숫자로 입력하세요</span>
		</p>
		<p>
			<label>행(알파벳)</label>
			<input type="text" name="row" maxlength="1"/>
			<span class="error">행을 입력하세요</span>
			<span class="error2">영어로 입력하세요</span>
			<span class="error3">전체인원을 수용할 수 없습니다</span>
		</p>
		
		<p>
			<label>상영관종류</label>
			<input type="text" name="type">
			<span class="error">상영관 종류를 입력하세요</span>
		</p>
		<p>
			<input type="submit" value="추가">
		</p>
	</form>
</body>
</html>